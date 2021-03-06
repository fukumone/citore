class Bots::FacebookController < BaseController
  protect_from_forgery
  before_action :check_verify

  def sugarcoat
    case request.method_symbol
    when :post
      message = params["entry"][0]["messaging"][0]
      if message.include?("message")
        #ユーザーの発言
        sender = message["sender"]["id"]
        text = message["message"]["text"]

        endpoint_uri = "https://graph.facebook.com/v2.6/me/messages?access_token=" + ENV.fetch('FACEBOOK_SUGARCOAT_BOT_ACCESS_TOKEN', '')
        #sugarcoated = Sugarcoat::Seed.to_sugarcoat(text).join("")
        #voice = VoiceWord.generate_and_upload_voice(nil, TextAnalyzer.reading(sugarcoated), "aoi", VoiceWord::VOICE_S3_SUGARCOAT_FILE_ROOT, "public-read", VoiceWord::SUGARCOAT_VOICE_PARAMS)
        request_content = {
          recipient: {
            id:sender
          },
          message: {
            text: text
          }
        }

        http_client = HTTPClient.new
        res = http_client.post(endpoint_uri, request_content.to_json, {'Content-Type' => 'application/json; charset=UTF-8'})
        logger.info res.body
        #http_client = http_client = HTTPClient.new
        #res = http_client.post(endpoint_uri, request_voice_content.to_json, {'Content-Type' => 'application/json; charset=UTF-8'})
        #logger.info res.body
        head(:ok)
      else
        #botの発言
        head(:ok)
      end
    end
  end

  def citore
    head(:ok)
  end

  def spotgacha
    head(:ok)
  end

  def job_with_life
    head(:ok)
  end

  def shiritori
    head(:ok)
  end

  def mone
    head(:ok)
  end

  private
  def check_verify
    case request.method_symbol
    when :get
      if params["hub.verify_token"] == "taptappun"
        render json: params["hub.challenge"]
      else
        render json: "Error, wrong validation token"
      end
    end
  end
end