# frozen_string_literal: true

module Exceptions
  class AlphaMissing < StandardError
    def initialize
      super("Alpha can not be blank!")
    end
  end

  class LocaleMissing < StandardError
    def initialize
      super("Locale can not be blank!")
    end
  end

  class LocaleNotFound < StandardError
    def initialize(locale)
      super("Locale \"#{locale}\" was not found!")
    end
  end
end
