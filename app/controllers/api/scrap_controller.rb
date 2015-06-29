module API
	class ScrapController < ApplicationController
  		protect_from_forgery with: :null_session
		#before_action :authenticate

		def index
		resultado = []
     	@year = rand(2002..2013)
     	@n = rand(1..12)

     	#@year = 2006
     	# => @n = 11

    	url= 'http://www.santiagoen100palabras.cl/2015/va.php?ano='+@year.to_s+'&cuento='+@n.to_s
        mechanize = Mechanize.new
        page = mechanize.get(url)

        #@estatus  = page.code
        #ilustracion = page.at('div.portfolio-single-image-container.column.two-third > img').text
        
        title = page.at('.column h3').text
        tag =    page.at('.column .tags').text
        content =  page.at('div.column.one-third.last > p:nth-child(3)').text
        author =  page.at('.project-details p:nth-child(1)').text
        img = "http://www.santiagoen100palabras.cl/versiones_anteriores/#{@year}/#{@n}.jpg"
        resultado << [title,tag,content,author,img]
			render json: resultado, status: 200
		end

		
	end
end