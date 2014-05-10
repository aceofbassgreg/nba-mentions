class EspnBot < Robot

  include MentionsParser

  def self.start
    bot = EspnBot.new(mechanize_agent)
    bot
  end

  def scrape_teams_for_db
    teams.each do |team|
      aha = team.downcase.gsub!(' ','-')
      puts "Scraping for #{team}..."
      articles = []
      page  = agent.get(search_url(aha))
      hrefs = all_link_hrefs(page).map {|link| link.text}
      dates = all_posted_dates(page).map {|span| span.text.split('| ')[-1]}
      page_data = hrefs.zip(dates)
      page_data.each do |arr|
        articles << articles_hash(arr[0],"espn",arr[1])
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
    page.search(".//li[@class='result']//h3")
  end

  def all_link_hrefs(page)
    page.search(".//li[@class='result']//h3//@href")
  end

  def all_posted_dates(page)
    page.search(".//li[@class='result']//div//span")
  end

  def search_url(team)
    "http://search.espn.go.com/#{team}/"
  end

end