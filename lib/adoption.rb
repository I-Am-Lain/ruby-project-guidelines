class Adoption < ActiveRecord::Base
    belongs_to :tama
    belongs_to :user

end
