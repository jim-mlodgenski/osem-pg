class LegacyVenue < LegacyBase
  self.table_name = "core_venue"

  def map
    {
      name:  self.name,
      conference_id: self.conference_id,
      description: self.description.to_s.empty? || 'FIXME: set description for this venue!',
      street: self.street,
      city: self.city,
      postalcode: self.zip,
      country: self.country
    }
  end

end