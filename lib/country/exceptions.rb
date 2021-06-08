module Exceptions
  class AlphaNotFound < StandardError
    def initialize
      super("Alpha was not found!")
    end
  end
end
