require_relative '../phase6/controller_base'
require_relative './flash'

module BonusPhase
	class ControllerBase < Phase6::ControllerBase
	  def redirect_to(url)
	  	super(url)
	  	flash.store_flash(self.res)
	  end

	  def render_content(content, type)
	  	super(content, type)
	  	flash.store_flash(self.res)
	  end

	  def flash
	  	@flash ||= Flash.new(self.req)
	  end
	end
end
