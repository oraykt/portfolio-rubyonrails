class PagesController < ApplicationController
  # GET /
  def home
  end

  # GET /about-me
  def about
    @page_title = "Oray Kurt | About"
    @skills = Skill.all
  end

  # GET /contact
  def contact
    @page_title = "Oray Kurt | Contact"
  end

  def tech_news
    @tweets = SocialTool.twitter_search
  end
end
