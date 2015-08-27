class Post < ActiveRecord::Base
  include Paperclip::Glue
  validates :title , presence: true , length: {minimum: 5}
  validates :body ,presence: true
  has_attached_file :post_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :post_image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
end
