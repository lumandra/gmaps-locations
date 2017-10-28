module ApplicationHelper

  def body_controller
    params[:controller].split('/').push(params[:action]).join('_')
    #controller.class.to_s.gsub('::', '').gsub('Controller', '')
  end
end
