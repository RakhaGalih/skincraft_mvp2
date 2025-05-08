import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skincraft_mvp2/model/constant/constant.dart';
import 'package:skincraft_mvp2/model/provider/data_model.dart';

class NavBarIcon extends StatelessWidget {
  final int index;
  final bool isActive;
  final Color color;
  final IconData icon;
  final IconData activeIcon;
  final String title;
  const NavBarIcon({
    super.key,
    required this.index,
    required this.isActive,
    required this.color,
    required this.icon,
    required this.activeIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<DataModel>(context, listen: false).onNavBarTapped(index);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (isActive) ? color : kWhite.withOpacity(0),
            ),
            child: Icon(
              (isActive) ? activeIcon : icon,
              size: 24,
              color: (isActive) ? kWhite : kGreyText,
            ),
          ),
          Text(
            title,
            style: kMediumTextStyle.copyWith(
              fontSize: 14,
              color: (isActive) ? kYellow : kGreyText,
            ),
          ),
        ],
      ),
    );
  }
}
