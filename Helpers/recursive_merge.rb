module Nab

  def Nab.recursive_merge(default, request)
    request.keys.each do |k|
      if default[k].is_a?(Hash) && request[k].is_a?(Hash)
        default[k] = recursive_merge(default[k], request[k])
      else
        default[k] = request[k]
      end
    end
    default
  end
end