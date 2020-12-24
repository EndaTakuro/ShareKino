class InquiryMailer < ApplicationMailer
  default to: ENV["EMAIL_HIDDEN"]

  def send_mail(inquiry)
    @inquiry = inquiry
    mail(subject:'shareKinoよりお問い合わせ通知') do |format|
      format.text
    end
  end

end