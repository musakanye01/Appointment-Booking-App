import 'package:flutter/material.dart';

enum SessionCapacity {
  oneIndividual(
    name: 'One Person',
    icon: Icons.account_circle_outlined,
  ),
  twoIndivudals(
    name: 'Two people',
    icon: Icons.favorite_border_outlined,
  );

  final String name;
  final IconData icon;

  const SessionCapacity({
    required this.name,
    required this.icon,
  });
}
