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
  erb(:doctors)
end
