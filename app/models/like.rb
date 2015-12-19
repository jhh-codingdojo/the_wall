class Like < ActiveRecord::Base
  belongs_to :parent, polymorphic: true
  belongs_to :user  
  validates :user, presence: true, uniqueness: {scope: [:parent_id, :parent_type]}
end
