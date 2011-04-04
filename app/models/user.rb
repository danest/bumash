class User < ActiveRecord::Base
  
  attr_accessible :email
  
  email_regex = /\A[\w+\-.]+\d@[a-z\d\-.]+\.[a-z].+\z/i
  
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => {
                      :case_sensitive => false
                    }
  
  def self.authenticate(email)  
    user = find_by_email(email)
    return user unless user.nil?   
  end
  
  def is_admin?
    self.admin == true
  end
         
end
