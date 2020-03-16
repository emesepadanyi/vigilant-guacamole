# frozen_string_literal: true

require 'base64'

class SecretEncryption
  # shift
  def self.encrypt(str)
    throw 'bad input!' if str.length != 16

    ciphertxt = str.unpack('U*')
    ciphertxt.map { |a| a + 15 }.pack('U*')
  end
end
