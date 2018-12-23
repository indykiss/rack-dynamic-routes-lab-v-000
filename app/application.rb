class Application
  @@items = Item.all

 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
      @@items.each do |item|
      resp.write "#{item.price}"
      end 
        elsif req.path.match(/items/) == nil 
           resp.status = "400"
           resp.write "Item not matched"
      
           else
            resp.write "Route not found"
            resp.status = 404
    end
    resp.finish
  
end


end 
