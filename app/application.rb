require_relative 'item.rb'
class Application

    @@items = []



    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        if req.path.match(/\/items\//)
            item_name = req.path.split("/items/").last
            matching_item = @@items.find{|item| item.name == item_name}
            if matching_item == nil
                resp.write "Item not found"
                resp.status = 400
            else
                resp.write matching_item.price
                resp.status = 200
            end
        else
            resp.status = 404
            resp.write "Route not found"
        end
        resp.finish
    end
end


