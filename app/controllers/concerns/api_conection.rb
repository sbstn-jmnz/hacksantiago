module ApiConection
	extend ActiveSupport::Concern
	
	def search_posts(tag='moda',time)
	url = 'https://public-api.wordpress.com/rest/v1.1/read/tags/'
	url += tag 
	url += ''
	url += '/posts/'
	url += '?number=40'

  
  	time = 30*time.to_i

  		@resultado = []
		response = JSON.parse HTTParty.get(url).response.body
  		response['posts'].each do |p|
    
      	if(post_size(p['content']) <= time.to_i )
          puts post_size(p['content'])
          @resultado << p
      	end
  	end
  end


  def post_size(post)
  	post.split.size
  end


  def search_post(blog_id)
  end

end
