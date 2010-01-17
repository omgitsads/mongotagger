require File.join(File.dirname(__FILE__), "test_helper.rb")

class MongoTaggerTest < Test::Unit::TestCase
  context "creating tags" do
    context "with the tag_list setter" do
      setup do
        @post = Post.create(:title => "Test Post")
        @post.tag_list = "mongodb, is, awesome"
        @post.save
      end
      
      %w(mongodb is awesome).each do |tag|
        should "have '#{tag}' in the tag list" do
          assert_equal true, @post.tag_list.include?(tag)
        end
      end
      
      teardown do
        @post.destroy
      end
    end
    
    context "with the shovel setter" do
      setup do
        @post = Post.create(:title => "Test Post")
        @post.tags << Tag.new(:name => "mongomapper")
        @post.tags << Tag.new(:name => "mongodb")
        @post.tags << Tag.new(:name => "jnunemaker")
        @post.save
      end
      
      %w(mongomapper mongodb jnunemaker).each do |tag|
        should "have '#{tag}' in the tag list" do
          assert_equal true, @post.tag_list.include?(tag)
        end
      end
      
      teardown do
        @post.destroy
      end
    end
  end
  
  context "finding tags" do
    setup do
      @post = Post.create(:title => "Test Post #1")
      @post.tags << Tag.new(:name => "mongomapper")
      @post.save
      
      @post_two = Post.create(:title => "Test Post #2")
      @post_two.tags << Tag.new(:name => "mongodb")
      @post_two.save
    end
    
    context "with a single tag" do
      should "find the test post tagged with 'mongomapper'" do
        @results = Post.find_tagged_with("mongomapper")
        assert_equal 1, @results.size
        assert_equal "Test Post #1", @results.first.title
      end
      
      should "find the test post tagged with 'mongodb'" do
        @results = Post.find_tagged_with("mongodb")
        assert_equal 1, @results.size
        assert_equal "Test Post #2", @results.first.title
      end
    end
    
    context "with a list of tags" do
      should "find the test post tagged with mongodb or mongomapper" do
        @results = Post.find_tagged_with("mongodb, mongomapper")
        assert_equal 2, @results.size
        assert_equal "Test Post #1", @results[0].title
        assert_equal "Test Post #2", @results[1].title
      end
    end
    
    context "with an array of tags" do
      should "find the test post tagged mongodb or mongomapper" do
        @results = Post.find_tagged_with(["mongodb","mongomapper"])
        assert_equal 2, @results.size
        assert_equal "Test Post #1", @results[0].title
        assert_equal "Test Post #2", @results[1].title
      end
    end
    
    teardown do
      @post.destroy
      @post_two.destroy
    end
  end
  
  context "reading tags" do
    setup do
      @post = Post.create(:title => "Test Post")
      @post.tags << Tag.new(:name => "ruby")
      @post.tags << Tag.new(:name => "mongomapper")
      @post.tags << Tag.new(:name => "mongodb")
      @post.save
    end
    
    context "with the tag_list getter" do
      %w(ruby mongomapper mongodb).each do |tag|
        should "have '#{tag}' in the tag list" do
          assert_equal true, @post.tag_list.include?(tag)
        end
      end
      
      should "not have 'some tag' in the tag list" do
        assert_equal false, @post.tag_list.include?("some tag")
      end
    end
    
    teardown do
      @post.destroy
    end
  end
end