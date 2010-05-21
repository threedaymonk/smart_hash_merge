class SmartHashMerge
  def self.merge(lhash, rhash)
    new(lhash, rhash).merge
  end

  def initialize(lhash, rhash)
    @lhash, @rhash = lhash, rhash
  end

  def merge
    lhash = @lhash.dup
    deep_merge(lhash, @rhash)
  end

private
  def deep_merge(lhash, rhash)
    rhash.each do |key, rvalue|
      lvalue = lhash[key]
      if lvalue.is_a?(Hash) and rvalue.is_a?(Hash)
        deep_merge(lvalue, rvalue)
      elsif lvalue.is_a?(Array) and rvalue.is_a?(Array)
        lhash[key] = lvalue + rvalue
      elsif rvalue.is_a?(Array)
        lhash[key] = [lvalue] + rvalue
      else
        lhash[key] = rvalue
      end
    end
    lhash
  end
end
