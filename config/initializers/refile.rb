require 'refile/s3'

#if !Rails.env.production? # 開発環境でS3へアップロードできているか確認する方法

if Rails.env.production? # 本番環境の場合
    aws = {
    access_key_id: ENV['AKIAZ2I7KVX2MLVIABWK'], # アクセスキーID
    secret_access_key: ENV['9uOKASi5AT5AYaVyZUpOaUgGh1eKt32d4APh0jn2'], # シークレットアクセスキー
    region: 'ap-northeast-1', # リージョン
    bucket: 'heroku-uoxvz',
    }
    Refile.cache = Refile::S3.new(prefix: 'cache', **aws)
    Refile.store = Refile::S3.new(prefix: 'store', **aws)
end
