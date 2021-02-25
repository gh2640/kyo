module KyoBot
  module Comandos
    module Eval
        extend Discordrb::Commands::CommandContainer
        command :eval do |event, *args|
          break if event.user.id != ENV["OWNERID"].to_i 
          
          begin
          code = eval args.join(" ")
          
           if code.include? Bot.token
            break event.respond "Meu token é secreto, ok?"
           end
           
           event.channel.send_embed do |e|
             e.color = "000000"
             e.title = "Resultado: "
             e.description = "```rb\n#{code}```"
           end
          
          rescue => error
           event.channel.send_embed do |e|
             e.color = "FF0000"
             e.title = "Ocorreu um erro:"
             e.description = "```#{error.message}```"
           end
          end
          
        end
    end
  end
end