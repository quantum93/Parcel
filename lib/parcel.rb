class Parcel
  attr_accessor :name, :weight, :length, :height, :width, :id

  @@parcels = {}
  @@total_rows = 0

  def initialize(name, weight, length, height, width, id)
    @name = name
    @weight = weight
    @length = length
    @height = height
    @width = width
    @id = id || @@total_rows += 1
  end

  def self.all
    @@parcels.values() # values for key-value pair of hash
  end

  def save
    @@parcels[self.id] = Parcel.new(self.name, self.weight, self.length, self.height, self.width, self.id)
  end

  def self.clear
    @@parcels = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@parcels[id]
  end

  def update(name)
    self.name = name
    self.weight = weight
    self.length = length
    self.height = height
    self.width = width
    @@parcels[self.id] = Parcel.new(self.name, self.weight, self.length, self.height, self.width, self.id)
  end

  def delete
    @@parcels.delete(self.id)
  end

  def ==(parcel_to_compare)
    self.name() == parcel_to_compare.name()
  end

end
