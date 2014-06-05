require 'json'
require 'pp'

pp JSON.parse(File.read('data/dictionary.json'))
