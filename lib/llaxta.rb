# frozen_string_literal: true

require "pry"
require "yaml"
require "llaxta/exceptions"

class Llaxta
  VERSION = Gem::Version.new("0.0.1")

  def self.t(alpha2, locale)
    dictionary = new(alpha2, locale).send(:load_dict)
    dictionary[alpha2]
  end

  def initialize(alpha, locale)
    alpha ? @alpha = alpha : raise(Exceptions::AlphaMissing)
    locale ? @locale = locale : raise(Exceptions::LocaleMissing)
    parse_locale!
  end

  private

  attr_reader :locale, :alpha

  def load_dict
    @@locales ||= {}
    @@locales[locale] ||=
      begin
        YAML.load_file(locale_path)
      rescue Errno::ENOENT
        raise Exceptions::LocaleNotFound.new locale
      end
  end

  def parse_locale!
    language, country = locale.split("_")
    @locale = [language.downcase, country&.upcase].compact.join("_")
  end

  def locale_path
    File.expand_path("../llaxta/locales/data/#{locale}/country.yaml", __FILE__)
  end
end
