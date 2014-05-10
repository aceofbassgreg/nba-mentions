class CbsSportsBot < Robot

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
    "http://search.grantland.com/#{team}/"
  end

end