require('sinatra')
require('sinatra/reloader')
require('./lib/doctor')
require('./lib/patient')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "doctor_office"})

get('/') do
  erb(:index)
end

get('/doctors') do
  @doctors=Doctor.all()
  erb(:doctors)
end

post('/doctors/new') do
  name = params.fetch("doc")
  specialty = params.fetch('specialty')
  doct = Doctor.new({:name => name, :specialty => specialty, :id => nil})
  doct.save()
  @doctors = Doctor.all()
  erb(:doctors)
end
