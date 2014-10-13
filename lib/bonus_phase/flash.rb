require 'json'
require 'webrick'

module BonusPhase
	class Flash
		def initialize(req)
			req.cookies.each do |cookie|
        next unless cookie.name == '_rails_lite_app_flash'
        @cookie = JSON.parse(cookie.value)
      end
      @cookie ||= {}
      @now = {}
      @next_flash = {}
		end

		attr_accessor :now

		def [](key)
			@now[key] || @cookie[key] || []
		end

		def []=(key, val)
			@next_flash[key] = val
		end

    def store_flash(res)
    	res.cookies << WEBrick::Cookie.new('_rails_lite_app_flash', @next_flash.to_json)
    end
	end
end