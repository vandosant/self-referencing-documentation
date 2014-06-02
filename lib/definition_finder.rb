require 'json'

class DefinitionFinder
  def initialize(json)
    @json = JSON.parse(json)
  end

  def find_references(word)
    result = {definition: @json[word]['definition']}

    reference = ''
    if result[:definition].include?('{')
      start = result[:definition].index('{')
      finish = result[:definition].index('}')
      reference = result[:definition][start+1...finish]
      result[:see_also] = @json[reference]['url']
      result[:definition].gsub!('{', '')
      result[:definition].gsub!('}', '')
    end


    result
  end
end