require 'trucker'
include Trucker

namespace :db do
  namespace :migrate do


    desc 'Migrates conferences'
    task :conferences => :environment do
      Trucker.migrate :conferences
    end

    desc 'Migrates contacts'
    task :contacts => :environment do
      Trucker.migrate :contacts
    end

    desc 'Migrates votes'
    task :votes => :environment do
      Event.where(program_id: 9).destroy_all
      ActiveRecord::Base.connection.reset_pk_sequence!('events')
      Trucker.migrate :votes
    end

    desc 'Migrates sponsors'
    task :sponsors => :environment do
      Trucker.migrate :sponsors
    end

    desc 'Migrates tracks'
    task :tracks => :environment do
      Trucker.migrate :tracks
    end

    desc 'Migrates sponsorship_levels'
    task :sponsorship_levels => :environment do
      Trucker.migrate :sponsorship_levels
    end

    desc 'Migrates event_schedules'
    task :event_schedules => :environment do
      Trucker.migrate :event_schedules
    end

    desc 'Migrates email_settings'
    task :email_settings => :environment do
      Trucker.migrate :email_settings
    end

    desc 'Migrates qanswers'
    task :qanswers => :environment do
      Trucker.migrate :qanswers
    end

    desc 'Migrates question_types'
    task :question_types => :environment do
      Trucker.migrate :question_types
    end

    desc 'Migrates registration_periods'
    task :registration_periods => :environment do
      Trucker.migrate :registration_periods
    end

    desc 'Migrates answers'
    task :answers => :environment do
      Trucker.migrate :answers
    end

    desc 'Migrates splashpages'
    task :splashpages => :environment do
      Trucker.migrate :splashpages
    end

    desc 'Migrates abilities'
    task :abilities => :environment do
      Trucker.migrate :abilities
    end

    desc 'Migrates subscriptions'
    task :subscriptions => :environment do
      Trucker.migrate :subscriptions
    end

    desc 'Migrates questions'
    task :questions => :environment do
      Trucker.migrate :questions
    end

    desc 'Migrates openids'
    task :openids => :environment do
      Trucker.migrate :openids
    end

    desc 'Migrates difficulty_levels'
    task :difficulty_levels => :environment do
      Trucker.migrate :difficulty_levels
    end

    desc 'Migrates vchoices'
    task :vchoices => :environment do
      Trucker.migrate :vchoices
    end

    desc 'Migrates ticket_purchases'
    task :ticket_purchases => :environment do
      Trucker.migrate :ticket_purchases
    end

    desc 'Migrates events'
    task :events => :environment do
      Trucker.migrate :events
    end

    desc 'Migrates payments'
    task :payments => :environment do
      Trucker.migrate :payments
    end

    desc 'Migrates registrations'
    task :registrations => :environment do
      Trucker.migrate :registrations
    end

    desc 'Migrates cfps'
    task :cfps => :environment do
      Trucker.migrate :cfps
    end

    desc 'Migrates lodgings'
    task :lodgings => :environment do
      Trucker.migrate :lodgings
    end

    desc 'Migrates visits'
    task :visits => :environment do
      Trucker.migrate :visits
    end

    desc 'Migrates vdays'
    task :vdays => :environment do
      Trucker.migrate :vdays
    end

    desc 'Migrates roles'
    task :roles => :environment do
      Trucker.migrate :roles
    end

    desc 'Migrates programs'
    task :programs => :environment do
      Trucker.migrate :programs
    end

    desc 'Migrates event_users'
    task :event_users => :environment do
      Trucker.migrate :event_users
    end

    desc 'Migrates comments'
    task :comments => :environment do
      Trucker.migrate :comments
    end

    desc 'Migrates users_roles'
    task :users_roles => :environment do
      Trucker.migrate :users_roles
    end

    desc 'Migrates campaigns'
    task :campaigns => :environment do
      Trucker.migrate :campaigns
    end

    desc 'Migrates event_types'
    task :event_types => :environment do
      Trucker.migrate :event_types
    end

    desc 'Migrates commercials'
    task :commercials => :environment do
      Trucker.migrate :commercials
    end

    desc 'Migrates schedules'
    task :schedules => :environment do
      Trucker.migrate :schedules
    end

    desc 'Migrates events_registrations'
    task :events_registrations => :environment do
      Trucker.migrate :events_registrations
    end

    desc 'Migrates tickets'
    task :tickets => :environment do
      Trucker.migrate :tickets
    end

    desc 'Migrates vpositions'
    task :vpositions => :environment do
      Trucker.migrate :vpositions
    end

    desc 'Migrates users'
    task :users => :environment do
      Trucker.migrate :users
    end

    desc 'Migrates targets'
    task :targets => :environment do
      Trucker.migrate :targets
    end

    desc 'Migrates rooms'
    task :rooms => :environment do
      Trucker.migrate :rooms
    end

    desc 'Migrates revision_observers'
    task :revision_observers => :environment do
      Trucker.migrate :revision_observers
    end

    desc 'Migrates venues'
    task :venues => :environment do
      Trucker.migrate :venues
    end


  end
end