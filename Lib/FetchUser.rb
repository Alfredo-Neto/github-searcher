require 'rest-client'
require_relative 'Response'

class FetchUser
    def getData
        puts "Insira o nome do usuário do Github"
        name = gets.chomp
        response = RestClient.get("https://api.github.com/users/#{name}")
        response = Response.new(response)
        response.instance_variables.each do |variable|
            puts variable.get
        end
        # response.dumpResponse
    end
end
