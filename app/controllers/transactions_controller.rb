class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all

    render("transaction_templates/index.html.erb")
  end

  def show
    @transaction = Transaction.find(params.fetch("id_to_display"))

    render("transaction_templates/show.html.erb")
  end

  def new_form
    @transaction = Transaction.new

    render("transaction_templates/new_form.html.erb")
  end

  def create_row
    @transaction = Transaction.new

    @transaction.buyer_id = params.fetch("buyer_id")
    @transaction.seller_id = params.fetch("seller_id")
    @transaction.item_id = params.fetch("item_id")
    @transaction.sale_price = params.fetch("sale_price")
    @transaction.notes = params.fetch("notes")

    if @transaction.valid?
      @transaction.save

      redirect_back(:fallback_location => "/transactions", :notice => "Transaction created successfully.")
    else
      render("transaction_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @transaction = Transaction.find(params.fetch("prefill_with_id"))

    render("transaction_templates/edit_form.html.erb")
  end

  def update_row
    @transaction = Transaction.find(params.fetch("id_to_modify"))

    @transaction.buyer_id = params.fetch("buyer_id")
    @transaction.seller_id = params.fetch("seller_id")
    @transaction.item_id = params.fetch("item_id")
    @transaction.sale_price = params.fetch("sale_price")
    @transaction.notes = params.fetch("notes")

    if @transaction.valid?
      @transaction.save

      redirect_to("/transactions/#{@transaction.id}", :notice => "Transaction updated successfully.")
    else
      render("transaction_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @transaction = Transaction.find(params.fetch("id_to_remove"))

    @transaction.destroy

    redirect_to("/transactions", :notice => "Transaction deleted successfully.")
  end
end
