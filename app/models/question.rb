class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  belongs_to :users
  has_many :answers
 

end
