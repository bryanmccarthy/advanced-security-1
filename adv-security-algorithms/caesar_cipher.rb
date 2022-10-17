module Caesar
  LOWER_CASE = ("a".."z").to_a
  UPPER_CASE = ("A".."Z").to_a

  def Caesar.caesar_encrypt(text, key)
    encrypted_text = ""

    text.split("").each do |x|
      if LOWER_CASE.include?(x)
        encrypted_text += LOWER_CASE[(LOWER_CASE.index(x) + key) % 26]
      elsif UPPER_CASE.include?(x)
        encrypted_text += UPPER_CASE[(UPPER_CASE.index(x) + key) % 26]
      else
        encrypted_text += x
      end
    end

    return encrypted_text
  end

  def Caesar.caesar_decrypt(text, key)
    decrypted_text = ""

    text.split("").each do |x|
      if LOWER_CASE.include?(x)
        decrypted_text += LOWER_CASE[(LOWER_CASE.index(x) - key) % 26]
      elsif UPPER_CASE.include?(x)
        decrypted_text += UPPER_CASE[(UPPER_CASE.index(x) - key) % 26]
      else
        decrypted_text += x
      end
    end

    return decrypted_text
  end
end

def test
  # Encrypt
  text = "this will be ENCRYPTED"
  key = 28
  puts "Encrypted: #{Caesar.caesar_encrypt(text, key)}"
  puts

  # Decrypt
  encrypted_text = 'RQH YDULDWLRQ WR WKH VWDQGDUG FDHVDU FLSKHU LV ZKHQ WKH
DOSKDEHW LV "NHBHG" EB XVLQJ D ZRUG. LQ WKH WUDGLWLRQDO
YDULHWB, RQH FRXOG ZULWH WKH DOSKDEHW RQ WZR VWULSV DQG
MXVW PDWFK XS WKH VWULSV DIWHU VOLGLQJ WKH ERWWRP VWULS WR
WKH OHIW RU ULJKW. WR HQFRGH, BRX ZRXOG ILQG D OHWWHU LQ WKH
WRS URZ DQG VXEVWLWXWH LW IRU WKH OHWWHU LQ WKH ERWWRP URZ.
IRU D NHBHG YHUVLRQ, RQH ZRXOG QRW XVH D VWDQGDUG DOSKDEHW,
EXW ZRXOG ILUVW ZULWH D ZRUG (RPLWWLQJ GXSOLFDWHG OHWWHUV)
DQG WKHQ ZULWH WKH UHPDLQLQJ OHWWHUV RI WKH DOSKDEHW. IRU
WKH HADPSOH EHORZ, L XVHG D NHB RI "UXPNLQ.FRP" DQG BRX ZLOO VHH
WKDW WKH SHULRG LV UHPRYHG EHFDXVH LW LV QRW D OHWWHU. BRX
ZLOO DOVR QRWLFH WKH VHFRQG "P" LV QRW LQFOXGHG EHFDXVH
WKHUH ZDV DQ P DOUHDGB DQG BRX FDQ\'W KDYH GXSOLFDWHV.'
  key = 3
  puts "Decrypted: #{Caesar.caesar_decrypt(encrypted_text, key)}"
  puts

  # Decrypt
  encrypted_text = 'FEV MRIZRKZFE KF KYV JKREURIU TRVJRI TZGYVI ZJ NYVE KYV RCGYRSVK
ZJ "BVPVU" SP LJZEX R NFIU. ZE KYV KIRUZKZFERC MRIZVKP, FEV TFLCU
NIZKV KYV RCGYRSVK FE KNF JKIZGJ REU ALJK DRKTY LG KYV JKIZGJ
RWKVI JCZUZEX KYV SFKKFD JKIZG KF KYV CVWK FI IZXYK. KF VETFUV, PFL
NFLCU WZEU R CVKKVI ZE KYV KFG IFN REU JLSJKZKLKV ZK WFI KYV
CVKKVI ZE KYV SFKKFD IFN. WFI R BVPVU MVIJZFE, FEV NFLCU EFK LJV R
JKREURIU RCGYRSVK, SLK NFLCU WZIJK NIZKV R NFIU (FDZKKZEX
ULGCZTRKVU CVKKVIJ) REU KYVE NIZKV KYV IVDRZEZEX CVKKVIJ FW KYV
RCGYRSVK. WFI KYV VORDGCV SVCFN, Z LJVU R BVP FW "ILDBZE.TFD" REU
PFL NZCC JVV KYRK KYV GVIZFU ZJ IVDFMVU SVTRLJV ZK ZJ EFK R CVKKVI.
PFL NZCC RCJF EFKZTV KYV JVTFEU "D" ZJ EFK ZETCLUVU SVTRLJV KYVIV
NRJ RE D RCIVRUP REU PFL TRE\'K YRMV ULGCZTRKVJ.'
  key = 17
  puts "Decrypted: #{Caesar.caesar_decrypt(encrypted_text, key)}"

end

test
