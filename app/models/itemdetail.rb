class Itemdetail
	include Cequel::Record

	belongs_to :item
	key :id, :uuid, auto: true
	column :data, :text
	compact_storage

        def data
#		JSON.parse(read_attribute(:data)) if read_attribute(:data) != nil
		read_attribute(:data) if read_attribute(:data) != nil
	end

        def data=(new_data)
                write_attribute(:data, new_data.to_json)
        end

end
