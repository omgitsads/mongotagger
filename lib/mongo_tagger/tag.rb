class Tag
  include MongoMapper::EmbeddedDocument
  belongs_to :taggable, :polymorphic => true

  key :name, String, :required => true
end