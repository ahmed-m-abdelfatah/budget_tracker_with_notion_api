class Item {
  final String name;
  final String category;
  final double price;
  final DateTime date;

  Item({
    required this.name,
    required this.category,
    required this.price,
    required this.date,
  });

// 48. Dart Factory Constructor (Arabic) لغة البرمجة دارت = https://youtu.be/4siYxQVLNb8
  factory Item.fromMap(Map<String, dynamic> map) {
    final Map<String, dynamic> properties = map['properties'];

    final List name = (properties['Name']?['title'] ?? []);
    final String? category = properties['Category']?['select']?['name'];
    final double? price = properties['Price']?['number'];
    final String? date = properties['Date']?['date']?['start'];

    return Item(
      name: name.isNotEmpty ? name[0]['plain_text'] : '???',
      category: category ?? 'Any',
      price: price ?? 0.00,
      date: date != null ? DateTime.parse(date) : DateTime.utc(1970),
    );
  }
}
