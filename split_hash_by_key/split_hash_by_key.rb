# frozen_string_literal: true

module ExtractData
  def self.split_hash_by_key(data, *args)
    result = []
    validate_presence_args!(data, args)

    args.each do |key|
      chunk, data = split_hash_chunk(data, key)
      result << chunk if chunk.any?
    end

    result << data
  end

  def self.split_hash_chunk(data, key)
    chunk = {}
    data.map do |k, val|
      break if k == key
      chunk.merge!({ k => val })
      data.delete(k)
    end
    return chunk, data
  end

  def self.validate_presence_args!(data, args)
    args.each do |key|
      raise StandardError, "#{key} not present in hash" unless data.key?(key)
    end
  end
end
