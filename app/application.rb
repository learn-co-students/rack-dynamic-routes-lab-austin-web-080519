class Application
 
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
        if req.path.match(/items/)
            # song_title = req.path.split("/songs/").last 
            # turns /items/tomato into tomotao
            item_name = req.path.split("/items/").last
            if item = @@items.find{|i| i.name == item_name}
            # resp.write = puts
            # item.price bc of attr_accessor in item class  
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