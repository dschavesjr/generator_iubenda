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