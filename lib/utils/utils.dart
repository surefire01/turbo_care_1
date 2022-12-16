import 'package:flutter/material.dart';

// used at many screens for eg: model list screen
class AppListTile extends StatelessWidget {
  const AppListTile({super.key, required this.title, required this.onTap});

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (() => onTap()),
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
      ),
    );
  }
}
