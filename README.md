sunspot_neo4j
====

A Sunspot wrapper for Neo4j.

Install
----

    gem install sunspot_neo4j

Examples
----

    class Post
      include Neo4j::ActiveNode
      field :title

      include Sunspot::Neo4j
      searchable do
        text :title
      end
    end

For Rails
----

### as gem:

add a gem to Gemfile as following,

    gem 'sunspot_neo4j'

Links
----

* [sunspot](http://github.com/outoftime/sunspot)
* [sunspot_rails](http://github.com/outoftime/sunspot/tree/master/sunspot_rails/)

Copyright
----

Copyright (c) 2015 Andy Schrage. See LICENSE for details.
