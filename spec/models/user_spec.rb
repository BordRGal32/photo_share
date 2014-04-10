require 'spec_helper'

describe User do
  it { should validate_presence_of :name }


  it 'should have a unique name' do
    FactoryGirl.create(:user)
    should validate_uniqueness_of :name
  end


  it { should have_many :photos }
  it { should have_many :tags }
  it { should have_attached_file(:avatar) }

  it { should validate_attachment_content_type(:avatar).
                allowing('image/png', 'image/gif', 'image/jpeg').
                rejecting('text/plain', 'text/xml') }

end
