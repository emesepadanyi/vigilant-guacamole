# frozen_string_literal: true

require 'celluloid'
require './secret_encryption.rb'
require './string_solver.rb'

cipher_txt = SecretEncryption.encrypt('hopefullyitworks')

StringSolver.new(cipher_txt)
