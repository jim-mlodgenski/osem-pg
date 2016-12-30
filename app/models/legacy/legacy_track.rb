class LegacyTrack < LegacyBase
  self.table_name = "core_track"

  def map
    {
      name: self.name,
      color: self.color,
      program_id: Program.where(conference_id: self.conference_id).first.id,
    }
  end
end