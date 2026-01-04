import 'package:flutter/cupertino.dart';
import '../models/product.dart';

class CupertinoHome extends StatelessWidget {
  final VoidCallback onToggle;

  const CupertinoHome({super.key, required this.onToggle});

  void _showDrawer(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        color: CupertinoColors.systemBackground.resolveFrom(context),
        width: double.infinity,
        height: 400, // Partial height sheet to simulate "drawer/modal"
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: CupertinoColors.activeBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://scontent.fpnh5-4.fna.fbcdn.net/v/t39.30808-6/510404078_2176727496163912_5298614412175328104_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=-bqmvlCA4usQ7kNvwG7aUgx&_nc_oc=AdkBaKVATp6KAfn0QZh1ok_kbyhE0_4WLX8tpR3DoPvf-Z1kqF5wrQZTrMuXcevTs3A&_nc_zt=23&_nc_ht=scontent.fpnh5-4.fna&_nc_gid=EhtS88M7HnrXm7LP5GbPGQ&oh=00_AfoyLMGt2ASuS5eqBFf5ClKubLiWkcQS0mbZoTsy8DnSMA&oe=69602EE3",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "User Name",
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const Text(
                    "user@example.com",
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 14,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            CupertinoButton(
              child: const Row(
                children: [
                  Icon(CupertinoIcons.home),
                  SizedBox(width: 10),
                  Text("Home"),
                ],
              ),
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoButton(
              child: const Row(
                children: [
                  Icon(CupertinoIcons.settings),
                  SizedBox(width: 10),
                  Text("Settings"),
                ],
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(CupertinoIcons.bars),
              onPressed: () => _showDrawer(context),
            ),
            middle: const Text('iOS Store'),
            trailing: CupertinoSwitch(
              value: true,
              onChanged: (_) => onToggle(),
            ),
          ),
          child: SafeArea(
            child: ListView.builder(
              itemCount: kProducts.length,
              itemBuilder: (context, index) {
                final product = kProducts[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          product.imageUrl,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (ctx, error, stackTrace) =>
                              const Icon(CupertinoIcons.photo),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .textStyle
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              product.description,
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .textStyle
                                  .copyWith(
                                    fontSize: 14,
                                    color: CupertinoColors.systemGrey,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: CupertinoTheme.of(context).textTheme.textStyle
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
