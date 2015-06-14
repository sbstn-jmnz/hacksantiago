module ApiConection
	extend ActiveSupport::Concern
	
	def search_posts(tag='moda',time)
	url = 'https://public-api.wordpress.com/rest/v1.1/read/tags/'
	url += tag 
	url += ''
	url += '/posts'
  
  @resultado = []
	response = JSON.parse HTTParty.get(url).response.body
  response['posts'].each do |r|
    
      if( r['content'].length <= time )
          @resultado << r;
      end

  end

  end

	def search_post(blog_id)
	end
end
