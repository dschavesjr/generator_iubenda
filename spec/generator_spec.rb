require 'generator'

describe Generator do
    context 'Generate a Document from a valid Template' do
        before do
            allow(Clause).to receive(:find).with([1,2]) { [Clause.new(1, 'is ok'), Clause.new(2, 'too')] }
            allow(Section).to receive(:find).with([1]) { [Section.new(1, [1,2])] }

            @loader = TemplateLoader.new(TemplateFileParser.new)
            allow(@loader).to receive(:load).with('test') { 'The test [CLAUSE-1] with clause and [SECTION-1] with section' }
            @template = Template.new('test', loader: @loader)

            @generator = Generator.new
        end

        it 'return text with tags replaced' do
            expect(@generator.generate_document(@template)).to eq 'The test is ok with clause and is ok;too with section'
        end
    end

    context 'Try generate a Document from a invalid template or other object' do
        before do
            @loader = TemplateLoader.new(TemplateFileParser.new)
            allow(@loader).to receive(:load).with('not exist') { nil }
            @template = Template.new('not exist', loader: @loader)

            @generator = Generator.new
        end

        it 'is nil' do
            expect(@generator.generate_document(@template)).to be_nil
            expect(@generator.generate_document('other object')).to be_nil
        end
    end
end