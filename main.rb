# A Ruby App to Generate a Document
# based on a template using datasets

require_relative 'lib/template'
require_relative 'lib/generator'

puts 'Enter with template file name ():'
#template = Template.new(gets.chomp)
template = Template.new('example.txt')
puts template.valid? ? Generator.new.generate_document(template) : 'Template not found'
puts template.text
