Spree::OrderShipping.class_eval do

    private
    def send_shipment_emails(carton)
      carton.orders.each do |order|
        #ShipmentMailer.shipped_email(id).deliver_later
        order=@shipment.order
        external_key = Spree::BrontoConfiguration.account[order.store.code]["order_shipped"]

        DelayedSend.new( order.store.code,
                        order.email,
                        external_key,
                        order.id.to_s,
                        "order_mailer/order_shipped_plain",
                        "order_mailer/order_shipped_html").perform
      end
    end
end
