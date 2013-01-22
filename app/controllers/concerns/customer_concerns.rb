module CustomerConcerns
  
  def load_customer
    if params[:customer_id]
      id = params[:customer_id]
      @customer = Customer.find(id)
    end
  end
end