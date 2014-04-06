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
  
end