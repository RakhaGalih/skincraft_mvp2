import 'package:flutter/material.dart';
import 'package:skincraft_mvp2/database/dummy/database.dart';
import 'package:skincraft_mvp2/model/constant/constant.dart';
import 'package:skincraft_mvp2/page/home/features/detail_produk.dart';
import 'package:skincraft_mvp2/service/service_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String? _image;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                MyNetworkImage(
                  imageURL:
                      _image ??
                      'https://firebasestorage.googleapis.com/v0/b/evolphy-cfb2e.appspot.com/o/Rectangle%206.png?alt=media&token=2b96ff1a-6c58-478d-8c4d-482cf3ba02ef',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang,',
                      style: kRegularTextStyle.copyWith(
                        fontSize: 14,
                        color: kGreyText,
                      ),
                    ),
                    Text(
                      'Mas Dono',
                      style: kSemiBoldTextStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: GestureDetector(child: const Icon(Icons.search)),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 15,
                ),
                filled: true,
                fillColor: kLightGrey,
                hintStyle: const TextStyle(color: kGreyText),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                hintText: 'Cari produk',
              ),
              onChanged: (value) async {},
            ),
            Expanded(
              child: GridView.builder(
                itemCount: DataDummy.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  final product = DataDummy.products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailProdukPage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            spreadRadius: 0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              product.imagePath,
                              height: 125.0,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 12.0),
                            Text(
                              product.name,
                              style: kRegularTextStyle.copyWith(fontSize: 14),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              '${product.soldCount} Sold',
                              style: kMediumTextStyle.copyWith(fontSize: 14),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child:
                                  product.stock > 0
                                      ? RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Stock ',
                                              style: kRegularTextStyle.copyWith(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: product.stock.toString(),
                                              style: kRegularTextStyle.copyWith(
                                                fontSize: 14,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      : Text(
                                        'Out of stock',
                                        style: kRegularTextStyle.copyWith(
                                          fontSize: 12,
                                          color: Colors.red,
                                        ),
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
