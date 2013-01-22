module ApplicationHelper
  def handle_notices(ignore=nil)
    flsh = ''
    flash.each do |key,msg|
      flsh << '<div class="alert notice alert-block alert-'+key.to_s+'"><a class="close" data-dismiss="alert" href="#">&times;</a>'+simple_format(msg)+'</div>' unless ignore and ignore.include?(key)
    end
    flsh << '<div class="alert notice" style="display:none;"><a class="close" data-dismiss="alert" href="#">&times;</a></div>'
    flsh.html_safe
  end
end
