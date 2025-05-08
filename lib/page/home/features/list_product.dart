import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skincraft_mvp2/database/dummy/database.dart';
import 'package:skincraft_mvp2/model/constant/constant.dart';

import '../../../common/customization.dart';
import '../../../model/dummy/product.dart';
import 'detail_produk.dart';

class ListProductPage extends StatefulWidget {
  const ListProductPage({super.key});

  @override
  State<ListProductPage> createState() => _ListProductPageState();
}

class _ListProductPageState extends State<ListProductPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Product', style: kBoldTextStyle.copyWith(fontSize: 14))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                          prefixIcon:
                              GestureDetector(child: const Icon(Icons.search)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 15),
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
                          hintText: 'Cari produk'),
                      onChanged: (value) async {}),
                ),
                const SizedBox(width: 12.0),
                GestureDetector(
                  onTap: () {
                    filter();
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: SvgPicture.asset('assets/svg/filter_icon.svg',
                          height: 24.0, width: 24.0)),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
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
                    child: _buildProductCard(product),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              spreadRadius: 0,
              offset: Offset(0, 2)),
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
              child: product.stock > 0
                  ? RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Stock ',
                              style: kRegularTextStyle.copyWith(
                                  fontSize: 14, color: Colors.black)),
                          TextSpan(
                              text: product.stock.toString(),
                              style: kRegularTextStyle.copyWith(
                                  fontSize: 14, color: Colors.green)),
                        ],
                      ),
                    )
                  : Text('Out of stock',
                      style: kRegularTextStyle.copyWith(
                          fontSize: 12, color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }

  filter() {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 400,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Filter',
                    style: kSemiBoldTextStyle.copyWith(fontSize: 17)),
                const SizedBox(height: 25),
                Text('Kategori',
                    style: kSemiBoldTextStyle.copyWith(fontSize: 17)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    filterChoice('Stock'),
                    const SizedBox(width: 8),
                    filterChoice('Most Sold'),
                    const SizedBox(width: 8),
                    filterChoice('A - Z'),
                  ],
                ),
                const SizedBox(height: 25),
                Text('Singkirkan',
                    style: kSemiBoldTextStyle.copyWith(fontSize: 17)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    filterChoice('Out of Stock'),
                  ],
                ),
                Expanded(child: Container()),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE1B064),
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Tampilkan produk",
                      style:
                          CustomFont.poppins(Colors.white, 14, FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget filterChoice(String title) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: const Color(0xFFEDEDED)),
      child: Center(
        child: Text(title, style: kMediumTextStyle.copyWith(fontSize: 12)),
      ),
    ),
  );
}
