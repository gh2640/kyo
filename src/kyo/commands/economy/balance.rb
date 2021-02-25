module KyoBot
  module Comandos
    module Balance
       extend Discordrb::Commands::CommandContainer
       command :balance do |event, args|
        break if event.message.channel.type == 1

          if event.message.mentions[0]
            user = Bot.user(event.message.mentions[0].id)
          elsif args
            user = event.server.member(args) 
          else
            user = event.user
          end

       unless user
        break event.respond "Não encontrei esse usuário"
       end

       saldo = Db[:users].where(:id => user.id).first
       
       unless saldo
        Db[:users].insert(:id => user.id, :money => 0, :bank => 0)

        saldo = Db[:users].where(:id => user.id).first
       end  

       event.channel.send_embed do |e|
        e.title = if args.nil? then "Seu saldo"
          else "Saldo de #{user.name}"
          end
        e.add_field(name: "Carteira", value: saldo[:money], inline: true)
         e.add_field(name: "Banco", value: saldo[:bank], inline: true)
        end
      end
    end
  end
end