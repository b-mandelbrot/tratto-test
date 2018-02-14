class DataAccess
  class DataNotFoundError < Exception; end

  def initialize(data=[])
    raise NotImplementedError.new "An abstract class should not be instantiated" if instance_of? DataAccess
    @data = data
  end

  def all
    data
  end

  def find_by(params)
    where(params).first
  end

  def find_by!(params)
    result = where(params).first
    raise DataNotFoundError.new "#{data.first.class} with params=#{params} not found!" unless result
    result
  end

  def where(params)
    data.select { |wallet| params.keys.all? { |key| wallet.send(key) == params[key] }}
  end

  private

  attr_reader :data
end
