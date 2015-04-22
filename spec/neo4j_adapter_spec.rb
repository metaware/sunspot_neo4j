require 'spec_helper'

#NOTE: The models found in this spec can be located in the associated dummy Rails app under "spec/dummy"

describe 'Sunspot' do
  describe '::Neo4j', neo4j: true do

    shared_examples 'a searchable Neo4j model' do
      before(:each) do
        Recipe.destroy_all
      end

      it 'can create a Neo4j node' do
        expect(Recipe.create(name: 'Test Recipe')).to_not be nil
      end

      it 'can find a Neo4j node' do
        r = Recipe.create(name: 'Needle')
        Sunspot.commit

        expect(Recipe.search { fulltext 'needle' }.results) == [r]
      end
    end

    %w(community-2.2.0 community-2.0.4).each do |edition|
      describe "version #{edition}" do
        before(:all) do
          Neo4jTestServer.edition = edition
        end

        after(:all) do
          # Shutdown the server after each group of tests.
          puts 'Shutting down the server'
          Neo4jTestServer.server.stop
          Neo4jTestServer.server = nil
          puts 'Server is shut down'
        end

        it_behaves_like 'a searchable Neo4j model'
      end
    end

  end
end