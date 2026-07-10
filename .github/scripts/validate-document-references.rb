#!/usr/bin/env ruby
# frozen_string_literal: true

require "pathname"
require "uri"
require "yaml"

ROOT = Pathname.new(Dir.pwd).realpath
REPOSITORY = ENV.fetch("GITHUB_REPOSITORY", "matharts/.github")
ERRORS = []

files = Dir.glob("**/*", File::FNM_DOTMATCH).reject { |f| f.start_with?(".git/") || File.directory?(f) }
markdown = files.grep(/\.md$/)

error = lambda do |file, line, message|
  puts "::error file=#{file},line=#{line}::#{message}"
  ERRORS << message
end

resolve_reference = lambda do |file, target|
  target = target.delete_prefix("<").delete_suffix(">")
  target = target.split(/\s+/, 2).first
  return if target.nil? || target.empty? || target.start_with?("#")

  path_target = target.split(/[?#]/, 2).first
  repository = Regexp.escape(REPOSITORY)

  case path_target
  when %r{\Ahttps://github\.com/#{repository}/(?:blob|tree)/(?:main|master)/(.+)\z}
    ROOT.join(URI::DEFAULT_PARSER.unescape(Regexp.last_match(1))).cleanpath
  when %r{\Ahttps://raw\.githubusercontent\.com/#{repository}/(?:main|master)/(.+)\z}
    ROOT.join(URI::DEFAULT_PARSER.unescape(Regexp.last_match(1))).cleanpath
  else
    return if path_target.match?(%r{\A[a-z][a-z0-9+.-]*:}i)

    ROOT.join(File.dirname(file), URI::DEFAULT_PARSER.unescape(path_target)).cleanpath
  end
end

markdown.each do |file|
  File.foreach(file, encoding: "UTF-8").with_index(1) do |line, number|
    line.scan(/!?\[[^\]]*\]\(([^)]+)\)/).each do |match|
      target = match.first
      path = resolve_reference.call(file, target)
      next if path.nil?

      inside_root = path == ROOT || path.to_s.start_with?("#{ROOT}#{File::SEPARATOR}")
      unless inside_root
        error.call(file, number, "Documentation reference escapes repository root: #{target}")
        next
      end

      error.call(file, number, "Missing documentation reference: #{target}") unless path.exist?
    end
  end
end

Dir.glob(".github/workflows/*.{yml,yaml}").each do |file|
  File.foreach(file, encoding: "UTF-8").with_index(1) do |line, number|
    if (match = line.match(/^\s*uses:\s*["']?(\.\/[^"'\s#]+)/))
      path = ROOT.join(match[1].delete_prefix("./"))
      unless path.exist? && (path.file? || path.join("action.yml").file? || path.join("action.yaml").file?)
        error.call(file, number, "Missing local action reference: #{match[1]}")
      end
    end
  end
end

exit ERRORS.empty? ? 0 : 1
