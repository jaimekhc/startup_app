# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  	#Return the full title on a per-page basis.
	def full_title(page_title)
		base_title = "Itstar 伊仕達行銷"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
