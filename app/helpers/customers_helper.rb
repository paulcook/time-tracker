module CustomersHelper
  def only_us_and_canada
    Carmen::Country.all.select{|c| %w{US CA}.include?(c.code)}
  end
  
  def us_subregions
    us = Carmen::Country.coded('US')
    us.subregions.collect { |state| [state.name,state.code] }
  end
end
