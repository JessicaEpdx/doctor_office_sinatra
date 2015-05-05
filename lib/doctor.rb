class Doctor
attr_reader(:name, :specialty, :id)


define_method(:initialize) do |attributes|
  @name = attributes.fetch(:name)
  @specialty = attributes.fetch(:specialty)
  @id = attributes.fetch(:id)
end

define_method(:save) do
  result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
  @id = result.first().fetch("id").to_i()
end


end
