require "discordrb"
require "sequel"
require "dotenv/load"

module KyoBot
  
  Bot = Discordrb::Commands::CommandBot.new token: ENV["TOKEN"], client_id: ENV["CLIENTID"], prefix: ENV["PREFIX"], ignore_bots: true
  
 # Db = Sequel.sqlite("database/database.db")
  
 # unless Db.table_exists(:users)
 #   Db.create_table :users do 
 #     Integer :id 
 #   end
 # end
  
  Bot.ready do 
  Bot.dnd 
  Bot.game = "#{Bot.prefix}ping"
  puts "O bot #{Bot.profile.name} está online"
  end
 
  module Comandos; end
  Dir["src/kyo/commands/*/*.rb"].each { |foda| load foda }
  Comandos.constants.each do |kkk|
    Bot.include! Comandos.const_get kkk
  end
  
  Bot.run
 
end