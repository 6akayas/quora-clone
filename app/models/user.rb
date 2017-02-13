class User < ActiveRecord::Base
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { in: 6..20 }

    has_secure_password
end

post '/login' do
	session[:user] = User.authenticate(params[:user])

	unless current_user.nil?
		path = "/users/dashboard"
	else
		path = "/login"
	end
	redirect to path
end

post '/logout' do
	logout_user
	redirect to '/login'
end

# user = User.new(name: 'david', password: '', password_confirmation: 'nomatch')
# user.save                                                       # => false, password required
# user.password = 'mUc3m00RsqyRe'
# user.save                                                       # => false, confirmation doesn't match
# user.password_confirmation = 'mUc3m00RsqyRe'
# user.save                                                       # => true
# user.authenticate('notright')                                   # => false
# user.authenticate('mUc3m00RsqyRe')                              # => user
# User.find_by(name: 'david').try(:authenticate, 'notright')      # => false
# User.find_by(name: 'david').try(:authenticate, 'mUc3m00RsqyRe') # => user
