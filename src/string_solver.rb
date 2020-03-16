# frozen_string_literal: true

require './character_solver.rb'

class StringSolver
  def initialize(cipher_txt)
    cs = CharacterSolver.new

    plain_future = (0..15).to_a.map { |i| cs.future.decrypt(cipher_txt, i) }

    plain_txt = plain_future.map(&:value)
    p plain_txt.join ''
  end
end
