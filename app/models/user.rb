class User < ActiveRecord::Base
  validates :name, :presence => true
  validates :name, :uniqueness => true

  has_many :photos
  has_many :tags
  has_secure_password
  has_attached_file :avatar
  validates_attachment_content_type :avatar,
                                    :content_type => /^image\/(png|gif|jpeg)/,
                                    :message => 'only (png/gif/jpeg) images'


end
