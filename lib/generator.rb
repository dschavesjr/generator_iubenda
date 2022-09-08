require_relative './clause'
require_relative './section'
require_relative './template'

class Generator
    def generate_document(template)
        return nil unless template.is_a? Template
        return nil unless template.valid?

        @template_text = template.send(:text)

        replace_tags()
    end

    def all_clauses_ids(template_text)
        clauses_ids = template_text.enum_for(:scan, /\[CLAUSE\-\d+\]/).map do |tag|
            tag.scan(/\d+/)[0].to_i
        end.uniq
    end

    def all_sections_ids(template_text)
        section_ids = template_text.enum_for(:scan, /\[SECTION\-\d+\]/).map do |tag|
            tag.scan(/\d+/)[0].to_i
        end.uniq
    end

    private

    def replace_tags()
        section_ids = all_sections_ids(@template_text)
        sections = Section.find_all(section_ids)
        sections.each do |section|
            @template_text = @template_text.gsub!('[SECTION-'+section.id.to_s+']',  section.clauses_ids.map{|clause_id| '[CLAUSE-'+clause_id.to_s+']'}.join(';'))
        end
        clauses_ids = all_clauses_ids(@template_text)
        clauses = Clause.find_all(clauses_ids)
        clauses.each do |clause|
            @template_text = @template_text.gsub!('[CLAUSE-'+clause.id.to_s+']',  clause.text)
        end
        @template_text
    end
end