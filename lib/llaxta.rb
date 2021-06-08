# frozen_string_literal: true

require "pry"
require "yaml"

class Llaxta
  # TODO: validate valid alpha2
  # TODO: validate valid locale
  # TODO: allow receiving downcase alpha2
  # TODO: allow receiving downcase locale
  # TODO: add exception cases

  def self.t(alpha2, locale)
    load_locale(locale)[alpha2]
  end

  private

  def self.load_locale(locale)
    @@locales ||= {}
    @@locales[locale] ||=
      begin
        YAML.load_file(locale_path(locale))
      rescue Errno::ENOENT
        {}
      end
  end

  def self.locale_path(locale)
    "./lib/country/locales/#{locale}.yml"
  end
end
