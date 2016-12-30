class LegacyUser < LegacyBase
  class LegacyUserProfile < LegacyBase
    self.table_name = "account_profile"

    def affiliation
      return "#{self.title} at #{self.company}" if !self.title.to_s.empty? and !self.company.to_s.empty?
      return self.company.to_s.empty? || 'unknown'
    end
  end

  self.table_name = "account_user"
  def generate_username
    return self.name.split(' ').join('.').downcase if self.name
    return self.email.split('@').first
  end

  def map
    {
      :email => self.email,
      :encrypted_password => self.password,
      :is_admin => self.is_superuser,
      :name => self.name,
      :username => self.email, #planned to use generate_username here, but it still generates some non-unique users
      :created_at => self.date_joined
    }
  end

  def migrate
    @profile = LegacyUserProfile.where(:user_id => self.id).first
    new_record = self.class.to_s.gsub(/Legacy/,'::').constantize.new(map)
    new_record[:id] = self.id
    new_record[:affiliation] = @profile.affiliation
    new_record[:biography] = @profile.description

    new_record.skip_confirmation!
    new_record.save(validate: false)
  end

end