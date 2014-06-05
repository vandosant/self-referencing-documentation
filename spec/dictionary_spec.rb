require 'rspec'
require_relative '../lib/dictionary'

describe Dictionary do
  it 'finds the definition for a given word and one non-pluralized reference' do
    input = {
      "word" => {
        "definition" => "a {collection} of letters.",
        "url" => "//example.com/word"
      },
      "collection" => {
        "definition" => "a group of something.",
        "url" => "//example.com/collection"
      }
    }

    reference = Dictionary.new(input).references("word")

    expected = {
      "definition" => "a collection of letters.",
      "see_also" => ["//example.com/collection"]
    }

    expect(reference).to eq expected
  end

  it 'finds the definition for a given word and multiple pluralized references' do
    input = {
      "word" => {
        "definition" => "a {collection} of {letters}.",
        "url" => "//example.com/word"
      },
      "collection" => {
        "definition" => "a group of something.",
        "url" => "//example.com/collection"
      },
      "letter" => {
        "definition" => "some characters",
        "url" => "//example.com/letter"
      }
    }

    reference = Dictionary.new(input).references("word")

    expected = {
      "definition" => "a collection of letters.",
      "see_also" => ["//example.com/collection", "//example.com/letter"]
    }

    expect(reference).to eq expected
  end
end