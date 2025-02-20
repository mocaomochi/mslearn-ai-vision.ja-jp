#!/bin/bash

account_id="YOUR_ACCOUNT_ID"
api_key="YOUR_API_KEY"
location="trial"

# Call the AccessToken method with the API key in the header to get an access token
token=$(curl -s -X GET "https://api.videoindexer.ai/auth/$location/Accounts/$account_id/AccessToken?allowEdit=true" -H "Ocp-Apim-Subscription-Key: $api_key" | tr -d '"')

# Use the access token to make an authenticated call to the Videos method to get a list of videos in the account
curl -s -X GET "https://api.videoindexer.ai/$location/Accounts/$account_id/Videos?accessToken=$token"

# 出力結果を綺麗に整形したい場合は jq コマンドを利用します。
# jq コマンドを利用するには事前にjqコマンドをインストールする必要があります。
# jq コマンドのインストール方法は以下の通りです。
# brew install jq
#
# brew がインストールされていない場合は先に以下のコマンドを実行してください。
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#
# jq コマンドを利用する場合は以下のコマンドを実行してください。
# curl -s -X GET "https://api.videoindexer.ai/$location/Accounts/$account_id/Videos?accessToken=$token" ! jq .

