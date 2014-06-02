require 'spec_helper'
require_relative '../lib/definition_finder'

describe DefinitionFinder do
  it 'finds a word' do
    json_data = <<-INPUT.chomp
{
  "pie": {
    "definition": "a pastry",
    "url": "//example.com/pie"
  }
}
INPUT
    definition = DefinitionFinder.new(json_data)

    actual = definition.find_references('pie')

    expected = {
      definition: "a pastry"
    }

    expect(actual).to eq expected
  end

  it 'finds a reference' do
    json_data = <<-INPUT.chomp
{
  "pie": {
    "definition": "a {pastry}",
    "url": "//example.com/pie"
  },
  "pastry": {
    "definition": "a baked product made from ingredients such as flour, sugar, milk, butter, and eggs",
    "url": "//example.com/pastry"
  }
}
    INPUT
    definition = DefinitionFinder.new(json_data)

    actual = definition.find_references('pie')

    expected = {
      definition: "a pastry",
      see_also: "//example.com/pastry"
    }

    expect(actual).to eq expected
  end

  it 'finds multiple references' do
    pending
    json_data = <<-INPUT.chomp
{
  "pie": {
    "definition": "a {pastry} filled with {fruit}",
    "url": "//example.com/pie"
  },
  "pastry": {
    "definition": "a baked product made from ingredients such as flour, sugar, milk, butter, and eggs",
    "url": "//example.com/pastry"
  },
  "fruit": {
    "definition":
  }
}
    INPUT
    definition = DefinitionFinder.new(json_data)

    actual = definition.find_references('pie')

    expected = {
      definition: "a pastry",
      see_also: "//example.com/pastry"
    }

    expect(actual).to eq expected
  end
end
