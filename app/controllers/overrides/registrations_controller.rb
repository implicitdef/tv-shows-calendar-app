module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController

    def create
      super do |user|
        Show::DEFAULT_SHOWS_IDS.each do |show_id|
          if Show.exists?(show_id)
            user.shows << Show.find(show_id)
          end
        end
      end
    end

  end
end