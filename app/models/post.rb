class Post < ActiveRecord::Base
  has_many :post_tags
  has_many :tags, through: :post_tags
  belongs_to :user

  validates :name, presence: true
    validates :content, presence: true

    def tags_attributes=(tags_attributes)
      tags_attributes.values.each do |tags_attribute|
        tag = Tag.find_or_create_by(tags_attribute)
        self.tags << tag
      end
    end



end
