import 'package:flutter/material.dart';
import '../../app_color.dart'; // Ensure this path is correct

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;

  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value,
          activeColor: AppColor.kred,
          onChanged: onChanged,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        GestureDetector(
          onTap: () {
            onChanged(!value);
          },
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColor.kblack,
            ),
          ),
        ),
      ],
    );
  }
}