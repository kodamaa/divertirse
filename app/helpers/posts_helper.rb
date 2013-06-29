module PostsHelper
	def getCategory(params_id)
		Category.find(params_id).category_name
	end
end
