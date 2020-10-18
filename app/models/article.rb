class Article < ApplicationRecord
    has_many :taggings
    has_many :tags, through: :taggings, dependent: :destroy
    has_many :comments, dependent: :destroy

    def tag_list=(names)
        self.tags = names.downcase.split(',').uniq.map do |name|
            Tag.where(name: name).first_or_create!
        end
    end

    def tag_list
        tags.map(&:name).join(', ')
    end
end
