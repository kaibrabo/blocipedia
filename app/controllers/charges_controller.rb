class ChargesController < ApplicationController
    def new
    end

    def create
        # Amount in cents
        @amount = 1500

        customer = Stripe::Customer.create(
            :email => params[:stripeEmail],
            :source  => params[:stripeToken]
        )

        charge = Stripe::Charge.create(
            :customer    => customer.id,
            :amount      => @amount,
            :description => 'Blocipedia customer',
            :currency    => 'usd'
        )

        current_user.to_premium

        flash[:notice] = "Thanks for going Premium, $15.00 was charged to your account."

        redirect_to edit_user_registration_path

    rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
    end


end
