module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = User.find_by(id: cookies.encrypted[:user_id])
      logger.add_tags 'ActionCable', current_user&.name
    end
  end
end
