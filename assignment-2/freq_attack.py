# C19749651 Assignment 2 Part D

english_letter_frequencies = [
  ('E', 12.7),
  ('T', 9.1),
  ('A', 8.2),
  ('O', 7.5),
  ('I', 7),
  ('N', 6.7),
  ('S', 6.3),
  ('H', 6.1),
  ('R', 6),
  ('L', 4),
  ('D', 4.3),
  ('C', 2.8),
  ('U', 2.8),
  ('M', 2.4),
  ('W', 2.4),
  ('F', 2.2),
  ('G', 2),
  ('Y', 2),
  ('P', 1.9),
  ('B', 1.5),
  ('V', 1),
  ('K', 0.8),
  ('J', 0.2),
  ('X', 0.2),
  ('Q', 0.1),
  ('Z', 0.1)
]

def get_ciphertext_frequencies(ciphertext):
  ciphertext_frequencies = {}
  total_elements = len(ciphertext)

  # get occurences of each letter
  for i in range(len(ciphertext)):
    if ciphertext[i] in ciphertext_frequencies:
      ciphertext_frequencies[ciphertext[i]] += 1
    else:
      ciphertext_frequencies[ciphertext[i]] = 1

  # convert occurences to percentages
  for letter in ciphertext_frequencies:
    ciphertext_frequencies[letter] = round((ciphertext_frequencies[letter] / total_elements * 100), 2)
  
  return ciphertext_frequencies
  
def generate_possible_plaintexts(ciphertext, matched_letters, num_plaintexts):
  possible_plaintexts = ["" for i in range(num_plaintexts)]

  for i in range(num_plaintexts):
    for letter in ciphertext:
      possible_plaintexts[i] += matched_letters[letter][i]
  
  return possible_plaintexts
  
def match_letters_by_frequency(ciphertext_frequencies, num_plaintexts):
  matched_letters = {}

  for letter in ciphertext_frequencies:
    closest_letters = []
    closest_letter, closest_letter_index = None, None
    closest_frequency = 0
    left = 0
    right = len(english_letter_frequencies) - 1

    # find closest letter by frequency
    for i in range(len(english_letter_frequencies)):
      if abs(ciphertext_frequencies[letter] - english_letter_frequencies[i][1]) < abs(ciphertext_frequencies[letter] - closest_frequency):
        closest_letter = english_letter_frequencies[i][0]
        closest_letter_index = i
        closest_frequency = english_letter_frequencies[i][1]

    closest_letters.append(closest_letter)

    left = closest_letter_index - 1
    right = closest_letter_index + 1

    # expand from closest letter to find other possible letters with closest frequency
    while len(closest_letters) < num_plaintexts:
      if left >= 0:
        left_frequency = english_letter_frequencies[left][1]

      if right < len(english_letter_frequencies):
        right_frequency = english_letter_frequencies[right][1]

      if abs(closest_frequency - left_frequency) < abs(closest_frequency - right_frequency):
        closest_letters.append(english_letter_frequencies[left][0])
        left -= 1
      else:
        closest_letters.append(english_letter_frequencies[right][0])
        right += 1
      

    # add the letter to the matched letters dictionary
    matched_letters[letter] = closest_letters

  return matched_letters

# TEST
def test():
  ciphertext = "UZQSOVUOHXMOPVGPOZPEVSGZWSZOPFPESXUDBMETSXAIZVUEPHZHMDZSHZOWSFPAPPDTSVPQUZWYMXUZUHSXEPYEPOPDZSZUFPOMBZWPFUPZHMDJUDTMOHMQ"
  
  num_plaintexts = int(input("Enter number of possible plaintexts:"))
  ciphertext_frequencies = get_ciphertext_frequencies(ciphertext)
  print("\n\nciphertext_frequencies: ", ciphertext_frequencies)
  
  matched_letters = match_letters_by_frequency(ciphertext_frequencies, num_plaintexts)
  print("\n\nmatched_letters: ", matched_letters)
  
  possible_plaintexts = generate_possible_plaintexts(ciphertext, matched_letters, num_plaintexts)
  for plaintext in possible_plaintexts:
    print("\n", plaintext)

test()
