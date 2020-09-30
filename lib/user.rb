class User < ActiveRecord::Base
    has_many :adoptions
    has_many :tamas, through: :adoptions
end
