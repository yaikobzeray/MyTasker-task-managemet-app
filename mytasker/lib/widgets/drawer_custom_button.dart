import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../utils/image_constants.dart';
import '../utils/theme.dart';

class DrawerCustomButton extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onPressed;
  final Color color;

  const DrawerCustomButton({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              color: color,
            ),
            Gap(size.width * 0.05),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: color),
            )
          ],
        ),
      ),
    );
  }
}
