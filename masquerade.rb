require 'rubygems'
require 'sinatra'

set :public, Proc.new { File.join(root, "output") }

# This before filter ensures that your pages are only ever served 
# once (per deploy) by Sinatra, and then by Varnish after that
# before do
#   response.headers['Cache-Control'] = 'public, max-age=31557600' # 1 year
# end

get '/' do
  cache_control :public, :max_age => 31557600
  File.read('output/index.html')
end