require 'clause'

describe Clause do
    context 'Find a clause by ID that exist in DataSource' do
        before do
            @loader = DatasetLoader.new(ClauseFileParser.new)
            allow(@loader).to receive(:load_dataset) { [{'id'=> 1, 'text' => 'teste ok'}] }
            @clause = Clause.find([1], loader: @loader)
        end
        it 'return a array of clause objects with a valid one' do
            expect(@clause[0].id).to eq 1
            expect(@clause[0].text).to eq 'teste ok'
        end
    end

    context 'Try a ID that NOT exist in DataSource' do
        before do
            @loader = DatasetLoader.new(ClauseFileParser.new)
            allow(@loader).to receive(:load_dataset) { [{'id'=> 1, 'text' => 'teste ok'}] }
            @clause = Clause.find([5], loader: @loader)
        end
        it 'return a empty array' do
            expect(@clause).to be_empty
        end
    end
end