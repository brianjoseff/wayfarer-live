module ApplicationHelper
  def truncate(words, limit)
    if words.nil?
      return
    end
    string_arr = words.split(' ')
    string_arr.count > limit ? "#{string_arr[0..(limit-1)].join(' ')}..." : words
  end
  
  def truncate_with_link(words, limit, path)
    if words.nil?
      return
    end
    string_arr = words.split(' ')
    string_arr.count > limit ? "#{string_arr[0..(limit-1)].join(' ')}...""#{link_to 'Read More', path}" : words
  end
  
  
  def formatted_price(amount)
    sprintf("$%0.0f", amount / 100.0)
  end
  
end
