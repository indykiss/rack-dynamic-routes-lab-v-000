class Application
  @@items = Item.all

 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    @@items.each do |item|
    if req.path== "/items/ #{item.name}"
      resp.write "#{item.price}"
      end 
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  
end


end 
