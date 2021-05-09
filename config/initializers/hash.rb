class Hash
  def recursive_compact
    each_with_object({}) do |(k, v), new_hash|
      if v&.class == Hash
        compacted_hash = v.recursive_compact
        new_hash[k] = compacted_hash if compacted_hash.present?
      elsif !v&.class.nil?
        new_hash[k] = v
      end

      new_hash
    end
  end
end
