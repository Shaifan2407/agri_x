import 'package:agri_x/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NewsScreen> {
  late List<Article> articles = []; // Initialize with an empty list

  @override
  void initState() {
    super.initState();
    fetchAgricultureNews();
  }

  Future<void> fetchAgricultureNews() async {
    final apiKey =
        '0d7b62f40850459d89a33e870f2dd6d3'; // Replace with your News API key
    final response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/everything?q=agriculture OR farming OR crop&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> articlesData = data['articles'];

      setState(() {
        articles =
            articlesData.map((article) => Article.fromJson(article)).toList();
      });
    } else {
      throw Exception('Failed to load agriculture news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.to(() => const NavigationMenu());
            },
            icon: const Icon(LineAwesomeIcons.angle_left),
          ),
          centerTitle: true,
          title:
              Text("Agri News", style: Theme.of(context).textTheme.headline4),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(LineAwesomeIcons.moon))
          ],
        ),
        body: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return NewsCard(article: articles[index]);
          },
        ),
      ),
    );
  }
}

class Article {
  final String title;
  final String description;

  Article({required this.title, required this.description});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

class NewsCard extends StatelessWidget {
  final Article article;

  NewsCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            // You can use article.imageURL here if available
            'https://via.placeholder.com/150', // Placeholder image URL
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article.description,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
