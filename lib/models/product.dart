class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  const Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });
}

// Sample data
const List<Product> kProducts = [
  Product(
    name: "Wireless Headphones",
    price: 99.99,
    imageUrl: "https://picsum.photos/id/1/200/200",
    description: "High quality noise cancelling headphones.",
  ),
  Product(
    name: "Smart Watch",
    price: 199.99,
    imageUrl: "https://picsum.photos/id/2/200/200",
    description: "Track your fitness and notifications.",
  ),
  Product(
    name: "Laptop",
    price: 999.99,
    imageUrl: "https://picsum.photos/id/3/200/200",
    description: "Powerful laptop for work and play.",
  ),
  Product(
    name: "Camera",
    price: 499.50,
    imageUrl: "https://picsum.photos/id/4/200/200",
    description: "Capture life's moments.",
  ),
  Product(
    name: "Shoes",
    price: 79.00,
    imageUrl: "https://picsum.photos/id/5/200/200",
    description: "Comfortable running shoes.",
  ),
];
