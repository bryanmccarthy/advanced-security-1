module Hill
  LOWER_CASE = ("a".."z").to_a
  UPPER_CASE = ("A".."Z").to_a

  def Hill.generate_matrix(string)
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

  def Hill.hill_encrypt(text_matrix, key_matrix)
    encrypted_matrix = [[0,0], [0,0]]
    encrypted_text = ""
    i = 0

    2.times do 
      j = 0
      2.times do
        k = 0
        2.times do
          encrypted_matrix[i][j] += key_matrix[i][k] * text_matrix[k][j]
          k += 1
        end
        j += 1
      end
      i += 1
    end

    encrypted_matrix.each_with_index do |row, i|
      row.each_with_index do |col, j|
        encrypted_matrix[i][j] %= 26
        encrypted_text += UPPER_CASE[encrypted_matrix[i][j]]
      end
    end

    return encrypted_text
  end
end

def test
  text = "CAKE"
  key = "BAKE"

  text_matrix = Hill.generate_matrix(text)
  print text_matrix
  key_matrix = Hill.generate_matrix(key)
  puts
  print key_matrix
  puts

  print Hill.hill_encrypt(text_matrix, key_matrix)
end

test
