class LegacyRoom < LegacyBase
  self.table_name = "core_room"

  def map
    {
      venue_id: self.venue_id,
	  	name: self.name,
      size: 100
    }
  end
end