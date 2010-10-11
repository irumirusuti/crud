class Post < ActiveRecord::Base

  belongs_to :forum
  belongs_to :user

  has_attached_file :avatar , :styles => { :medium => "300x300>" , :thumb => "100x100>" }
  def has_image?
    !self.avatar.url.include? "missing"
  end

  #will paginate
  cattr_reader :per_page
  @@per_page = 20

  #named_scope :post_count , :condition => :count


end
