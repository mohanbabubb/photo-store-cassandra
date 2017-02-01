class ItemItemdetail
	include Cequel::Record

	key :item_id, :uuid
	key :id, :uuid
	column :data, :text

	compact_storage

  	def data
    		JSON.parse(read_attribute(:data))
  	end

  	def data=(new_data)
    		write_attribute(:data, new_data.to_json)
  	end
end
