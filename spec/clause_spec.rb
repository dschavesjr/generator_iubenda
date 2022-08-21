require 'clause'

describe Clause do
    context 'Find a clause by ID that exist in DataSource' do
        before do
            @loader = DatasetLoader.new(ClauseFileParser.new)
            allow(@loader).to receive(:load_dataset) { [{'id'=> 1, 'text' => 'teste ok'}] }
            @clause = Clause.find(1, loader: @loader)
        end
        it 'return a clause object with id and text' do
            expect(@clause.id).to eq 1
            expect(@clause.text).to eq 'teste ok'
        end
    end

    context 'Find a ID that NOT exist in DataSource' do
        before do
            @loader = DatasetLoader.new(ClauseFileParser.new)
            allow(@loader).to receive(:load_dataset) { [{'id'=> 1, 'text' => 'teste ok'}] }
            @clause = Clause.find(5, loader: @loader)
        end
        it 'is nil' do
            expect(@clause).to be_nil
        end
    end
end