def allUnique(str)
  hsh = {}
  for i in 0..str.length
    if hsh[str[i]]
      return false
    else
      hsh[str[i]] = true
    end
  end

  return true
end

def allUnique2(str)
  # You dont need to check until the end so length - 1
  for i in 0..str.length-1
    # Make sure you iterate from i + 1
    for j in i+1..str.length
      if str[i] == str[j]
        return false
      end
    end
  end

  return true
end

def reverse(str)
  b = ""
  i = str.length - 1

  # Need to use a while because no reverse range
  while i >= 0
    b += str[i]
    i = i - 1
  end

  return b
end

def removeDups(str)
  if str.length < 2
    return str
  end

  for i in 0..str.length-1
    j = i + 1
    while j < str.length
      if str[j] == str[i]
        str.slice!(j)
        j = i + 1
      else
        j = j + 1
      end
    end
  end

  str
end

def isAnagram(str1, str2)
  if str1.nil? || str2.nil?
    return false
  end

  str1.split("").sort.join("") == str2.split("").sort.join("")
end

def replaceSpaces(str)
  str.gsub!(/ /, "%20")
end

a = "helloworld"
#puts allUnique(a) # 1.1a
#puts allUnique2(a) # 1.1b
#puts reverse(a) # # 1.2
#puts removeDups(a) # 1.3
#puts isAnagram("hello", "olleh") # 1.4
#puts replaceSpaces("hi world") # 1.5

