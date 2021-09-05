class Post < ActiveRecord::Base

    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    
    validate :title_exists, :non_clickbait

    def non_clickbait
        if self.title.include? "Won't Believe" || "Secret" || "Top [number]" || "Guess"
            
        else
            errors.add(:title, "can't be non-clickbaity")
        end
    end
end
