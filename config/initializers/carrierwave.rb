require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
    if Rails.env.production? # 本番環境の場合はS3へアップロード
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'carrierwave-heroku' # バケット名
    # config.fog_public = false
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
        aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
        # credentials下にaws_access_key_idとaws_secret_access_keyはあるよ
        region: 'ap-northeast-1'
    }
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/carrierwave-heroku'
    else # 本番環境以外の場合はアプリケーション内にアップロード
    config.storage :file
    config.enable_processing = false if Rails.env.test?
    end
end