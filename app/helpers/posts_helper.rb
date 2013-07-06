module PostsHelper
	def getCategory(params_id)
		Category.find(params_id)
	end

	def getUserName(user_id)
		User.find(user_id).user_name
	end
end
