class User < ActiveRecord::Base
  geocoded_by :location   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true, uniqueness: {case_sensitive: true }, length: {in: 6..20}
  validates :location, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: {with: EMAIL_REGEX}
end
