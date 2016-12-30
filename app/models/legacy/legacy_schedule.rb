class LegacySchedule < LegacyBase
  set_table_name "schedules"

  def map
    {
      :field_one => self.old_field_one.squish,
      :field_two => self.old_field_two.squish
    }
  end

end