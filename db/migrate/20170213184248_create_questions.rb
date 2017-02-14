class CreateQuestions < ActiveRecord::Migration
	def change
		create_table :questions do |q|
			q.string 	 :title, null: false
			q.text 	 	 :body, null: false
			q.integer  :user_id, null: false

			q.timestamps
		end 
	end
end
