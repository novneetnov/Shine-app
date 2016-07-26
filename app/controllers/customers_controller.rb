class CustomersController < ApplicationController
  def index
		if params[:keywords].present?
			customer_search_term = CustomSearchTerm.new(params[:keywords])
			@customers = Customer.where(customer_search_term.where_clause, customer_search_term.where_args).order(customer_search_term.order)
		else
			@customers = []
		end	
  end
end
