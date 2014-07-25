require 'active_record'
class ActiveRecord::Base

  #新建或更新已有记录
  #用法 Model.create_or_update(model_obj,{:attributes => xxx})
  #例:
  #User.create_or_update(user,name:'aaaa',age:10)
  def self.create_or_update(relation, attrs_to_update)
    if (incumbent = relation.first).nil?
      relation.create!(attrs_to_update)
    else
      incumbent.update_attributes(attrs_to_update)
      incumbent
    end
  end

end
