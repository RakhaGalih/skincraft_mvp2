import 'package:skincraft_mvp2/common/customization.dart';

import '../../model/dummy/phone_code_model.dart';
import '../../model/dummy/product.dart';
import '../../model/dummy/report_product_chart.dart';

class DataDummy {
  static List<PhoneCode> countries = [
    PhoneCode(name: "Indonesia", code: "+62", flag: ImageAssets.IND),
    PhoneCode(name: "Japan", code: "+81", flag: ImageAssets.JAP),
    PhoneCode(name: "South Africa", code: "+27", flag: ImageAssets.AFC),
    PhoneCode(name: "America", code: "+1", flag: ImageAssets.USA),
  ];

  static List<ChartData> chartData = [
    ChartData(0, 750, 500),
    ChartData(1, 700, 1000),
    ChartData(2, 250, 750),
    ChartData(3, 400, 500),
    ChartData(4, 300, 300),
    ChartData(5, 900, 200),
    ChartData(6, 450, 600),
    ChartData(7, 500, 500),
    ChartData(8, 650, 450),
    ChartData(9, 600, 800),
  ];

  static List<Product> products = [
    Product(
      name: 'Ordinary set',
      imagePath: 'assets/image/lotion.jpg',
      soldCount: 45000,
      stock: 80,
    ),
    Product(
      name: 'Atoderm Intensive Gel-Creme',
      imagePath: 'assets/image/skincare.jpg',
      soldCount: 55000,
      stock: 90,
    ),
    Product(
      name: 'Originote Hyluronic Acid Serum',
      imagePath: 'assets/image/serum.jpg',
      soldCount: 100000,
      stock: 60,
    ),
  ];

  static List<ProductData> productData = [
    ProductData(0, 800, 320, '140.000'),
    ProductData(1, 500, 25, '95.000'),
    ProductData(2, 15, 950, '45.000'),
    ProductData(3, 220, 650, '185.000'),
    ProductData(4, 720, 200, '210.000'),
    ProductData(5, 280, 170, '130.000'),
    ProductData(6, 950, 190, '55.000'),
  ];
}
