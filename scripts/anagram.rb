# frozen_string_literal: true

# !/usr/bin/env ruby
require File.expand_path("../../config/environment", __FILE__)

require "pry"
require "json"

# TODO: The anagrams descend from the length of the word they could increase?

# This script is intended to take a word and find all possible anagrams for it.
# It will then output to a JSON file.

# Description:
#
# Two methods anagram and dictionary_lookup
# -----------------------------------------------------------------------------
# Methods {{{1

# Permutation - When invoked with a block, yield all permutations of length n
# of the elements of the array, then return the array itself. If n is not
# specified, yield all permutations of all elements.
#
# Use permutation to get all combinations of the length of the array. Use the
# method to_a to return an Array. Group_by joins the Array as a group creating a
# key for each variation and an array of the adjoined letters.
#
def anagram(word, default = 0)
  raise ArgumentError, "Word must be an Array" unless word.class == Array
  if default != 0
    word.permutation(default).to_a.group_by { |i| i.join }
  else
    word.permutation.to_a.group_by { |i| i.join }
  end
end

# Excepts Array or String
#
# Description:
# Pass in the found permutation Keys. Using the Where method on the Dictionary
# call. This will return a record for each item found, in one call.
#
def dictionary_lookup(term)
  Dictionary.all.where(word: term)
end

# }}}
# -----------------------------------------------------------------------------

# Type: String < Object
#
# Description:
# Turn the string Arg into a Array of chars. This needs to be turned into a
# Array of words that can be looked for.
#
word = "definition".chars

# Description:
#
# Build the data structure.
# results search_term:
# results total_count:
# results count_for_each_length:
# index:
#
# -----------------------------------------------------------------------------
# Build Data Structure {{{1

# Result Hash
result = Hash.new { |h, k| h[k] = Hash.new }

# Search Term
result[:results][:search_term] = word.join

# Take the length of the word and create a Range. We know we dont want any
# results less than 2 words so our range is 2..n use this to populate the Array
# we will then iterate over. This is the sub Word.length results.
# Example: Word.length == 7, it will also find results for 6-5-4-3-2
#
n = word.join.length
word_length = (2..n).to_a.reverse

word_length.each do |index|
  result[index] = dictionary_lookup(anagram(word, index).keys)
  binding.pry
end

result_value_count = []

# Create A count of the sum total of Values.
result.each { |k, v| result_value_count << v.count if k.class == Integer  }
result[:results][:total_count] = result_value_count.sum

# create a count of each Keys result
result.each { |k, v| result[:results][k] = v.count if k.class == Integer  }

# }}}
# -----------------------------------------------------------------------------

# Description:
# Pass in the file_name_json String Varaible. Create a file after the name
# given. Generate a JSON document from the ActiveRecord Records.
#
# -----------------------------------------------------------------------------
# JSON {{{1
#
# Make directory based on first letter alphabet

# Use the first leter of the word to create a alphabet directory.
dir = "anagrams/#{word[0]}"

# Create Directory if the directory does not exist
FileUtils.mkdir_p(dir)

if result.present?
  output_file = "anagrams/#{word[0]}/" + "#{word.join}" + ".json"
  File.open(output_file, "w") { |f| f.write(JSON.pretty_generate(result.as_json)) }
else
  puts "No results found"
end

# }}}
# -----------------------------------------------------------------------------
