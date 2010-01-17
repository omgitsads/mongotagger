require 'shoulda'
require 'mongo_mapper'

test_dir = File.expand_path(File.dirname(__FILE__) + '/../tmp')
FileUtils.mkdir_p(test_dir) unless File.exist?(test_dir)

MongoMapper.connection = Mongo::Connection.new('127.0.0.1', 27017, { :logger => Logger.new(test_dir + '/test.log') })
MongoMapper.database = 'test'

require File.expand_path(File.dirname(__FILE__) + '/../lib/mongo_tagger')

class Post
  include MongoMapper::Document
  include MongoTagger
  key :title, String, :required => true
end