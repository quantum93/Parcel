require('sinatra')
require('sinatra/reloader')
require('./lib/parcel')
require('pry')
also_reload('lib/**/*.rb')

get ('/') do
  @parcels = Parcel.all
  erb(:parcels)
end

get ('/parcels') do
  @parcels = Parcel.all?
  erb(:parcels)
end

get ('/parcels/new') do
  erb(:new_parcel)
end

get ('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  erb(:parcel)
end

post ('/parcels') do
  name = params[:parcel_name]
  parcel = Parcel.new(name, nil)
  parcel.save()
  @parcels = Parcel.all
  erb(:parcels)
end

get ('/parcels/:id/edit') do
  @parcel = Parcel.find(params[:id].to_i())
  erb(:edit_parcel)
end

patch ('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  @parcel.update(params[:name])
  @parcels = Parcel.all
  erb(:parcels)
end

delete ('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  @parcel.delete()
  @parcels = Parcel.all
  erb(:parcels)
end
