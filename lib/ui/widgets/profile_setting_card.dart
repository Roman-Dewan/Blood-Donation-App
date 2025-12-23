import 'package:flutter/material.dart';

class ProfileSettingCard extends StatelessWidget {
  final IconData icon;
  final String data;
  final VoidCallback onTap;

  const ProfileSettingCard({
    super.key, required this.icon, required this.data, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      dense: true,
      splashColor: Colors.red.shade100,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),

      leading: Icon(icon),
      title: Text(data, style: TextTheme.of(context).bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
    );
  }
}
