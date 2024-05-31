# Property model

class Property < ApplicationRecord
  include ActiveModel::Serialization
  include ActiveModel::Validations

  # Associations
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :features, dependent: :destroy

  # Validations
  validates :address, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :user, presence: true

  # Scopes
  scope :available, -> { where(available: true) }
  scope :featured, -> { where(featured: true) }
  scope :recent, -> { order(created_at: :desc) }

  # Callbacks
  before_save :set_default_values
  after_create :send_notification

  # Methods
  def set_default_values
    self.available = true if available.nil?
    self.featured = false if featured.nil?
  end

  def send_notification
    PropertyMailer.new_property(self).deliver_now
  end

  # Serialization
  def serializable_hash(options = {})
    super(options).merge({
      images: images.map(&:url),
      features: features.map(&:name)
    })
  end
end
