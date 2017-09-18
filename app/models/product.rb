class Product 
  include Mongoid::Document
  include Mongoid::Paperclip
  belongs_to :store
  cattr_accessor :current_store
  before_save :prepare_store
  default_scope { where(store: Product.current_store) }

  def prepare_store
    store = Product.current_store 
  end

  def save_prodcut(store)
  end

  has_mongoid_attached_file :image
  validates :name, :price, :parcels, presence: true
  validates :parcels, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }
  validates_attachment :image,
    :size => { less_than: 2.megabytes }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_attached_file :image

  field :name, type: String
  field :price, type: Float 
  field :parcels, type: Integer
  field :url, type: String
  field :store_name, type: String

  searchkick callbacks: :async
end
