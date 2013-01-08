# encoding: UTF-8

module Ncommons
  module Security
    require 'openssl'
    class Des
      class << self
        #加密
        #参数
        # key 16进制密钥
        # plaintext 明文
        # alg 算法
        # padding 是否使用 padding
        def encrypt(key,plaintext,alg='des',padding=0)
          des_encrypt_decrypt(key,plaintext,'enc',alg,padding)
        end

        #解密
        #参数
        # key 16进制密钥
        # decrypt_data 密文
        # alg 算法
        # padding 是否使用 padding
        def decrypt(key,decrypt_data,alg='des',padding=0)
          des_encrypt_decrypt(key,decrypt_data,'dec',alg,padding)
        end

        private
        def des_encrypt_decrypt(key,data,act='enc',alg='des',padding=0)
          des = OpenSSL::Cipher::Cipher.new(alg)
          des.padding = padding
          OpenSSL.errors if OpenSSL.errors
          act== 'enc' ? des.encrypt : des.decrypt
          #des.iv = "iviviviviviv"
          des.key = key
          res = des.update(data)
          res << des.final
          return res
        end
      end
    end
  end
end


if $0 == __FILE__
  require 'rubygems'
  require 'ncommons'
  include Ncommons::Security
  # plain_text = "8371|4006b841-3181-4637-9753-839534975785|9667|123456ABC|9137"
  #   key = "121212121212121212121212"
  #   p en_str = Des.encrypt(key,plain_text,'des-ede3-ofb',1)
  #   p up = en_str.unpack('H*')
  #   p up.pack('H*')
  #   puts de_tr = Des.decrypt(key,en_str,'des-ede3-ofb',1)
  p "="*80
  p key = "19890604"#.to_hex
  plain_text = "打倒中国共产党"
  en_str = Des.encrypt(key,plain_text,'des',1)
  p "密文: "+en_str.to_hex
  #en_str = "892e3a25a20024e7".from_hex
  puts Des.decrypt(key,en_str,"des",1)
  p "-"*80
  p 'g6AtgJul6q0='.from_base64
end
