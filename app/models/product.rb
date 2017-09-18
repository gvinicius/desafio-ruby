class Product 
  include Mongoid::Document
  include Mongoid::Paperclip
  belongs_to :store, required: false
=begin
before_save :prepare_store

def prepare_store
  store = Store.find_by(email: store_email)
end
=end

  has_mongoid_attached_file :image
  validates :name, :price, :parcels, presence: true
  validates :parcels, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }
  validates_attachment :image,
    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    :size => { less_than: 2.megabytes }
  has_attached_file :image

  field :name, type: String
  field :price, type: Float 
  field :parcels, type: Integer
  field :url, type: String
  field :store_email, type: String

  searchkick callbacks: :async
end
