# frozen_string_literal: true

require_relative "deep_freeze/version"

module DeepFreeze
  def deep_freeze(obj)
    case obj
    when String, Numeric, Symbol, TrueClass, FalseClass, NilClass
      obj.freeze
    when Hash
      obj.each {|k,v| deep_freeze(k); deep_freeze(v)}
      obj.freeze
    when Array
      obj.each { |e| deep_freeze(e) }
      obj.freeze
    else
      raise "Cant Deep Freeze Objects of Class #{obj.class}"
    end

  end
end
