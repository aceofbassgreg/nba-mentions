class Robot
  include Teams

  attr_reader :agent

  def initialize(agent)
    @agent = agent
  end

  def self.mechanize_agent
    Mechanize.new
  end

  def articles_hash(url, source, date)
    {
      url: url,
      source: source,
      publication_date: date
    }
  end

  def create_article_record(hash)
    Article.create(
                    url: hash[:url], 
                    source: hash[:source], 
                    publication_date: hash[:publication_date]
                  )
  end
  
end