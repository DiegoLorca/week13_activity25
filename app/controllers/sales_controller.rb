class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    desc_sale
    #@sale = Sale.create(desc_sale)
    @sale.save
    redirect_to sales_done_path
  end

  def done
    @sale = Sale.last
  end

  private
  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total)
  end

  def desc_sale
    @discount = (sale_params[:value].to_i * sale_params[:discount].to_i) / 100
    sale_params[:total] = sale_params[:value].to_i - @discount
    if sale_params[:tax] == false
      sale_params[:total].to_f *= 1.19
      sale_params[:tax] = 19
    elsif
      sale_params[:tax] = 0
    end
    @sale.save
  end
end
