# All the libraries required by Tratto API
require 'csv'

require_relative 'tratto/data_access/data_access'
require_relative 'tratto/data_access/quote_data_access'
require_relative 'tratto/data_access/wallet_data_access'

require_relative 'tratto/models/quote'
require_relative 'tratto/models/wallet'

require_relative 'tratto/data_files/data_file'
require_relative 'tratto/data_files/quote_data_file'
require_relative 'tratto/data_files/wallet_data_file'
