class Post < ActiveRecord::Base

belongs_to :forum
belongs_to :user

  #will paginate
  cattr_reader :per_page
  @@per_page = 20

  #named_scope :post_count , :condition => :count


end
