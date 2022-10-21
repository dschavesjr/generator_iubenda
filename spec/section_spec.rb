require 'section'

describe Section do
    context 'Find a section by ID that exist in DataSource' do
        before do
            @loader = DatasetLoader.new(SectionFileParser.new)
            allow(@loader).to receive(:load_dataset) { [{'id'=> 1, 'clauses_ids' => [1,2]}] }
            @section = Section.find([1], loader: @loader)
        end

        it 'return a array of section object with a valid one' do
           expect(@section[0].id).to eq 1
           expect(@section[0].clauses_ids).to eq [1,2]
        end
    end

    context 'Try a ID that NOT exist in DataSource' do
        before do
            @loader = DatasetLoader.new(SectionFileParser.new)
            allow(@loader).to receive(:load_dataset) { [{'id'=> 1, 'clauses_ids' => [1,2]}] }
            @section = Section.find([5], loader: @loader)
        end

        it 'return a empty array' do
            expect(@section).to be_empty
        end
    end
end