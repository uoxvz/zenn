require "refile/s3"

aws = {
    access_key_id: "AKIAZ2I7KVX2O7K3V3XQ",
    secret_access_key: "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",
    region: "ap-northeast-1",
    bucket: "heroku-rails-refile-2023",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
