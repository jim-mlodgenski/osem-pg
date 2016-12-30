class LegacyConference < LegacyBase
  self.table_name = "core_conference"

  def map
    {
      :title => self.name,
      :short_title => self.slug,
      :start_date => self.start_date,
      :end_date => self.end_date,
      :timezone => ActiveSupport::TimeZone['Central Time (US & Canada)']
    }
  end

end