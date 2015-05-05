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

  define_singleton_method(:all) do
    all_docs = DB.exec("SELECT * FROM doctors;")
    result = []
    all_docs.each() do |doc|
      name = doc.fetch('name')
      specialty = doc.fetch('specialty')
      id_number = doc.fetch('id').to_i
      result.push(Doctor.new({:name => name, :specialty => specialty, :id => id_number}))
    end
    result
  end

  define_singleton_method(:find) do |id|
    found_doctor = nil
    all_doctors = Doctor.all()
    all_doctors.each() do |doctor|
      doctor.id().to_i == id
      found_doctor = doctor
    end
    found_doctor
  end

  define_method(:==) do |other_doctor|
    self.name == other_doctor.name && self.specialty == other_doctor.specialty  
  end



end
