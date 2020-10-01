class Tama < ActiveRecord::Base
    has_many :adoptions
    has_many :users, through: :adoptions
    validates :fullness, :inclusion => { :in => 0..10 }


    FAM = ["The Addams Family", "The McCoy Family", "The Hatfield Family"]

    def initialize(hash)
        super
        self.family = FAM.sample
        self.birthday = Time.now.utc
    end

    def feed
        if self.fullness < 10
            self.fullness += 1
        elsif self.fullness >= 10
            self.fullness = 10
        end
        self.save
        puts "HE LOVES IT, FULLNESS is now #{self.fullness}."
    end

end