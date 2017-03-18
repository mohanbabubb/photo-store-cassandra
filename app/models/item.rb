class Item
	include Cequel::Record
	
	key :id, :timeuuid, auto: true
	column :name, :varchar
	column :descb, :varchar
	timestamps
	has_many :itemdetail
	has_many :photo
end
