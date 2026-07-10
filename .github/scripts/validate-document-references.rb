#!/usr/bin/env ruby
# frozen_string_literal: true

require "pathname"
require "uri"
require "yaml"

ROOT = Pathname.new(Dir.pwd).realpath
ERRORS = []

files = Dir.glob("**/*", File::FNM_DOTMATCH).reject { |f| f.start_with?(".git/") || File.directory?(f) }
markdown = files.grep(/\.md$/)

error = lambda do |file, line, message|
  puts "::error file=#{file},line=#{line}::#{message}"
  ERRORS << message
end

markdown.each do |file|
  File.foreach(file, encoding: "UTF-8").with_index(1) do |line, number|
    line.scan(/!?\[[^\]]*\]\(([^)]+)\)/).each do |match|
      target = match.first.split(/\s+/, 2).first
      next if target.nil? || target.empty? || target.start_with?("#") || target.match?(%r{\A[a-z][a-z0-9+.-]*:}i)

      path = ROOT.join(File.dirname(file), URI::DEFAULT_PARSER.unescape(target.split(/[?#]/, 2).first)).cleanpath
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
