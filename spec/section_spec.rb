require 'section'

describe Section do
    context 'Find a section by ID that exist in DataSource' do
        before do
            @loader = DatasetLoader.new(SectionFileParser.new)
            allow(@loader).to receive(:load_dataset) { [{'id'=> 1, 'clauses_ids' => [1,2]}] }
            @section = Section.find(1, loader: @loader)
        end

        it 'return a section object with id and clauses_ids array' do
           expect(@section.id).to eq 1
           expect(@section.clauses_ids).to eq [1,2]
        end
    end

    context 'Find a ID that NOT exist in DataSource' do
        before do
            @loader = DatasetLoader.new(SectionFileParser.new)
            allow(@loader).to receive(:load_dataset) { [{'id'=> 1, 'clauses_ids' => [1,2]}] }
            @section = Section.find(5, loader: @loader)
        end

        it 'is nil' do
            expect(@section).to be_nil
        end
    end
end