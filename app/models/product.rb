class Product
  include Mongoid::Document
  include Mongoid::Paperclip
  belongs_to :store

  def save_product(store)
    self.store = store
    self.save
  end

  has_mongoid_attached_file :image
  validates_attachment :image,
    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    :size => { less_than: 2.megabytes }
  has_attached_file :image

  field :name, type: String
  field :price, type: Float 
  field :parcels, type: Integer
  field :url, type: String
end