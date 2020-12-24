class InquirysController < ApplicationController

  def new
    @inquiry = Inquiry.new
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      render :confirm
    else
      render :new
    end
  end

  def done
    @inquiry = Inquiry.new(inquiry_params)
    #:backパラメータを受け取ったら入力画面に戻る
    if params[:back]
      render :new
    #メール送信
    else
      InquiryMailer.send_mail(@inquiry).deliver_now
      render :done
    end
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end

end
