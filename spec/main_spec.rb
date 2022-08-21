require 'spec_helper'

describe Section do
    context 'Find a section by ID that exist in DataSource' do
        it 'return a section object with id and clauses_ids array' do
            #
        end
    end

    context 'Find a ID that NOT exist in DataSource' do
        it 'is nil' do
            #
        end
    end
end

describe Clause do
    context 'Find a clause by ID that exist in DataSource' do
        it 'return a clause object with id and text' do
            #
        end
    end

    context 'Find a ID that NOT exist in DataSource' do
        it 'is nil' do
            #
        end
    end
end

describe Template do
    context 'Find a template that exist in DataSource' do
        it 'return a template object with a text attribute' do
            #
        end
    end

    context 'Try find a template that NOT exist in DataSource' do
        it 'is nil' do
            #
        end
    end

    context 'Get all clauses ids from template' do
        it 'return a array with clauses ids' do
            #
        end
    end

    context 'Try to get all clause ids from the model when isnt have any' do
        it 'is a empty array' do
            #
        end
    end

    context 'Get all section ids from template' do
        it 'return a array with section ids' do
            #
        end
    end

    context 'Try to get all section ids from the model when isnt have any' do
        it 'is a empty array' do
            #
        end
    end
end

describe Generator do
    context 'Find a template that exist in DataSource' do
        it 'return a template object with a text attribute' do
            #
        end
    end

    context 'Try find a template that NOT exist in DataSource' do
        it 'is nil' do
            #
        end
    end

    context 'Get all clauses ids from template' do
        it 'return a array with clauses ids' do
            #
        end
    end

    context 'Try to get all clause ids from the model when isnt have any' do
        it 'is a empty array' do
            #
        end
    end

    context 'Get all section ids from template' do
        it 'return a array with section ids' do
            #
        end
    end

    context 'Try to get all section ids from the model when isnt have any' do
        it 'is a empty array' do
            #
        end
    end
end