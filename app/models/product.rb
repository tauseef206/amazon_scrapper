class Product < ApplicationRecord
  belongs_to :search_url, :class_name => "Url", :foreign_key => "url_id", optional: true
end
