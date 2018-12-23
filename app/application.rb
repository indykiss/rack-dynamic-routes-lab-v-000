class Application
  @@items = Item.all

 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path== "/items/ #{@@item.name}"
      @@items.each do |item|
      resp.write "#{item.price}"
      end 
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  
end


end 
