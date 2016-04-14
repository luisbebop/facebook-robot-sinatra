facebook-robot-sinatra
=========

![alt text](https://d30y9cdsu7xlg0.cloudfront.net/png/178985-200.png "Logo")

## Description

A simple Facebook robot that integrates with <https://api.ai>. It's based on the official Facebook Messenger API.
You can use this as a template to create more complex Facebook robots using Ruby, Sinatra and Heroku.

## Deployment
You can deploy this project on Heroku using the button bellow.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

After deployment, define and configure a Verify Token on Heroku. You will be using this token in the next step of the installation process, when configuring the Webhook on your Facebook App.

```shell
heroku config:set VERIFY_TOKEN=3141516
```

## Install
 - Create a Facebook App and Facebook Page <https://developers.facebook.com/docs/messenger-platform/quickstart>
 - Setup the Webhook on your Facebook App using the `VERIFY_TOKEN` you have previously defined and the url of your deployed Heroku app + `/page_webhook`
 - Get Page Access Token following the Facebook documentation
 - Subscribe the App to the Page following the Facebook documentation
 - Configure your `PAGE_ACCESS_TOKEN` on Heroku
 - Configure your credentials from <https://api.ai>

```shell
heroku config:set PAGE_ACCESS_TOKEN=ABC123
heroku config:set APIAI_ACCESS_TOKEN=xpto
heroku config:set APIAI_SUBSCRIPTION_KEY=xpto
```

  - Don't forget to configure your Facebook Page messenger to send updates to your app

```shell
curl -ik -X POST "https://graph.facebook.com/v2.6/me/subscribed_apps?access_token=<token>"
```

## Test
You should have by now a functional robot in your Facebook page echoing back your messages. Just open the Facebook page and send a message to your robot.

## License

```
The MIT License (MIT)
Copyright (c) 2016 Luis Silva

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

The logo is courtesy of
[Julian Roman](https://thenounproject.com/romanchov/) via TheNounProject and
licensed via Creative Commons Attribution v3.
