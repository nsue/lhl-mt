get '/' do
  @livesets = Liveset.all.order(date_aired: :desc)
  erb :home
end

post '/search/?' do
  search = params[:query]
  @livesets = Liveset.where("artist LIKE ? OR title LIKE ?", "%#{search}%","%#{search}%").order(date_aired: :desc)
  # TODO: Also search through tracks that have the search query
  erb :search
end

get '/liveset/:id/?' do
  @liveset = Liveset.find(params[:id])
  suckr = ImageSuckr::GoogleSuckr.new
  @image_url = suckr.get_image_url({"q" => "#{@liveset.artist}"})
  erb :'liveset/show'
end
