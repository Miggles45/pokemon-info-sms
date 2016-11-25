# Pokemon SMS Info

## Setup

```
git clone git@github.com:Miggles45/pokemon-info-sms.git
cd pokemon-info-sms
bundle install
API_KEY=XXXX API_SECRET=XXXX bundle exec puma
```

This will start a server on port 9292. This exposes a `/receive` endpoint which can be used by Nexmo. For example:

```
curl http://localhost:9292/receive?msisdn=YOUR_PHONE_NUMBER&to=447520635487&messageId=0B000000213A6305&text=Raichu%3F&type=text&keyword=RAICHU&message-timestamp=2016-11-25+19%3A23%3A39
```
