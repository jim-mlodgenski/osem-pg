class LegacyAbility < LegacyBase
  set_table_name "abilities"

  def map
    {
      :field_one => self.old_field_one.squish,
      :field_two => self.old_field_two.squish
    }
  end

end