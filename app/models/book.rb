require 'csv'

class Book < ApplicationRecord
  validates :title, :url, presence: true
  mount_uploader :image, ImageUploader

  def self.to_csv(options = {})
    desired_columns = ["id", "title", "author", "description", "url", "image"]
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |product|
        csv << product.attributes.values_at(*desired_columns)
      end
    end
  end
end
