# User model

class User < ApplicationRecord
  include ActiveModel::Serialization
  include ActiveModel::Validations

  # Associations
  has_many :properties, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # Validations
  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true, if: :password_required?

  # Scopes
  scope :admin, -> { where(admin: true) }
  scope :active, -> { where(active: true) }

  # Callbacks
  before_save :set_default_values
  after_create :send_welcome_email

  # Methods
  def set_default_values
    self.admin = false if admin.nil?
    self.active = true if active.nil?
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  # Serialization
  def serializable_hash(options = {})
    super(options).merge({
                           properties: properties.map(&:id),
                           favorites: favorites.map(&:id)
                         })
  end

  private

  def password_required?
    new_record? || password.present?
  end
end
