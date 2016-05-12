class TaxesController < ApplicationController
  def new
    @tax = Tax.new
  end

  def create
    @tax = Tax.create(tax_params)
      if @tax.save
        redirect_to @tax
      end
  end

  def show
    @tax = Tax.find(params[:id])
  end

  def edit
    @tax = Tax.find(params[:id])
  end

  def update
    @tax = Tax.find(params[:id])
    respond_to do |format|
      if @tax.update(tax_params)
        format.html {redirect_to @tax, notice: "Tax info has been updated"}
      else
        format.html {render :edit}
      end
    end
  end

  private
  def tax_params
    params.require(:tax).permit(:paid_through, :amount)
  end
end
