begin
  require 'mongo_mapper'
rescue
  puts "Could not road mongo_mapper"
  exit
end

module MongoTagger
  module ClassMethods
    def find_tagged_with(list_of_tags)
      list_of_tags = list_of_tags.split(",") if list_of_tags.is_a? String
      list_of_tags.each {|t| t.strip!}
      all :conditions => {"tags.name" => {"$in" => list_of_tags}}
    end
  end
  
  module InstanceMethods
    def tag_list=(list_of_tags="")
      list_of_tags.split(",").each do |tag|
        tags << Tag.new(:name => tag.strip)
      end
    end
    
    def tag_list
      tags.collect(&:name).join(", ")
    end
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
    receiver.class_eval { many :tags, :as => :taggable }
  end
end

require 'mongo_tagger/tag'