class SmartHashMerge
  def self.merge(lhs, rhs)
    new(lhs, rhs).merge
  end

  def initialize(lhs, rhs)
    @lhs, @rhs = lhs, rhs
  end

  def merge
    lhs = @lhs.dup
    deep_merge(lhs, @rhs)
  end

private
  def deep_merge(lhs, rhs)
    rhs.each do |key, rvalue|
      lvalue = lhs[key]
      if lvalue.is_a?(Hash) and rvalue.is_a?(Hash)
        deep_merge(lvalue, rvalue)
      elsif lvalue.is_a?(Array) and rvalue.is_a?(Array)
        lhs[key] = lvalue + rvalue
      elsif rvalue.is_a?(Array)
        lhs[key] = [lvalue] + rvalue
      else
        lhs[key] = rvalue
      end
    end
    lhs
  end
end
