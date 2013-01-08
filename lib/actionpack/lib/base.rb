# encoding: UTF-8
module ActionController
  class Base
    #检查http参数是否存在或为空
    #参数: http params
    #返回: yield 错误信息或 String(单一参数),Array(多个参数)
    #例子:
    #单一参数:
    # str_name = check_params(:name){|msg|
    #  return response_with xxx
    #}
    #多个参数:
    #单一参数:
    # str_name,str_year = check_params(:name,:year){|msg|
    #  return response_with xxx
    #}
    
    def check_params(*args)
      rs = args.map do |arg|
        if !params[arg.to_sym] || params[arg.to_sym].empty?
          if block_given?
            yield arg.to_sym
          else
            raise ArgumentError.new("missing params[:#{arg.to_sym}]")
          end
        end
        params[arg.to_sym]
      end
      return rs.join if rs.size == 1
      rs
    end
  end #class Base

end #module ActionController
