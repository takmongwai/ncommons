# encoding: UTF-8
=begin rdoc
Hash 工具类,

=end

class Hash
  #方法: Hash#sym_keys 将所有 hash的key转换成 sym 的样式
  #如原key是是一个数字开头的,则不做转换
  # h = {
  #   "a" => 100,
  #   "b" => 20,
  #   "c" => 10,
  #   "h" => {
  #     "a1" => "a0",
  #     "ab" => "a1",
  #     :h1 => {
  #       "a2" => 1000,
  #       "b3" => 500
  #     },
  #     "h2" => {
  #       "1" => 500,
  #       "8" => 90,
  #       '1.0' => 80
  #     }
  #   }
  # }
  #
  # puts h.sym_keys
  # {
  #   :a=>100,
  #   :b=>20,
  #   :c=>10,
  #   :h=>{
  #     :a1=>"a0",
  #     :ab=>"a1",
  #     :h1=>{
  #       :a2=>1000,
  #       :b3=>500
  #     },
  #     :h2=>{
  #       "1"=>500,
  #       "8"=>90,
  #       "1.0"=>80
  #     }
  #   }
  # }
  def sym_keys
    hrs = {}
    self.each{|k,v|
      hrs[
        k.match(/^\d/) ? k.to_s : k.to_sym
      ] = v.is_a?(Hash) ? v.sym_keys : v
    }
    hrs
  end
end
