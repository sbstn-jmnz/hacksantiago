module ApiConection
	extend ActiveSupport::Concern
	
	def search_posts(tag='moda')
	url = 'https://public-api.wordpress.com/rest/v1.1/read/tags/'
	url += tag 
	url += ''
	url += '/posts'
	@response = JSON.parse HTTParty.get(url).response.body
	end

	def search_post(blog_id)
	end
end
