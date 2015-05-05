class Patient
attr_reader(:name, :birthday, :doctor_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @birthday = attributes.fetch(:birthday)
    @doctor_id = attributes.fetch(:doctor_id)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO patients (name, birthday, doctor_id) VALUES ('#{@name}', '#{@birthday}', #{@doctor_id});")
  end

  define_singleton_method(:all) do
    all_pats = DB.exec("SELECT * FROM patients;")
    result = []
    all_pats.each() do |pat|
      name = pat.fetch('name')
      birthday = pat.fetch('birthday')
      doctor_id = pat.fetch('doctor_id').to_i
      result.push(Patient.new({:name => name, :birthday => birthday, :doctor_id => doctor_id}))
    end
    result
  end

end
