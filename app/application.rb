require 'pry'
require_relative 'item'

class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_string = req.path.split("/items/").last
            if item = Item.all.find{|i| i.name == item_string}
                resp.write item.price 
            else
                resp.write "Item not found"
                resp.status = 400
            end
            
        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end

end