get '/' do
  @livesets = Liveset.all.order(date_aired: :desc)
  erb :home
end

post '/search' do
  search = params[:query]
  @livesets = Liveset.where("artist LIKE ? OR title LIKE ?", "%#{search}%","%#{search}%","%#{search}%").order(date_aired: :desc)
  erb :search
end

get '/liveset/:id' do
  @liveset = Liveset.find(params[:id])
  erb :'liveset/show'
end
