# frozen_string_literal: true

require "rspec"
require "llaxta"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect # disables `should`
  end
end
