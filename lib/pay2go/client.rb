require 'digest'
require 'net/http'

module Pay2go
  class Client

    attr_reader :secret

    def initialize amt, options = {}
      @amt = amt
      @item_desc = options[:item_desc] || ""
      @email = options[:email] || ""
      @mode = options[:mode] || "test"
      @secret = PAY2GO_CONFIG[@mode]
    end

    def api_host
      secret["host"]
    end

    def request path="", params = {}
      api_url = URI.join(api_host, path)
      Net::HTTP.post_form api_url, payment_params
    end

    def response
      res = request
      return res.body
    end

    private

    def payment_params
      return {
        MerchantID: secret["MerchantID"].to_s,
        RespondType: "JSON",
        CheckValue: check_value.to_s,
        TimeStamp: Time.now.to_i.to_s,
        Version: secret["Version"].to_s,
        MerchantOrderNo: Time.now.to_i.to_s,
        Amt: @amt,
        ItemDesc: @item_desc,
        Email: @email,
        LoginType: 0,
        #LangType: "zh-tw",
        #TradeLimit: 60,
        #ReturnURL: "",
        #NotifyURL: "",
        #CustomerURL: "",
        #ClientBackURL: "",
        #OrderComment: secret["OrderComment"],
        #CREDIT: 1,
        #VACC: 1,
        #CVS: 1
        WEBATM: 1
      }
    end

    def check_value
      return Digest::SHA256.hexdigest(secret_str).upcase
    end

    def secret_str
      return "HashKey=#{secret["HashKey"]}&Amt=#{@amt}&MerchantID=#{secret["MerchantID"]}&MerchantOrderNo=#{Time.now.to_i}&TimeStamp=#{Time.now.to_i}&Version=#{secret["Version"]}&HashIV=#{secret["HashIV"]}"
    end

  end
end
