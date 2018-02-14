class DataFile

  attr_reader :data

  def initialize
    raise NotImplementedError.new "An abstract class should not be instantiated" if instance_of? DataFile
    @data = []
    load_data
  end

  private

  def load_data
    raise NotImplementedError.new "A data file class must be able to #load!"
  end

  def add_data(data)
    @data << data
  end
end
