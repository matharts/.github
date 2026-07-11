#!/usr/bin/env ruby
# frozen_string_literal: true

ACTION_FILE_GLOBS = [
  ".github/workflows/*.{yml,yaml}",
  ".github/actions/**/action.{yml,yaml}"
].freeze
LOCAL_REFERENCE_PREFIXES = ["./", "docker://"].freeze
FULL_COMMIT_SHA = /\A[0-9a-fA-F]{40}\z/
USES_PATTERN = /^\s*(?:-\s*)?uses\s*:\s*(?:"([^"]+)"|'([^']+)'|([^#\s]+))/

files = ACTION_FILE_GLOBS.flat_map { |pattern| Dir.glob(pattern) }.uniq.sort
errors = []
external_references = 0

if files.empty?
  warn "未找到需要检查的 GitHub Actions 工作流或 Action 元数据。"
  exit 1
end

files.each do |file|
  File.foreach(file, encoding: "UTF-8").with_index(1) do |line, number|
    match = line.match(USES_PATTERN)
    next unless match

    reference = match.captures.compact.first.to_s.strip
    next if reference.start_with?(*LOCAL_REFERENCE_PREFIXES)

    external_references += 1
    action, separator, revision = reference.rpartition("@")
    next if separator == "@" && !action.empty? && FULL_COMMIT_SHA.match?(revision)

    message = "外部 Action 必须固定到完整的 40 位 Commit SHA：#{reference}"
    puts "::error file=#{file},line=#{number},title=Mutable GitHub Action reference::#{message}"
    errors << [file, number, reference]
  end
end

if errors.empty?
  puts "已验证 #{external_references} 个外部 GitHub Action 引用，全部固定到完整 Commit SHA。"
  exit 0
end

warn "发现 #{errors.length} 个可移动或无效的外部 GitHub Action 引用。"
exit 1
