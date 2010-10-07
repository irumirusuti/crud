# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Forum.create(:title => "遊戲區" , :context => "遊戲密技攻略")
Forum.create(:title => "釣魚區" , :context => "聊天吹又室")
Forum.create(:title => "地下室" , :context => "暗盤交易物品儲藏庫")

admin = User.create(:login => "admin" , :email => "admin@test.com" , :password => "123456" , :password_confirmation => "123456" )
admin.is_admin = true
admin.save

