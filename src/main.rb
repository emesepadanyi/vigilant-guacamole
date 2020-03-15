# frozen_string_literal: true

require 'celluloid'
require './secret_encryption.rb'
require './character_solver.rb'

cipher_txt = SecretEncryption.encrypt('hopefullyitworks')

cs = CharacterSolver.new

(0..15).to_a.map do |i|
  cs.async.decrypt(cipher_txt, i)
end

sleep 10
