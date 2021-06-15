# frozen_string_literal: true

require "yaml"
require "llaxta/exceptions"

class Llaxta
  VERSION = Gem::Version.new("0.0.4")

  class << self
    # @param [String] alpha2
    # @param [String] locale
    # @return [String]
    def t(alpha2, locale)
      raise Exceptions::AlphaMissing unless alpha2

      dictionary(locale)[alpha2]
    end

    # @param [String] country_name
    # @param [String] locale
    # @return [String]
    def alpha2(country_name, locale)
      dictionary(locale).key(country_name)
    end

    private

    # @param [String] locale
    # @return [Hash<String, String>]
    def dictionary(locale)
      @@locales ||= {}
      @@locales[locale] ||= new(locale).send(:load_dict)
    end
  end

  private

  attr_reader :locale

  SUPPORTED_LOCALES = {
    "en_us" => "en_us",
    "us" => "en_us",
    "es" => "es",
    "pt_br" => "pt_br",
    "br" => "pt_br",
    "zh_cn" => "zh_cn",
    "cn" => "zh_cn",
  }.freeze
  private_constant :SUPPORTED_LOCALES

  # @param [String] locale
  # @return [void]
  def initialize(locale)
    raise Exceptions::LocaleMissing unless locale

    @locale = SUPPORTED_LOCALES[locale]
  end

  # @return [void]
  # @raise [Exceptions::LocaleNotFound] if unable to load a YAML file given an unexpected locale
  def load_dict
    YAML.load_file(locale_path)
  rescue Errno::ENOENT
    raise Exceptions::LocaleNotFound.new(locale)
  end

  # @return [String]
  def locale_path
    File.expand_path("../llaxta/locales/#{locale}.yml", __FILE__)
  end
end
