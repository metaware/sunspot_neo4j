class Recipe
  include Neo4j::ActiveNode
  property :name, type: String

  include Sunspot::Neo4j
  searchable do
    text :name
  end
end