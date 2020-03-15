# frozen_string_literal: true

require 'celluloid'
require './secret_encryption.rb'

class CharacterSolver
  include Celluloid

  def initialize
    @printable_chars = ('a'..'z').to_a
  end

  def decrypt(cipher_txt, id)
    guess = 'a' * 16
    status = xor(cipher_txt, SecretEncryption.encrypt(guess))

    @printable_chars.each do |char|
      guess[id] = char

      next unless status < xor(cipher_txt, SecretEncryption.encrypt(guess))

      sleep rand(3..7)
      p 'solved char at ' + id.to_s + ': ' + char
      return char
    end
  end

  private

  def xor(str1, str2)
    throw 'bad input' if str1.length != str2.length

    a = str1.unpack('U*')
    b = str2.unpack('U*')

    a.zip(b).map { |ac, bc| ac ^ bc }.count(0)
  end
end
