class LegacyEvent < LegacyBase
  # figure out the event.conference_id via event.block.day.conference_id
  class LegacyProposal < LegacyBase
    self.table_name = "core_proposal"
  end

  class LegacyBlock < LegacyBase
    self.table_name = "core_block"
    def day
      LegacyDay.find(self.day_id)
    end
  end

  class LegacyDay < LegacyBase
    self.table_name = "core_day"
  end

  self.table_name = "core_event"

  def get_program
    Program.where(conference_id: block.day.conference_id).first
  end

  def block
    LegacyBlock.find(self.block_id)
  end

  def get_event_type
    EventType.where(program_id: get_program.id, title: 'Talk').first
  end

  def get_difficulty_level
    DifficultyLevel.where(program_id: get_program.id, title: 'Medium').first
  end

  def get_description
    return self.event_description unless self.event_description.blank?
    return 'none provided'
  end

  def map
    {
      room_id: self.room_id,
      track_id: self.track_id,
      title: self.event_title,
      description: get_description,
      # trim too long abstract texts
      abstract: get_description.split[0...500].join(' '),
      program_id: get_program.id,
      event_type: get_event_type,
      difficulty_level: get_difficulty_level,
    }
  end

  def state_from_proposal(prop)
    return :rejected if prop.status == 'declined'
    return :confirmed if prop.status == 'accepted'
    return :new
  end

  def migrate
    @proposal = LegacyProposal.where(:id => self.proposal_id).first
    # byebug
    new_record = self.class.to_s.gsub(/Legacy/,'::').constantize.new(map)
    new_record[:id] = self.id
    # new_record[:program_id] = get_program_id
    new_record[:created_at] = get_program.conference.start_date - 1.day
    new_record[:updated_at] = get_program.conference.start_date - 1.day
    if @proposal
      # we can determite the event state if it has a proposal it was created from
      new_record[:state] = state_from_proposal @proposal
      new_record[:created_at] = @proposal.created_at
      new_record[:updated_at] = @proposal.updated_at
    end
    byebug unless new_record.valid?

    if new_record.save! && @proposal
      # assign speaker to the event: event.proposal.user_id is our speaker
      eu = EventUser.new(user_id: @proposal.user_id, event_id: new_record.id, event_role: 'speaker')
      eu.save!
      # make the same user a submitter for the current event
      eu = EventUser.new(user_id: @proposal.user_id, event_id: new_record.id, event_role: 'submitter')
      eu.save!
      # submitter must be registered to the conference
      @conference = get_program.conference
      @already_registered = Registration.where(user_id: @proposal.user_id, conference_id: @conference.id).first
      unless @already_registered
        reg = Registration.new(user_id: @proposal.user_id, conference_id: @conference.id, arrival: @conference.start_date, departure: @conference.end_date)
        reg.save!
      end
    end

  end

end