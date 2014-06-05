class Dictionary
  def initialize(content)
    @content = content
  end

  def references(word)
    result = {}

    result['definition'] = @content[word]['definition'].gsub(/{|}/, '')

    result['see_also'] = []
    
    found_references = @content[word]['definition'].scan(/{\w+}/)
    found_references.each do |ref|
      reference = ref.gsub(/{|}/, '')
      reference.chop! if reference.end_with?('s')
      result['see_also'] << @content[reference]['url']
    end

    result
  end
end