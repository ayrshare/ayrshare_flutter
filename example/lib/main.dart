import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ayrshare_flutter/ayrshare_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///TODO Enter the applicable data. The apiKey is for Premium accounts or individual user profiles on the Business account. The apiKeyPrimary and privateKey is for Business accounts.
  final apiKey = '###-###-###-###';
  final apiKeyPrimary = '###-###-###-###';
  final privateKey =
      "-----BEGIN RSA PRIVATE KEY-----##########-----END RSA PRIVATE KEY-----\n";


  final ImagePicker _picker = ImagePicker();

  Future getMediaFromGallery({required String mediaType}) async {
    XFile? image;
    if (mediaType == 'image') {
      image = await _picker.pickImage(source: ImageSource.gallery);
    } else {
      image = await _picker.pickVideo(source: ImageSource.gallery);
    }
    print(image?.path);
    return image;
  }

  Future imageUploadToAyrshare({required fileBody}) async {
    final base64Image = io.File(fileBody.path).readAsBytesSync();
    String img64 = base64Encode(base64Image);
    var bodyPost = {
      'file': 'data:image/jpeg;base64,$img64',
      // 'fileName': 'test image',
      // 'description': 'best image'
    };
    await mediaUpload(
      apiKey: apiKey,
      content_type: 'application/json',
      body: bodyPost,
    ).then((value) => log(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Ayrshare',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 8.0,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await post(
                              apiKey: apiKey,
                              body: {
                                'randomPost': true,
                                'platforms': ['twitter', 'facebook'],
                                'randomMediaUrl': true
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                          ),
                          child: const Text('Post API Call'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await delete(
                              apiKey: apiKey,
                              body: {
                                'id': '############',
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Delete API Call'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await history(
                              apiKey: apiKey,
                              body: {
                                'lastDays': '10',
                                'lastRecords': '1',
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                          ),
                          child: const Text('History API Call'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await historyId(
                              apiKey: apiKey,
                              id: '############',
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[300],
                          ),
                          child: const Text('History ID'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await historyPlatform(
                              apiKey: apiKey,
                              platform: 'twitter',
                              body: {'limit': '20'},
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[800],
                          ),
                          child: const Text('History Platform'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await getMediaFromGallery(mediaType: 'image').then(
                                  (value) {
                                // log(value.path);
                                imageUploadToAyrshare(fileBody: value);
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[800],
                          ),
                          child: const Text('Upload image'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            mediaUploadUrl(
                              apiKey: apiKey,
                              body: {'fileName': 'filename.jpg'},
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[800],
                          ),
                          child: const Text('Get large upload URL'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            media(
                              apiKey: apiKey,
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          child: const Text('Get all media'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            user(
                              apiKey: apiKey,
                              body: {},
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text('Get user profile'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await analyticsPost(
                              apiKey: apiKey,
                              body: {
                                'id': '############',
                                'platforms': ['twitter', 'facebook']
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text('Make Analytics API Call'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await analyticsLinks(
                              apiKey: apiKey,
                              body: {'lastDays': '10'},
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                          ),
                          child: const Text('Analytics Links'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await analyticsSocial(
                              apiKey: apiKey,
                              body: {
                                'platforms': ['twitter', 'facebook']
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[800],
                          ),
                          child: const Text('Analytics Social'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await postComment(
                              apiKey: apiKey,
                              body: {
                                'platforms': ['twitter', 'facebook'],
                                'id': '############',
                                'comment': 'Can\'t agree more',
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purpleAccent,
                          ),
                          child: const Text('Post Comment'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await getComments(
                              apiKey: apiKey,
                              body: {
                                'id': '############',
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                          ),
                          child: const Text('Get Comments'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await setAutoSchedule(
                              apiKey: apiKey,
                              body: {
                                'schedule': ['13:05Z', '20:14Z'],
                                'title': 'Instagram Schedules',
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800],
                          ),
                          child: const Text('Set Auto Schedule'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await deleteAutoSchedule(
                              apiKey: apiKey,
                              body: {
                                'title': 'Instagram Schedule',
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[700],
                          ),
                          child: const Text('Delete Auto Schedule'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await listAutoSchedule(
                              apiKey: apiKey,
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[700],
                          ),
                          child: const Text('List Auto Schedules'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await addFeed(
                              apiKey: apiKey,
                              body: {
                                'url': 'https://www.ayrshare.com/feed/',
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text('Add Feed'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await getFeeds(
                              apiKey: apiKey,
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[700],
                          ),
                          child: const Text('Get Feeds'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await deleteFeed(
                              apiKey: apiKey,
                              body: {
                                'id': '############',
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[600],
                          ),
                          child: const Text('Delete Feed'),
                        ),
                        const Divider(
                          height: 20,
                          thickness: 2,
                          indent: 20,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 40,
                          child: const Text(
                            'Ayrshare Business Plan Only',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await createProfile(
                              apiKey: apiKeyPrimary,
                              body: {
                                'title': 'ACME Profile A',
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                          ),
                          child: const Text('Create Profile'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await deleteProfile(
                              apiKey: apiKeyPrimary,
                              body: {
                                'profileKey': '#####-#####-#####-#####',
                                'title': 'ACME Profile A',
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[400],
                          ),
                          child: const Text('Delete Profile'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await updateProfile(
                              apiKey: apiKeyPrimary,
                              body: {
                                'profileKey': '#####-#####-#####-#####',
                                'title': 'ACME Profile BB',
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[600],
                          ),
                          child: const Text('Update Profile'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await getProfiles(
                              apiKey: apiKeyPrimary,
                              body: {},
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[400],
                          ),
                          child: const Text('Get Profiles'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await unlinkSocial(
                              apiKey: apiKeyPrimary,
                              body: {
                                'platform': 'twitter',
                                'profileKey': apiKey,
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[200],
                          ),
                          child: const Text('Unlink Platform'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await generateJWT(
                              apiKey: apiKeyPrimary,
                              body: {
                                'domain': '############',
                                'privateKey': privateKey,
                                'profileKey': apiKey,
                                'logout': true,
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text('Generate JWT & URL'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await registerWebhook(
                              apiKey: apiKeyPrimary,
                              body: {
                                'action': 'social',
                                'url': 'https://www.ayrshare.com/webhook',
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          child: const Text('Register Webhook'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await unregisterWebhook(
                              apiKey: apiKeyPrimary,
                              body: {
                                'action': 'social',
                              },
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[800],
                          ),
                          child: const Text('Unregister Webhook'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await getWebhooks(
                              apiKey: apiKeyPrimary,
                            ).then((value) => log(value));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[300],
                          ),
                          child: const Text('List Webhooks'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
