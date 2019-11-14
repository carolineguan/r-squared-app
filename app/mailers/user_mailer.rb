class UserMailer < ApplicationMailer
    def forgot_password(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
end
