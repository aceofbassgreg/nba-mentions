class EspnBot < Robot

  def self.start
    EspnBot.new(mechanize_agent)
  end

  def scrape_teams
    teams.each do |team|
      aha = team.downcase.gsub!(' ','-')
      puts "Scraping for #{team}..."
      articles = []
      page  = agent.get(search_url(articles_hash))
      puts "Got page for following URL:  #{search_url(team)}"
      hrefs = all_link_hrefs(page).map {|link| link.text}
      puts "first href:  #{hrefs[0]}"
      dates = all_posted_dates(page).map {|span| span.text.split('| ')[-1]}
      puts "first date:  #{dates[0]}"
      page_data = hrefs.zip(dates)
      page_data.each do |arr|
        articles << articles_hash(arr[0],"espn",arr[1])
      end
      puts "Results: \n\n"
      puts articles
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