module IssuesHelper
  SELECTOR = ['Bug', 'Feature']
  TYPES = ['New', 'Started', 'Resolved']
  
  def select_options
    TYPES.map{|type| [type, type]}
  end
  def selector
    SELECTOR.map{|selector| [selector, selector]}
  end
end
