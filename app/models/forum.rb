class Forum < ActiveRecord::Base
has_many :post , :dependent => :delete_all
end
