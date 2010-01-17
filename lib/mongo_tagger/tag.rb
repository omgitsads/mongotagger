class Tag
  include MongoMapper::EmbeddedDocument
  belongs_to :taggable, :polymorphic => true

  key :name, String, :required => true

  key :taggable_id, Mongo::ObjectID
  key :taggable_type, String
end