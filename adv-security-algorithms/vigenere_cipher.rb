module Vigenere
  LOWER_CASE = ("a".."z").to_a
  UPPER_CASE = ("A".."Z").to_a

  def Vigenere.generate_key(text, keyword)
    key = keyword.split("")

    if text.length == key.length
      return key
    else
      i = 0
      (text.length - key.length).times do
        key.append(key[i % key.length])
        i += 1
      end
    end

    return key.join
  end

  def Vigenere.vigenere_encrypt(text, key)
    key = key.downcase
    encrypted_text = ""
    i = 0

    text.split("").each do |x|
      if LOWER_CASE.include?(x)
        new_idx = (LOWER_CASE.index(x) + LOWER_CASE.index(key[i])) % 26
        encrypted_text += LOWER_CASE[new_idx]
        i += 1
      elsif UPPER_CASE.include?(x)
        new_idx = (UPPER_CASE.index(x) + LOWER_CASE.index(key[i])) % 26
        encrypted_text += UPPER_CASE[new_idx]
        i += 1
      else
        encrypted_text += x
      end
    end

    return encrypted_text
  end

  def Vigenere.vigenere_decrypt(text, key)
    key = key.downcase
    decrypted_text = ""
    i = 0

    text.split("").each do |x|
      if LOWER_CASE.include?(x)
        new_idx = (LOWER_CASE.index(x) - LOWER_CASE.index(key[i])) % 26
        decrypted_text += LOWER_CASE[new_idx]
        i += 1
      elsif UPPER_CASE.include?(x)
        new_idx = (UPPER_CASE.index(x) - LOWER_CASE.index(key[i])) % 26
        decrypted_text += UPPER_CASE[new_idx]
        i += 1
      else
        decrypted_text += x
      end
    end

    return decrypted_text
  end
end

def test
  # Decrypt
  encrypted_text = 'XQKP IZ IMWEB LK AUVZCXKW PHL VPE RIKD ASOZZSBZI TOIE ESTD XEJWXM
CPS-3. PHPA TA DPW NEZCWB YN S OIE-GPIB KGIPLBTBSWF, WNK UJ WGV KGEPV
TA YVW KF APP NSDW NETITVSVY BIUIWQCBK (KUA WQ IX QFETPIW 64). QD\'A
HNOIIMTI BGK LHBP NYZ EA TV IQNOKL PHL NTVKT VACPATWX, JMP I HU
SWZQFC FVZ "YW KESND." PB\'D VYB LDAA BSM XMO DAZP QCXKLEOUA LZOV\'L
WNF OZWN, QL\'O TOIE EO LGJ\'T YMLTVG FAEK WYM. GPWJ WL AEIBBWZ TOQD
XBWUASZ JLKU QF 2006, ET SWZSOL SO IM EP EYCDZ BL VPMNQFC A UMH PKAZ
BUUKEQYV KKOU. BSM CPS BATQWG (GPAYH PA CMKTDU PHZE WP BZA MK4 IYL
WL5 XWMPTJ), EKA MJDLZ TVMZWWSPVR XBMKOUYM QZYU FAW AGAMC WX
YRFXEIXIDUSPA. HM NQVJ\'T RVZE RWO HOUO EPO DSNIVCD ARI-2 NWRPIYBC
EGQLK ZPUKQF OEJCCM. LCL ET\'Z 2012, IYL CPS-512 ES ZBTTV TGKKPVR OYWV.'
  keyword = 'KISWAHILI'
  key = Vigenere.generate_key(encrypted_text, keyword)
  puts Vigenere.vigenere_decrypt(encrypted_text, key)
end

test
