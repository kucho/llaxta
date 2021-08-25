# frozen_string_literal: true

require "llaxta/exceptions"
require "json"
require "yaml"

class Llaxta
  VERSION = Gem::Version.new("0.1.0")

  class << self
    def s(input)
      case s.length
      when 2
        # TODO: Implement trie
      when 3
        # TODO: Implement trie
      else
        # TODO: Implement trie
      end
    end

    def l(alignment: -1, term: nil, alpha: nil, locale: "en")
      list = case alpha
      when 2
        @@countries_alpha2 ||= mapamundi.map { |e| e[:"alpha-2"] }
      when 3
        @@countries_alpha3 ||= mapamundi.map { |e| e[:"alpha-3"] }
      else
        @@countries_names ||= mapamundi.map { |e| e[:name] }
      end

      filter(term&.downcase, alignment, list)
    end

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

    # @return [Array[Hash]]
    def mapamundi
      @@countries ||= new("us").send(:load_countries)
    end

    def filter(term, aligment, list)
      return list unless term

      selected = case aligment
      when -1
        list.filter { |e| e.downcase.start_with?(term) }
      when 0
        list.filter { |e| e.downcase.include?(term) }
      when 1
        list.filter { |e| e.downcase.end_with?(term) }
      else
        raise Exceptions::AlignmentError
      end
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
    "cn" => "zh_cn"
  }.freeze
  private_constant :SUPPORTED_LOCALES

  # @param [String] locale
  # @return [void]
  def initialize(locale)
    raise Exceptions::LocaleMissing unless locale

    @locale = SUPPORTED_LOCALES[locale]
  end

  # @return [Hash]
  # @raise [Exceptions::LocaleNotFound] if unable to load a YAML file given an unexpected locale
  def load_dict
    YAML.load_file(locale_path)
  rescue Errno::ENOENT
    raise Exceptions::LocaleNotFound.new(locale)
  end

  # @return [Array[Hash]]
  def load_countries
    JSON.parse(File.read(countries_path), symbolize_names: true)
  end

  # @return [String]
  def countries_path
    File.expand_path("../llaxta/data/countries.json", __FILE__)
  end

  # @return [String]
  def locale_path
    File.expand_path("../llaxta/locales/#{locale}.yml", __FILE__)
  end
end
