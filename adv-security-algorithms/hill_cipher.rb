module Hill
  LOWER_CASE = ("a".."z").to_a
  UPPER_CASE = ("A".."Z").to_a

  def Hill.generate_key_matrix(string)
    stringIdx = 0
    i = 0
    matrix = [[0,0], [0,0]]

    2.times do 
      j = 0
      2.times do
        matrix[i][j] = UPPER_CASE.index(string[stringIdx]) % 26
        stringIdx += 1
        j += 1
      end
      i += 1
    end

    return matrix
  end

  def Hill.create_text_vectors(text)
    text_vectors = {}
    stringIdx = 0
    i = 0

    (text.length / 2).times do 
      text_vectors[i] = [UPPER_CASE.index(text[stringIdx]) % 26, UPPER_CASE.index(text[stringIdx + 1]) % 26]
      stringIdx += 2
      i += 1
    end

    return text_vectors
  end

  def Hill.hill_encrypt(text_vectors, key_matrix)
    encrypted_text = ""
    vector = 0

    text_vectors.length.times do
      key_matrix.each do |row|
        sum = ((row[0] * text_vectors[vector][0]) + (row[1] * text_vectors[vector][1])) % 26
        encrypted_text += UPPER_CASE[sum]
      end
      vector += 1
    end

    return encrypted_text
  end
end

def test
  text = "CAKEQ"
  keyword = "BAKE"
  text_vectors = Hill.create_text_vectors(text)
  key_matrix = Hill.generate_key_matrix(keyword)

  print "Encrypted: #{Hill.hill_encrypt(text_vectors, key_matrix)}"
end

test
