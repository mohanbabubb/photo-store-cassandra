class Photo
	include Cequel::Record

	belongs_to :item
	key :id, :uuid, auto: true, :index => true
	column :name, :varchar
	column :attachment, :varchar
	column :featured, :int,:index => true
end
