class ApplicationController < ActionController::Base
  protect_from_forgery
  $time = I18n.l Time.now
end
