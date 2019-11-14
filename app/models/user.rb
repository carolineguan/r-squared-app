class User < ActiveRecord::Base
    has_secure_password
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence:   true, length: { maximum: 255 },
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

    def send_password_reset
        generate_token(:password_reset_token)
        self.password_reset_sent_at = Time.zone.now
        save!
        UserMailer.forgot_password(self).deliver# This sends an e-mail with a link for the user to reset the password
    end
    # This generates a random password reset token for the user
    def generate_token(column)
        begin
            self[column] = SecureRandom.urlsafe_base64
         end while User.exists?(column => self[column])
    end
  
                    
end
