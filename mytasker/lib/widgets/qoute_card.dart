import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/theme.dart';

class QouteCard extends StatelessWidget {
  final String qoute;
  final String qouteBy;
  const QouteCard({
    super.key,
    required this.qoute,
    required this.qouteBy,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(35),
      ),
      width: double.infinity,
      height: size.height * 0.22,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            maxLines: 3,
            qoute,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: -0.17,
              fontSize: 20,
              color: theme.colorScheme.secondary,
            ),
          ),
          Gap(size.height * 0.02),
          Text(
            qouteBy,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.normal,
              letterSpacing: -0.17,
              fontSize: 14,
              color: theme.colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
