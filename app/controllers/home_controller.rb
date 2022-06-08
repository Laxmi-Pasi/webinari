class HomeController < ApplicationController
  def index
    @upcoming_workshops = Workshop.upcoming_workshops
    @past_workshops = Workshop.past_workshops
    @ongoing_workshops = Workshop.ongoing_workshops
  end
end
