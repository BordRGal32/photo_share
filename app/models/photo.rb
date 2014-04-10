class Photo < ActiveRecord::Base

  belongs_to :user
  has_many :tags
  has_attached_file :image, :styles =>{:medium => "300x300>"}
  validates_attachment_content_type :image,
                                    :content_type => /^image\/(png|gif|jpeg)/,
                                    :message => 'only (png/gif/jpeg) images'

end
