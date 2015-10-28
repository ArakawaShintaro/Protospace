class Like < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :prototype_id
end
