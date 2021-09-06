class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :non_clickbait

    def non_clickbait
        if self.title == nil
        else
          arr = ["Won't Believe", "Secret", "Top [number]", "Guess"]
          unless arr.any? { |string| self.title.include?(string) }
            self.errors.add :title, "#{self.title}"
          end
        end
    end
end
