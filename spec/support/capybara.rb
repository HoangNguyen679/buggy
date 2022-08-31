# frozen_string_literal: true

require 'capybara/rspec'
require 'capybara/apparition'

Capybara.default_driver = :apparition
Capybara.javascript_driver = :apparition
