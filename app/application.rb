class Application
  @@items = Item.all

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    @@items.each do |item|
      
      if @@items.include?(item)
        resp.write "#{item.price}"
        elsif @@items.exclude?(item)
           resp.write "Item not found"
           resp.status = 400
            else
             resp.write "Route not found"
             resp.status = 404
    end
    resp.finish
end
end 
