module PostsHelper
	def getCategory(params_id)
		Category.find(params_id)
	end
end
