class Item
	include Cequel::Record
	
	key :name, :varchar
	column :descb, :varchar
	timestamps
end
