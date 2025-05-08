import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:skincraft_mvp2/common/customTextField.dart';
import 'package:skincraft_mvp2/components/mainButton.dart';
import 'package:skincraft_mvp2/components/navbar_icon.dart';
import 'package:skincraft_mvp2/components/secondaryButton.dart';
import 'package:skincraft_mvp2/model/constant/constant.dart';
import 'package:skincraft_mvp2/model/dummy/navicon.dart';
import 'package:skincraft_mvp2/model/provider/data_model.dart';
import 'package:skincraft_mvp2/page/home/homepage.dart';
import 'package:skincraft_mvp2/page/home/profile_page.dart';
import 'package:skincraft_mvp2/service/service_component.dart';
import 'package:provider/provider.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NavIcon> navIcons = [
    const NavIcon(
        icon: FluentIcons.home_20_regular,
        activeIcon: FluentIcons.home_20_filled,
        title: 'Home'),
    const NavIcon(
        icon: FluentIcons.person_20_regular,
        activeIcon: FluentIcons.person_20_filled,
        title: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(builder: (context, data, child) {
      List<Widget> widgetOptions = <Widget>[
        const HomePage(),
        const ProfilePage(),
      ];
      return Scaffold(
        body: Stack(
          children: [
            widgetOptions[data.selectedNavBar],
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).padding.bottom + 94,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: kGrey, width: 2.0),
                  ),
                ),
                child: Material(
                  color: kWhite,
                  child: InkWell(
                    onTap: () {},
                    child: SafeArea(
                      top: false,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 12),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(
                                navIcons.length,
                                (index) => Padding(
                                      padding: EdgeInsets.only(
                                        right: (index == 0) ? 20 : 0,
                                        left: (index == 0) ? 0 : 20,
                                      ),
                                      child: NavBarIcon(
                                        isActive: data.selectedNavBar == index,
                                        index: index,
                                        color: kYellow,
                                        icon: navIcons[index].icon,
                                        activeIcon: navIcons[index].activeIcon!,
                                        title: navIcons[index].title,
                                      ),
                                    ))),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () async {
                      var res = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SimpleBarcodeScannerPage(
                                    scanType: ScanType.barcode,
                                    isShowFlashIcon: true),
                          ));
                    },
                    child: Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kYellow,
                        ),
                        child: const Icon(
                          FluentIcons.barcode_scanner_20_filled,
                          size: 36,
                          color: kWhite,
                        )),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Scan',
                    style: kMediumTextStyle.copyWith(
                        fontSize: 14, color: kGreyText),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom + 12,
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
