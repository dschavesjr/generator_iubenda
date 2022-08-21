require 'template'

describe Template do
    context 'Init a template that exist in DataSource' do
        before do
            @loader = TemplateLoader.new(TemplateFileParser.new)
            allow(@loader).to receive(:load).with('test') { 'The test [CLAUSE-1] with clause and [SECTION-1] with section' }
            @template = Template.new('test', loader: @loader)
        end
        
        it 'return a template object with a text attribute' do
            expect(@template.text).to eq 'The test [CLAUSE-1] with clause and [SECTION-1] with section'
        end
    end

    context 'Get all clauses ids from template' do
        before do
            @loader = TemplateLoader.new(TemplateFileParser.new)
            allow(@loader).to receive(:load).with('test') { 'The test [CLAUSE-1] with clause [CLAUSE-2] and [SECTION-1] with section' }
            @template = Template.new('test', loader: @loader)
        end

        it 'return a array with clauses ids' do
            expect(@template.all_clauses_ids).to eq [1,2]
        end
    end

    context 'Try to get all clause ids from the model when isnt have any' do
        before do
            @loader = TemplateLoader.new(TemplateFileParser.new)
            allow(@loader).to receive(:load).with('test') { 'The test without clause and [SECTION-1] with section' }
            @template = Template.new('test', loader: @loader)
        end

        it 'is a empty array' do
            expect(@template.all_clauses_ids).to eq []
        end
    end

    context 'Get all section ids from template' do
        before do
            @loader = TemplateLoader.new(TemplateFileParser.new)
            allow(@loader).to receive(:load).with('test') { 'The test [CLAUSE-1] with clause and [SECTION-1] with section [SECTION-6]' }
            @template = Template.new('test', loader: @loader)
        end

        it 'return a array with section ids' do
            expect(@template.all_sections_ids).to eq [1,6]
        end
    end

    context 'Try to get all section ids from the model when isnt have any' do
        before do
            @loader = TemplateLoader.new(TemplateFileParser.new)
            allow(@loader).to receive(:load).with('test') { 'The test [CLAUSE-1] with clause and without section' }
            @template = Template.new('test', loader: @loader)
        end

        it 'is a empty array' do
            expect(@template.all_sections_ids).to eq []
        end
    end

    context 'Try valid? a template that exist in DataSource' do
        before do
            @loader = TemplateLoader.new(TemplateFileParser.new)
            allow(@loader).to receive(:load).with('test') { 'The test [CLAUSE-1] with clause and [SECTION-1] with section' }
            @template = Template.new('test', loader: @loader)
        end

        it 'is true' do
            expect(@template.valid?).to be true
        end
    end

    context 'Try valid? a template that NOT exist in DataSource' do
        before do
            @loader = TemplateLoader.new(TemplateFileParser.new)
            allow(@loader).to receive(:load).with('not exist') { nil }
            @template = Template.new('not exist', loader: @loader)
        end

        it 'is false' do
            expect(@template.valid?).to be false
        end
    end
end