class BotsController < ApplicationController
    require 'kconv'
    require 'open-uri'
    require 'nokogiri'

    def new
     @bot = Bot.new
    end

    def create
     @bot = Bot.new(bot_params)
     @bot.save
     redirect_to bots_path
    end
    
    def index
      @bots = Bot.all
    end
    
    def crawl
        @bot = Bot.find(params[:id])
        doc = Nokogiri::HTML(open("#{@bot.url}"))
        @crawl = doc.xpath("#{@bot.xpath}").inner_html
    end
    
    def if_crawl
        @bot = Bot.find(params[:id])
        doc = Nokogiri::HTML(open("#{@bot.url}"))#URLの指定
            
        doc.css('table').each do |crawl|
            @crawl = crawl.inner_html.encode("UTF-8")
             if @crawl.encode("UTF-8").include?(@bot.word1) && @crawl.encode("UTF-8").include?(@bot.word2) && @crawl.encode("UTF-8").include?(@bot.word3)
                 @if_crawl = crawl.inner_html.encode("UTF-8")
             end
        end
    end
    
    def slice_crawl
        @bot = Bot.find(params[:id])
        @doc = Nokogiri::HTML(open("#{@bot.url}")).inner_html.encode("UTF-8")#URLの指定
        @index_doc = @doc.index("#{@bot.upper}")
        @end_doc = @doc.rindex("</html>") - 1
        @slice_crawl_pre = @doc.slice(@index_doc..@end_doc)
        @table_doc = @slice_crawl_pre.index("table>") + 5
        @slice_crawl = @slice_crawl_pre.slice(0..@table_doc)
    end
    
      private
      
        def bot_params
          params.require(:bot).permit(:name, :url, :xpath, :word1, :word2, :word3, :upper)
        end
end
