require 'rspec'
require 'parcel'

describe '#Parcel'  do

  before(:each) do
    Parcel.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no parcels") do
      expect(Parcel.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a parcel") do
      parcel = Parcel.new("Tae Lee", 30, 3, 4, 5, nil) # nil added as second argument
      parcel.save()
      parcel2 = Parcel.new("Josh Mabry", 40, 4, 4, 6, nil) # nil added as second argument
      parcel2.save()
      expect(Parcel.all).to(eq([parcel, parcel2]))
    end
  end

  describe('#==') do
    it("is the same parcel if it has the same attributes as another parcel") do
      parcel = Parcel.new("Tae Lee", 30, 3, 4, 5, nil)
      parcel2 = Parcel.new("Tae Lee", 30, 3, 4, 5, nil)
      expect(parcel).to(eq(parcel2))
    end
  end

  describe('.clear') do
    it("clears all parcels") do
      parcel = Parcel.new("Tae Lee", 30, 3, 4, 5, nil)
      parcel.save()
      parcel2 = Parcel.new("Josh Mabry", 40, 4, 4, 6, nil)
      parcel2.save()
      Parcel.clear()
      expect(Parcel.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a parcel by id") do
      parcel = Parcel.new("Tae Lee", 30, 3, 4, 5, nil)
      parcel.save()
      parcel2 = Parcel.new("Josh Mabry", 40, 4, 4, 6, nil)
      parcel2.save()
      expect(Parcel.find(parcel.id)).to(eq(parcel))
    end
  end

  describe('#update') do
    it("updates a parcel by id") do
      parcel = Parcel.new("Tae Lee", 30, 3, 4, 5, nil)
      parcel.save()
      parcel.update("Ben Martinson")
      expect(parcel.name).to(eq("Ben Martinson"))
    end
 end

 describe('#delete') do
  it("deletes a parcel by id") do
    parcel = Parcel.new("Tae Lee", 30, 3, 4, 5, nil)
    parcel.save()
    parcel2 = Parcel.new("Josh Mabry", 40, 4, 4, 6, nil)
    parcel2.save()
    parcel.delete()
    expect(Parcel.all).to(eq([parcel2]))
  end
end

end
