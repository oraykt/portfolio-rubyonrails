class PagesController < ApplicationController
  # GET /
  def home
    @skills = Skill.all
  end

  # GET /about-me
  def about; end

  # GET /contact
  def contact; end
end
