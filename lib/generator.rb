require_relative './clause'
require_relative './section'
require_relative './template'

class Generator
    def generate_document(template)
        return nil unless template.is_a? Template
        return nil unless template.valid?

        @text_to_document = template.text

        replace_tags()
    end

    def all_clauses_ids(template_text)
        clauses_ids = template_text.scan(/\[CLAUSE\-\d+\]/).map do |tag|
            tag.scan(/\d+/)[0].to_i
        end.uniq
    end

    def all_sections_ids(template_text)
        section_ids = template_text.scan(/\[SECTION\-\d+\]/).map do |tag|
            tag.scan(/\d+/)[0].to_i
        end.uniq
    end

    private

    def replace_tags()
        sections = Section.find_all(all_sections_ids(@text_to_document))
        sections.each do |section|
            @text_to_document = @text_to_document.gsub('[SECTION-'+section.id.to_s+']',  section.clauses_ids.map{|clause_id| '[CLAUSE-'+clause_id.to_s+']'}.join(';'))
        end
        clauses = Clause.find_all(all_clauses_ids(@text_to_document))
        clauses.each do |clause|
            @text_to_document = @text_to_document.gsub('[CLAUSE-'+clause.id.to_s+']',  clause.text)
        end
        @text_to_document
    end
end