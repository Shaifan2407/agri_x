import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  final String apiKey;
  final String baseUrl = 'https://newsapi.org/v2';

  NewsService({required this.apiKey});

  Future<List<NewsArticle>> getPlantingNews() async {
    final response = await http.get(
      Uri.parse('$baseUrl/everything?q=planting&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['status'] == 'ok') {
        final List<dynamic> articles = data['articles'];
        return articles
            .map((article) => NewsArticle.fromJson(article))
            .toList();
      } else {
        throw Exception('Failed to load news');
      }
    } else {
      throw Exception('Failed to load news');
    }
  }
}

class NewsArticle {
  final String title;
  final String description;
  final String url;

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
