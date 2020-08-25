class UserMailer < ApplicationMailer

  def order_receipt(input)
    @user = input[:user]
    @order = input[:order]
    mail(to: @user.email, subject: "Order ID: #{@order.id}")
  end

end
