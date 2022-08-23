module ExtractData
  def self.split_hash_by_key(data, *args)
    new_array = []
    memo_hash = {}
    args.map do |key|
      raise ArgumentError unless data.key?(key)
      data.map do |k, val|
        if k == key
          new_array << memo_hash if memo_hash.any?
          memo_hash = {}
          memo_hash.merge!({k => val})
          break
        end
        memo_hash.merge!({k => val})
        data.delete(k)
      end
    end
    new_array << data
    new_array
  end
end