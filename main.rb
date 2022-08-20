# A Ruby App to Generate a Document
# based on a template using datasets

class ParseDataset

end

class ParseTemplate

end

class Section

end

class Clause

end

class Template

end

class Generator

end

puts 'Enter with template file name (example.txt):'
template = Template.new(gets)
puts Generator.create_document(template)