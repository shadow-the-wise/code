# frozen_string_literal: true

# !/usr/bin/env ruby
require File.expand_path("../../config/environment", __FILE__)

require "pry"
require "json"

# Create Dictionary
diction = File.read("dataset/dictionary.txt").split

# Create the datbase
diction.each do |w|
  Dictionary.find_or_create_by(word: w)
end
