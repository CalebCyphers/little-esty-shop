class Admin::InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:invoice_id])
    @inv_items = @invoice.items
  end

  def update
    @invoice = Invoice.find(params[:invoice_id])
    @invoice.update(status: params[:status])

    redirect_to "/merchants/#{params[:merchant_id]}/invoices/#{params[:invoice_id]}"
  end
private
  def invoice_params
    params.permit(:status)
  end

end
