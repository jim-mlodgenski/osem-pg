class LegacyQanswer < LegacyBase
  set_table_name "qanswers"

  def map
    {
      :field_one => self.old_field_one.squish,
      :field_two => self.old_field_two.squish
    }
  end

end