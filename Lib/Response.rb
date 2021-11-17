require 'json'

class Response
    attr_reader :username, :followers, :repositoryCount

    def initialize response
        body = JSON.parse(response.body)
        @username = body['name']
        @followers = body['followers']
        @repositoryCount = body['public_repos']
    end

    def dumpResponse
        puts
        puts "Name: #{@username}"
        puts "Followers: #{@followers}"
        puts "Number of repos: #{@repositoryCount}"
    end

    def writeToFile text
        File.open("#{Time.now.strftime("%d-%m-%Y_%k_%M_%S")}.txt", 'a') do |line|
            line.puts(text)
        end
    end
end