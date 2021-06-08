# frozen_string_literal: true

require "pry"

module Country
  # TODO: validate valid alpha2
  # TODO: validate valid locale
  # TODO: allow receiving downcase alpha2
  # TODO: allow receiving downcase locale
  # TODO: add exception cases
  def Country(alpha2, locale)
    (locale_file || {})[alpha2]
  end

  private

  def locale_file
    @locale_file ||=
      begin
        YAML.load_file(locale_path(locale))
      rescue Errno::ENOENT
        {}
      end
  end

  def locale_path(locale)
    "./lib/country/locales/#{locale}.yml"
  end
end
