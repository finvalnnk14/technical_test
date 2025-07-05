import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Map<String, dynamic>> articles = [
    {
      "source": "MacRumors",
      "date": "02 Jul 2025",
      "title": "iOS 26: New Lock Screen Features",
      "description":
          "When you’re not using your iPhone, the Lock Screen is what you see most often. Liquid Glass is everywhere in iOS 26, and it starts...",
      "author": "Juli Clover",
      "image": "images/image 2.png",
    },
    {
      "source": "Android Central",
      "date": "02 Jul 2025",
      "title": "Google Pixel 10 vs. Pixel 9: Plenty of reasons to get excited",
      "description":
          "The Google Pixel 10 is expected to enter the fold this summer, but what upgrades will it bring over the current Pixel 9? Let’s find out...",
      "author": "Brady Sander",
      "authorEmail": "bradysnyder@gmail.com",
      "image": "images/image 3.png",
    },
    {
      "source": "BBC News",
      "date": "02 Jul 2025",
      "title":
          "Kanye West blocked from entering Australia over Hitler song",
      "description":
          "Kanye West has long sparked controversy over his anti-Semitic remarks and has declared himself a Nazi.",
      "author": "-",
      "image": "images/image 4.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Breaking News',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Icon(Icons.search),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return GestureDetector(
                  onTap: () {
                    if (article['title'].contains('Google Pixel')) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailNewsPage(article: article),
                        ),
                      );
                    }
                  },
                  child: Card(
                    margin: EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12)),
                          child: Image.asset(
                            article['image'],
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${article['source']} | ${article['date']}",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                article['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                article['description'],
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundImage: AssetImage(
                                        'images/default_avatar.png'),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      article['author'],
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (article['title']
                                          .contains('Google Pixel')) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailNewsPage(
                                                    article: article),
                                          ),
                                        );
                                      }
                                    },
                                    child: Text('Read More...'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
         
        },
      ),
    );
  }
}

class DetailNewsPage extends StatelessWidget {
  final Map<String, dynamic> article;

  DetailNewsPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail News'),
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${article['source']} | ${article['date']}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  article['title'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  article['description'],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage:
                          AssetImage('images/default_avatar.png'),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article['author'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        if (article['authorEmail'] != null)
                          Text(
                            article['authorEmail'],
                            style: TextStyle(fontSize: 12),
                          ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    article['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "The Google Pixel 9 is one of the best smartphones of 2025, and its successor, the Google Pixel 10, probably isn’t far off from being officially announced. Currently, rumors and leaks point to the Pixel 10 keeping a few things from the Pixel 9 while adding major upgrades. If you're in the market for a new Android phone, you might be wondering how the upcoming Pixel 10 is expected to compare to the current model.\n\nBased on Google's new release schedule for Pixels, we'll likely see the Pixel 10 sometime in August 2025. That's about a month away, and leaks are intensifying as possible launch dates get closer. Here's everything we know so far about how the Pixel 10 will improve upon the successful Pixel 9.",
                  style: TextStyle(fontSize: 14, height: 1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
