module ApiConection
	extend ActiveSupport::Concern
	
	def search_posts(tag='moda',time)

  tag = clean_string(tag)
	url = 'https://public-api.wordpress.com/rest/v1.1/read/tags/'
	url += tag
	url += ''
	url += '/posts/'
	url += '?number=40'

  	time = 30*time.to_i

  		@resultado = []
		response = JSON.parse HTTParty.get(url).response.body
    puts response.inspect
  		response['posts'].each do |p|
    
      	if(post_size(p['content']) <= time.to_i )
          puts url
          @resultado << p
      	end
  	end
  end


def search_post siteid, postid

  url = 'https://public-api.wordpress.com/rest/v1.1/sites/'
  url += siteid
  url += '/posts/'
  url += postid
  @resultado = JSON.parse HTTParty.get(url).response.body

end

# crear otro method para consumir la api de cuentos (desde url externa de amazon)


  def clean_string(string)
    #string.to_s.gsub(/\s+/, "-")

    string.parameterize 
  end

  def post_size(post)
  	post.split.size
  end


   

end
