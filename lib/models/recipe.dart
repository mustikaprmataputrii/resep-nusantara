/// Recipe data shared by the UI and future API repositories.
///
/// Presentation-only styling stays outside this model so API payloads remain
/// independent from Flutter widgets and colors.
class Recipe {
  const Recipe({
    required this.id,
    required this.name,
    required this.region,
    required this.category,
    required this.duration,
    required this.difficulty,
    required this.rating,
    required this.emoji,
    required this.description,
    required this.ingredients,
    required this.steps,
  });

  final String id;
  final String name;
  final String region;
  final String category;
  final String duration;
  final String difficulty;
  final double rating;
  final String emoji;
  final String description;
  final List<String> ingredients;
  final List<String> steps;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    id: json['id'] as String,
    name: json['name'] as String,
    region: json['region'] as String? ?? '',
    category: json['category'] as String? ?? 'Lainnya',
    duration: json['duration'] as String? ?? '',
    difficulty: json['difficulty'] as String? ?? 'Mudah',
    rating: (json['rating'] as num?)?.toDouble() ?? 0,
    emoji: json['emoji'] as String? ?? '🍽️',
    description: json['description'] as String? ?? '',
    ingredients: List<String>.from(json['ingredients'] as List? ?? const []),
    steps: List<String>.from(json['steps'] as List? ?? const []),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'region': region,
    'category': category,
    'duration': duration,
    'difficulty': difficulty,
    'rating': rating,
    'emoji': emoji,
    'description': description,
    'ingredients': ingredients,
    'steps': steps,
  };
}
