# frozen_string_literal: true

module ExtractData
  def self.extract_ids(data)
    ids_values = []

    data.map do |key, value|
      ids_values << value if key == :id
      ids_values << recursive_find_ids(value) if value.instance_of?(Array)
    end

    ids_values.flatten
  end

  def self.recursive_find_ids(data)
    extracted = []

    data.map do |key|
      extracted << key[:id] if key.key? :id
      key.map { |_k, v| extracted << recursive_find_ids(v) if v.instance_of?(Array) }
    end

    extracted
  end
end
