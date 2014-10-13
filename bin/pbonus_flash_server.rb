require 'webrick'
require_relative '../lib/bonus_phase/controller_base'

class MyController < BonusPhase::ControllerBase
  def go
  	#flash["next"] = 0
    #flash["next"] += 1
    flash.now["now"] = "always present"
    render :flash_show
  end
end

server = WEBrick::HTTPServer.new(Port: 3000)
server.mount_proc('/') do |req, res|
  MyController.new(req, res).go
end

trap('INT') { server.shutdown }
server.start
