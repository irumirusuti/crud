class Forum < ActiveRecord::Base
has_many :post , :dependent => :destroy
end
