# encoding: utf-8
module ApplicationHelper

	#Return the full title on a per-page basis.
	def full_title(page_title)
		base_title = "Itstar 伊仕達行銷"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end


  #For Devise login form anywhere
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
