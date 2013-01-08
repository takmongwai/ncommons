# -*- encoding : utf-8 -*-
#数字类
class Numeric
  
  #转换为特定精度的小数,默认2位
  def to_nf(accuracy = 2)
    return 0.0 unless self
    sprintf("%.0#{accuracy}f",self.to_f)
  end
  
  
  #分到元
  def fen_to_yuan
    return 0 unless self
    (self.to_i * 0.01).to_nf(2)
  end
  
  #元到分
  
  def yuan_to_fen
    return 0 unless self
    (self.to_f * 100).to_i
  end
  
  
end
