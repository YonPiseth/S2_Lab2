import 'package:flutter/material.dart';
import '../models/product.dart';

class MaterialHome extends StatelessWidget {
  final VoidCallback onToggle;

  const MaterialHome({super.key, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Android Store'),
        actions: [
          Switch(
            value: false,
            onChanged: (_) => onToggle(),
            activeThumbColor: Colors.white,
            activeTrackColor: Colors.blueAccent,
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("User Name"),
              accountEmail: Text("user@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://scontent.fpnh5-4.fna.fbcdn.net/v/t39.30808-6/510404078_2176727496163912_5298614412175328104_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=-bqmvlCA4usQ7kNvwG7aUgx&_nc_oc=AdkBaKVATp6KAfn0QZh1ok_kbyhE0_4WLX8tpR3DoPvf-Z1kqF5wrQZTrMuXcevTs3A&_nc_zt=23&_nc_ht=scontent.fpnh5-4.fna&_nc_gid=EhtS88M7HnrXm7LP5GbPGQ&oh=00_AfoyLMGt2ASuS5eqBFf5ClKubLiWkcQS0mbZoTsy8DnSMA&oe=69602EE3",
                ),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: kProducts.length,
        itemBuilder: (context, index) {
          final product = kProducts[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                product.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (ctx, error, stackTrace) =>
                    const Icon(Icons.image_not_supported),
              ),
              title: Text(product.name),
              subtitle: Text(product.description),
              trailing: Text('\$${product.price.toStringAsFixed(2)}'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Added ${product.name} to cart'),
                    action: SnackBarAction(label: 'UNDO', onPressed: () {}),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Navigated to tab $index')));
        },
      ),
    );
  }
}
