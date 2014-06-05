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

  it 'finds the definition for a given word and multiple non-pluralized reference' do
    input = {
      "word" => {
        "definition" => "a {collection} of {letters}.",
        "url" => "//example.com/word"
      },
      "collection" => {
        "definition" => "a group of something.",
        "url" => "//example.com/collection"
      },
      "letters" => {
        "definition" => "some characters",
        "url" => "//example.com/letters"
      }
    }

    reference = Dictionary.new(input).references("word")

    expected = {
      "definition" => "a collection of letters.",
      "see_also" => ["//example.com/collection", "//example.com/letters"]
    }

    expect(reference).to eq expected
  end
end