# frozen_string_literal: true

require './secret_encryption.rb'

p SecretEncryption.encrypt('b' * 16)
