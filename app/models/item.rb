class Item
	include Cequel::Record
	
	key :uuid, :varchar
	column :name, :varchar
	column :descb, :varchar
	timestamps
end
