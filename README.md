# Ayrshare Flutter

Integrate Social Media APIs Into Your Platform

Powerful Social Media APIs that enable you to send social media posts effortlessly. For developers and businesses of all sizes.

Supports Facebook, Twitter, Instagram, LinkedIn, Reddit, Telegram, TikTok, Google Business Profile (formerly Google My Business), Pinterest, and YouTube.

No need for your own developer accounts at any social media networks.


<div style="width: 600px;">
    <img src="https://www.ayrshare.com/wp-content/uploads/2020/12/biz-logo-3SVVS.png" width="30%" height="50%">
</div>

## Features

> #### See the Ayrshare docs for the full details and parameters for each endpoint.
>
> - The examples we list only show the basic usage.
> - Each endpoint has more advanced capabilities that you can send in the body of the request for more advanced capabilities
>

1. Post to 10 social network. Send posts real time or schedule for a future date and time.
2. Get analytics on shortened links, post data like shares, likes, shares, and impressions, and account data like followers, and subscribers.
4. Get a history of all posts and their current status in descending order.
5. Upload and store images and videos. Returns a URL referencing the image. Great for those who do not have their own media hosting service.
6. Get and send comments on a post.
7. Shorten a URL and return the shortened URL. Track clicks.
8. Add a new RSS or Substack feed to auto post all new articles.
9. Create and manage multiple users with the Business Plan. Post to their social account.
10. Webhooks allows you to be notified when certain system actions occur via a call to a URL you provide.


## Get Started

1. Get started with a [free plan or paid plan](https://www.ayrshare.com/pricing), or if you have a platform or manage multiple users check out the [Business Plan](https://www.ayrshare.com/business-plan-for-multiple-users/).
2. Log in to your Ayrshare account, link some social networks, get your API key, and start posting.

## Usage Example of Posting
This sample app creates a button which calls the post function. It posts a random quote and a random image to the linked Twitter and Facebook accounts. It prints the response which includes the URLs for the live posts on the social networks.
<br>

```dart

import 'package:flutter/material.dart';
import 'ayrshare_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostingPage(),
    );
  }
}

class PostingPage extends StatelessWidget {
  ///TODO get your API key by signing up at ayrshare.com
  final apiKey = '###-###-###-###'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: null,
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await post(
                apiKey: apiKey,
                body: {
                  'randomPost': true,
                  'platforms': ['twitter', 'facebook'],
                  'randomMediaUrl': true
                },
              ).then((value) => print(value));
            },
            child: const Text('Post To Social'),
          ),
        ));
  }
}

```


## Additional information
<br>
<em>One minute intro YouTube video:</em>
<br>
<a href="https://www.youtube.com/watch?v=G8M6DZdtcMc"><img src="https://www.ayrshare.com/wp-content/uploads/thumb-yt-intro.png" alt="HTML tutorial" style="width:420px;"></a>
<br>  
<br>  


Ayrshare is the Social Media API company. Thousands of businesses have sent millions of social posts via Ayrshare. The world’s largest enterprises and the most ambitious startups use Ayrshare to manage all their users’ social accounts, grow their revenue, and accelerate new business opportunities. Learn more at [ayrshare.com](https://www.ayrshare.com/).

For support, please contact <support@ayrshare.com>