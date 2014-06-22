user-stream-search-boxcar
=========================
```sh
git clone https://github.com/uemue/user-stream-search-boxcar.git
heroku create YOUR_APP_NAME
heroku config:add consumer_key=YOUR_CONSUMER_KEY
heroku config:add consumer_secret=YOUR_CONSUMER_SECRET
heroku config:add access_token=YOUR_ACCESS_TOKEN
heroku config:add access_token_secret=YOUR_ACCESS_TOKEN_SECRET
heroku config:add boxcar_access_token=YOUR_BOXCAR2_ACCESS_TOKEN
heroku config:add query=QUERY
git push heroku master
heroku scale worker=1
```
