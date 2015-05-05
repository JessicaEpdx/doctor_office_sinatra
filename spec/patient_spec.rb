require('spec_helper')

describe(Patient) do
  describe('#name') do
    it("returns name of patient") do
      pat = Patient.new({:name => "Billy", :birthday => "1980/05/08", :doctor_id => 2})
      expect(pat.name()).to(eq("Billy"))
    end
  end

  describe('#birthday') do
    it("returns birthday of patient") do
      pat = Patient.new({:name => "Michael J", :birthday => "1972/01/02", :doctor_id => 3})
      expect(pat.birthday()).to(eq("1972/01/02"))
    end
  end

  describe('#doctor_id') do
    it("returns doctor id of patient") do
      pat = Patient.new({:name => "Margaret Cho", :birthday => "1980/10/12", :doctor_id => 4})
      expect(pat.doctor_id()).to(eq(4))
    end
  end


end
