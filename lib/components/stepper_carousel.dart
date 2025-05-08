import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skincraft_mvp2/common/customization.dart' show CustomSize;
import 'package:skincraft_mvp2/model/constant/constant.dart';
import 'package:skincraft_mvp2/model/dummy/stepper_substance.dart';

class StepperCarousel extends StatefulWidget {
  const StepperCarousel({super.key});

  @override
  State<StepperCarousel> createState() => _StepperCarouselState();
}

class _StepperCarouselState extends State<StepperCarousel> {
  int _selectedIndex = 0;
  List<StepperSubstance> steppers = [
    StepperSubstance(
      title: 'Kenali Kulitmu, Dapatkan Perawatan Terbaik!',
      desc: 'Temukan skincare yang cocok berdasarkan komposisi bahan.',
      image: 'assets/image/serum.jpg',
    ),
    StepperSubstance(
      title: 'Diskusikan dan berbagi pengalaman dengan pengguna lain.',
      desc:
          'Jelajahi jenis kulitmu, pahami kebutuhannya, dan dapatkan saran dari komunitas.',
      image: 'assets/image/lotion.jpg',
    ),
    StepperSubstance(
      title: 'Uji Coba Skincare Sebelum Membeli!',
      desc:
          'Rasakan manfaat produk secara langsung, temukan yang paling cocok untuk kulitmu, dan buat keputusan yang tepat.',
      image: 'assets/image/skincare.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //carousel
        Expanded(
          child: PageView.builder(
            itemCount: steppers.length,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
              print(steppers[index].image);
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        steppers[index].image,
                        width: CustomSize.width(context, 0.55),
                      ),
                    ),
                    SizedBox(height: CustomSize.height(context, 0.06)),
                    Text(
                      steppers[index].title,
                      textAlign: TextAlign.center,
                      style: kBoldTextStyle.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      steppers[index].desc,
                      textAlign: TextAlign.center,
                      style: kRegularTextStyle.copyWith(
                        fontSize: 14,
                        color: kGreyText,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        //indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            steppers.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 6),
              height: 5,
              width: (index == _selectedIndex) ? 28 : 12,
              decoration: BoxDecoration(
                color: (index == _selectedIndex) ? kYellow : kGreyText,
                borderRadius: BorderRadius.circular(2.5),
              ),
              duration: const Duration(milliseconds: 450),
              curve: Curves.easeInOutQuint,
            ),
          ),
        ),
      ],
    );
  }
}
