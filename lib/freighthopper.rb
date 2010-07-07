%w{
  activerecord array float/to_s hash/map_keys string
  antonym_accessor array define_and_alias eval_with_options
  is_one_of lazy_alias or_if_blank soft_send stdout_extensions
  fixnum
}.each {|lib| require "freighthopper/#{lib}"}

