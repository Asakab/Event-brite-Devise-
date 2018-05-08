class ChargesController < ApplicationController

	def new

      @event = Event.new(description: params['description'], date: params['date'], place: params['place'], price: params['price'])
      @amount = @event.price
      @event.save

    end
    

def create
  # Amount in cents
 
  @amount = @event.price

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @event.price,
    :description => 'Paiement de N',
    :currency    => 'eur'
  )

  redirect_to event_create_path

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end

end
