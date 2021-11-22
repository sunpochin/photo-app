* Issues of not seeing payment in stripe dashboard:
  * https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/learn/lecture/3853696#questions/11847720
  * https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/learn/lecture/3853696#questions/10981814
  * https://stripe.com/docs/saving-cards

  * My code using a test visa card code: 4242424242424242
  ```
    def process_payment
      customer = Stripe::Customer.create({
        # source: 'tok_mastercard',
        source: 'tok_visa',
        email: email,
      })

      Stripe::Charge.create customer: customer.id,
                            amount: 1000,
                            description: 'Premium',
                            currency: 'usd'
    end

  ```