# -*- encoding : utf-8 -*-
require 'ncommons/version'
#require 'action_pack'
#require 'active_record'
%w(
  actionpack/lib/base.rb
  activerecord/lib/active_record/base.rb
  base/string.rb
  base/file.rb
  base/numeric.rb
  base/base62.rb
  security/util.rb
  security/large_data_rsa.rb
  security/md5.rb
  security/ansix99.rb
  security/des.rb
  ).each{|file|
    require File.join(File.dirname(__FILE__),file)
}
module Ncommons
end

