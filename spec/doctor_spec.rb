require('spec_helper')

describe(Doctor) do
  describe('#name') do
    it('will return the name of the doctor') do
      doc = Doctor.new({:name => "Dr Who", :specialty => "Time Travel", :id => nil})
      expect(doc.name()).to(eq("Dr Who"))
    end
  end

  describe('#specialty') do
    it('will return the specialty of the doctor') do
      doc = Doctor.new({:name => "Dr Brown", :specialty => "Buttology", :id => nil})
      expect(doc.specialty()).to(eq("Buttology"))
    end
  end

  describe('#id') do
    it('will return the id of a doctor') do
      doc = Doctor.new({:name => "Dr Quinn", :specialty => "Daytime Medicine", :id => nil})
      doc.save()
      expect(doc.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it("will save a doctor to the database") do
      doc = Doctor.new({:name => "Dr Dre", :specialty => "Phat Beatz", :id => nil})
      doc.save()
      expect(Doctor.all()).to(eq([doc]))
      end
    end

  describe('.all') do
    it('list all of the doctors') do
      doc = Doctor.new({:name => "Dr Zoidberg", :specialty => "Being Lonely", :id => nil})
      doc.save()
      expect(Doctor.all()).to(eq([doc]))
    end
  end

  describe('.find') do
    it('list all of the doctors') do
      doc = Doctor.new({:name => "Dr Zoidb", :specialty => "Benely", :id => nil})
      doc.save()
      expect(Doctor.find(doc.id())).to(eq(doc))
    end
  end


end
