module ApplicationHelper
  def home_controller?
    params[:cotroller].eql?('home')
  end
end
