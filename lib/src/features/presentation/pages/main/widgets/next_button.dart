import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/colors/colors.dart';

class NextButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  const NextButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 23.0,
        width: 23.0,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.C_EFEFEF,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.none,
          ),
        ),
      ),
    );
  }
}
