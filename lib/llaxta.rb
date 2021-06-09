# frozen_string_literal: true

require "pry"
require "yaml"
require "llaxta/exceptions"

class Llaxta
  VERSION = Gem::Version.new("0.0.1")

  def self.t(alpha2, locale)
    raise Exceptions::AlphaMissing unless alpha2

    dictionary(locale)[alpha2]
  end

  def self.dictionary(locale)
    @@locales ||= {}
    @@locales[locale] ||= new(locale).load_dict
  end

  def initialize(locale)
    raise Exceptions::LocaleMissing unless locale

    @locale = sanitize_locale(locale)
  end

  def load_dict
    YAML.load_file(locale_path)
  rescue Errno::ENOENT
    raise Exceptions::LocaleNotFound.new locale
  end

  private

  attr_reader :locale

  def sanitize_locale(locale)
    language, country = locale.split("_")
    [language.downcase, country&.upcase].compact.join("_")
  end

  def locale_path
    File.expand_path("../llaxta/locales/data/#{locale}/country.yaml", __FILE__)
  end
end
