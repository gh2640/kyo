module KyoBot
  module Comandos
    module Ping 
       extend Discordrb::Commands::CommandContainer
       command(:ping) do |event|
         event.respond "Pong!"
       end
    end
  end
end