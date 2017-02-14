class User < ActiveRecord::Base
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { in: 6..20 }
    has_secure_password
    has_many :questions
    has_many :answers

end

# post '/login' do
# 	session[:user] = User.authenticate(params[:user])
#
# 	unless current_user.nil?
# 		path = "/users/dashboard"
# 	else
# 		path = "/login"
# 	end
# 	redirect to path
# end
#
# post '/logout' do
# 	logout_user
# 	redirect to '/login'
# end
