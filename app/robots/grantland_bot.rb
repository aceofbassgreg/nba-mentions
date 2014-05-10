class GrantlandBot < Robot

include MentionsParser

  def self.start
    bot = GrantlandBot.new(mechanize_agent)
    bot
  end


  # NOTE => Can probably move all of this out to the general Robot class.

  def scrape_teams_for_db
    teams.each do |team|
      aha = team.downcase.gsub!(' ','+')
      puts "Scraping for #{team}..."
      articles = []
      page  = agent.get(search_url(aha))
      hrefs = all_link_hrefs(page).map {|link| link.text}
      dates = all_posted_dates(page).map {|span| span.text.split('| ')[-1]}
      page_data = hrefs.zip(dates)
      page_data.each do |arr|
        articles << articles_hash(arr[0],"grantland",arr[1])
      end
      #Next line creates articles in DB
      articles.each {|a| create_article_record(a)}
      # hrefs.each do {|href|}
      #   MentionsParser.store_mentions
      # end
      # Need to also create mentions...how to do this? Seems like each article added
      # can be a mention for the team that was searched, but an additional layer of
      # parsing is necessary for each article added to the db.
    end
  end

  def all_link_titles(page)
    page.search(".//li//div[@class='media']//div[@class='bd']//h3[@class='headline gamma']")
  end

  def all_link_hrefs(page)
    page.search(".//li//div[@class='media']//div[@class='bd']//h3[@class='headline gamma']//@href")
  end

  # Gives the actual date time!
  def all_posted_dates(page)
    page.searchpage.search(".//li//div[@class='media']//div[@class='bd']//small[@class='byline']//@datetime")
  end

  def search_url(team)
    "http://grantland.com/?s=#{team}"
  end

end