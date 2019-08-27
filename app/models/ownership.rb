class Ownership < ApplicationRecord
  belongs_to :dog
  belongs_to :owner
end
