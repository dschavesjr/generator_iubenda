# A Ruby App to Generate a Document
# based on a template using datasets

require_relative 'lib/template'
require_relative 'lib/generator'

puts 'Enter with template file name (example.txt):'
template = Template.new(gets.chomp)
puts template.valid? ? Generator.new.generate_document(template) : 'Template not found'