class Product
  include Mongoid::Document
  include Mongoid::Paperclip
  embeds_one Store

  has_mongoid_attached_file :image
  validates_attachment :image,
    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    :size => { less_than: 2.megabytes }
  has_attached_file :image

  field :name, type: String
  field :price, type: Decimal
  field :parcels, type: Integer
  field :url, type: String
end
