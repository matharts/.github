#!/usr/bin/env ruby
# frozen_string_literal: true

require "set"
require "yaml"

LABEL_CONFIG = ENV.fetch("LABEL_CONFIG", ".github/labels.yml")
ISSUE_TEMPLATE_GLOB = ".github/ISSUE_TEMPLATE/*.{yml,yaml}"
ERRORS = []

labels = YAML.safe_load(
  File.read(LABEL_CONFIG, encoding: "UTF-8"),
  permitted_classes: [],
  permitted_symbols: [],
  aliases: false
)

unless labels.is_a?(Array)
  warn "#{LABEL_CONFIG} 的根节点必须是数组。"
  exit 1
end

canonical_names = labels.map do |entry|
  next unless entry.is_a?(Hash)

  name = entry["name"].to_s.strip
  name unless name.empty?
end.compact.to_set

Dir.glob(ISSUE_TEMPLATE_GLOB).sort.each do |file|
  document = YAML.safe_load(
    File.read(file, encoding: "UTF-8"),
    permitted_classes: [],
    permitted_symbols: [],
    aliases: false
  )

  next unless document.is_a?(Hash)

  Array(document["labels"]).each do |label|
    name = label.to_s.strip
    next if name.empty? || canonical_names.include?(name)

    puts "::error file=#{file}::Issue Form 使用了非正式标签：#{name}"
    ERRORS << [file, name]
  end
end

exit ERRORS.empty? ? 0 : 1
