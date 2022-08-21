require_relative './clause'
require_relative './section'

class Generator
    def generate_document(template)
        return nil unless template.valid?
        @document = template.text
        replace_clauses_tags(template.all_clauses_ids) 
        replace_sections_tags(template.all_sections_ids)
        @document
    end

    private

    def replace_clauses_tags(clauses_ids)
        clauses_ids.each do |id|
            clause = Clause.find(id)
            @document = @document.gsub!('[CLAUSE-'+id.to_s+']',  clause.text) unless clause.nil?
        end
    end

    def replace_sections_tags(section_ids)
        section_ids.each do |id|
            section = Section.find(id)
            unless section.nil?
                text = ''
                section.clauses_ids.each do |id|
                    clause = Clause.find(id)
                    text = text + clause.text + ';'
                end 
                @document = @document.gsub!('[SECTION-'+id.to_s+']',  text.chop)
            end
        end
    end
end