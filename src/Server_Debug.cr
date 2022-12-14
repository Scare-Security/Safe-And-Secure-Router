#
# ................................................................................................................................................................................................................................................................................................................................................................................................................................................................................
# : 
# : 
# : 
# : _____/\\\\\\\\\\\___________________________________________________________________________/\\\\\\\\\\\_________________________________________________________________________________________________________/\\\\\\\\\\\\_________________________________________________/\\\\\\_______________________________________________________________________________________________        
# : ___/\\\/////////\\\_______________________________________________________________________/\\\/////////\\\______________________________________________________________________________________________________\/\\\////////\\\______________________________________________\////\\\_______________________________________________________________________________________________       
# : __\//\\\______\///_______________________________________________________________________\//\\\______\///____________________________________________________________/\\\_____/\\\_________/\\\__/\\\___________\/\\\______\//\\\________________________________________________\/\\\____________________/\\\\\\\\\_______________________________________________________/\\\______      
# :   ___\////\\\_____________/\\\\\\\\__/\\\\\\\\\_____/\\/\\\\\\\______/\\\\\\\\______________\////\\\_____________/\\\\\\\\______/\\\\\\\\__/\\\____/\\\__/\\/\\\\\\\__\///___/\\\\\\\\\\\___\//\\\/\\\____________\/\\\_______\/\\\_____/\\\\\\\\___/\\\____/\\\_____/\\\\\\\\_____\/\\\________/\\\\\_____/\\\/////\\\____/\\\\\__/\\\\\_______/\\\\\\\\___/\\/\\\\\\____/\\\\\\\\\\\_     
# :    ______\////\\\________/\\\//////__\////////\\\___\/\\\/////\\\___/\\\/////\\\________________\////\\\________/\\\/////\\\___/\\\//////__\/\\\___\/\\\_\/\\\/////\\\__/\\\_\////\\\////_____\//\\\\\_____________\/\\\_______\/\\\___/\\\/////\\\_\//\\\__/\\\____/\\\/////\\\____\/\\\______/\\\///\\\__\/\\\\\\\\\\___/\\\///\\\\\///\\\___/\\\/////\\\_\/\\\////\\\__\////\\\////__    
# :     _________\////\\\____/\\\___________/\\\\\\\\\\__\/\\\___\///___/\\\\\\\\\\\____________________\////\\\____/\\\\\\\\\\\___/\\\_________\/\\\___\/\\\_\/\\\___\///__\/\\\____\/\\\__________\//\\\______________\/\\\_______\/\\\__/\\\\\\\\\\\___\//\\\/\\\____/\\\\\\\\\\\_____\/\\\_____/\\\__\//\\\_\/\\\//////___\/\\\_\//\\\__\/\\\__/\\\\\\\\\\\__\/\\\__\//\\\____\/\\\______   
# :      __/\\\______\//\\\__\//\\\_________/\\\/////\\\__\/\\\_________\//\\///////______________/\\\______\//\\\__\//\\///////___\//\\\________\/\\\___\/\\\_\/\\\_________\/\\\____\/\\\_/\\___/\\_/\\\_______________\/\\\_______/\\\__\//\\///////_____\//\\\\\____\//\\///////______\/\\\____\//\\\__/\\\__\/\\\_________\/\\\__\/\\\__\/\\\_\//\\///////___\/\\\___\/\\\____\/\\\_/\\__  
# :      _\///\\\\\\\\\\\/____\///\\\\\\\\_\//\\\\\\\\/\\_\/\\\__________\//\\\\\\\\\\___________\///\\\\\\\\\\\/____\//\\\\\\\\\\__\///\\\\\\\\_\//\\\\\\\\\__\/\\\_________\/\\\____\//\\\\\___\//\\\\/________________\/\\\\\\\\\\\\/____\//\\\\\\\\\\____\//\\\______\//\\\\\\\\\\__/\\\\\\\\\__\///\\\\\/___\/\\\_________\/\\\__\/\\\__\/\\\__\//\\\\\\\\\\_\/\\\___\/\\\____\//\\\\\___ 
# :       ___\///////////________\////////___\////////\//__\///____________\//////////______________\///////////_______\//////////_____\////////___\/////////___\///__________\///______\/////_____\////__________________\////////////_______\//////////______\///________\//////////__\/////////_____\/////_____\///__________\///___\///___\///____\//////////__\///____\///______\/////____
# :
# : This code belongs to the scare security organization. This code you may use and may re distribute as this is a open source project as a base for modern day applications which need simple local HTTP routing
# :
# : Please make sure before distributing code is not directly pasted and this code is taken into affect, modified, remade, re named, re created, re modified and other forms of manipulation are required
# : 
# : If you do not modify make sure to give credits to the contributors and the security organization that developed this code
# : 
# :                 https://github.com/Scare-Security/Safe-And-Secure-Router
# : 
# :...............................................................................................................................................................................................................................................................................................................................................................................................................................................................................
require "json"
module Debugger 
    class Debug 
        need = HTTP::Server::Context 
        def debug(need context)
            date_post = Time.local
            supported_methods = {
                "GET": "HTTP GET",
                "POST": "HTTP POST",
            }
            puts "\e[38;5;49m[\e[38;5;55mDEBUG\e[38;5;49m]\e[38;5;49m[\e[38;5;55m#{date_post}\e[38;5;49m] CONNECTION TO   \t <#{supported_methods[context.request.method]}>--<#{context.request.path}> |"
            puts "\e[38;5;49m[\e[38;5;55mDEBUG\e[38;5;49m]\e[38;5;49m[\e[38;5;55m#{date_post}\e[38;5;49m] ===================== HEADERS ======================"
            puts "\e[38;5;49m[\e[38;5;55mDEBUG\e[38;5;49m]\e[38;5;49m[\e[38;5;55m#{date_post}\e[38;5;49m] -- \n"
            puts context.request.headers.map {|k, v| "\e[38;5;49m[\e[38;5;55mDEBUG\e[38;5;49m]\e[38;5;49m[\e[38;5;55m#{date_post}\e[38;5;49m] \e[38;5;20m#{k} \t = \e[38;5;164m#{v.join("; ")}" }.join("\n")
            if b = context.request.body 
                ct = context.request.headers["Content-Type"]
                if ct.includes?("json") 
                    puts "\e[38;5;49m[\e[38;5;55mDEBUG\e[38;5;49m]\e[38;5;49m[\e[38;5;55m#{date_post}\e[38;5;49m] ====================== JSON REQUEST BODY ==============="
                    puts "\e[38;5;49m[\e[38;5;55mDEBUG\e[38;5;49m]\e[38;5;49m[\e[38;5;55m#{date_post}\e[38;5;49m] #{JSON.parse(b).to_pretty_json}"
                    puts "\e[38;5;49m[\e[38;5;55mDEBUG\e[38;5;49m]\e[38;5;49m[\e[38;5;55m#{date_post}\e[38;5;49m] ========================== END OF BODY ============================="
                elsif ct.includes?("text") || ct.includes?("json")
                    puts "\e[38;5;49m[\e[38;5;55mDEBUG\e[38;5;49m]\e[38;5;49m[\e[38;5;55m#{date_post}\e[38;5;49m] ====================== TEXT/PLAIN REQUEST BODY ================="
                    puts "\e[38;5;49m[\e[38;5;55mDEBUG\e[38;5;49m]\e[38;5;49m[\e[38;5;55m#{date_post}\e[38;5;49m] #{b}"
                    puts "\e[38;5;49m[\e[38;5;55mDEBUG\e[38;5;49m]\e[38;5;49m[\e[38;5;55m#{date_post}\e[38;5;49m] ========================== END OF BODY ============================="
                else
                    puts "\e[38;5;49m[\e[38;5;55mDEBUG\e[38;5;49m]\e[38;5;49m[\e[38;5;55m#{date_post}\e[38;5;49m] ====================== SIZE OF REQUEST #{context.request.headers["Content-Length"]}=================== "
                    puts "\e[38;5;49m[\e[38;5;55mDEBUG\e[38;5;49m]\e[38;5;49m[\e[38;5;55m#{date_post}\e[38;5;49m] #{b}  "
                    puts "\e[38;5;49m[\e[38;5;55mDEBUG\e[38;5;49m]\e[38;5;49m[\e[38;5;55m#{date_post}\e[38;5;49m] ========================== END OF BODY ============================="
                end
            end
        end
    end
end