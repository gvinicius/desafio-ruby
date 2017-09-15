class Product 
  include Mongoid::Document
  include Mongoid::Paperclip
  belongs_to :store

  def save_product(store)
    self.store = store
    self.save
  end

  has_mongoid_attached_file :image
  validates :name, :price, presence: true
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

  rails_admin do
    configure :store do
      label 'Store selling it: '
    end
  end

  searchkick
end
