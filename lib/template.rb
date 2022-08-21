require_relative './loaders'
require_relative './parsers'

class Template
    attr_reader :text

    def initialize (name, loader: TemplateLoader.new(TemplateFileParser.new))
        @text = loader.load(name)
    end

    def all_clauses_ids
        clauses_ids = @text.enum_for(:scan, /\[CLAUSE\-\d+\]/).map do |tag|
            tag.scan(/\d+/)[0].to_i
        end.uniq
    end

    def all_sections_ids
        section_ids = @text.enum_for(:scan, /\[SECTION\-\d+\]/).map do |tag|
            tag.scan(/\d+/)[0].to_i
        end.uniq
    end

    def valid?
        @text.nil? ? false : true
    end
end