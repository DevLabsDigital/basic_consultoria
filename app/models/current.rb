class Current < ActiveSupport::CurrentAttributes
    attribute :company, :user, :is_cloning
    attribute :request_id, :user_agent, :ip_address
  
    resets { Time.zone = nil }
  
    
  
    def user=(user)
      super
      self.company = user.company
    end
end