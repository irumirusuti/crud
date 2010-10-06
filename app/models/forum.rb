class Forum < ActiveRecord::Base
  has_many :posts , :dependent => :delete_all
end
