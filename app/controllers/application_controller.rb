class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :bleat_it

  def bleat_it
    @bleat = Bleat.new
  end
end
