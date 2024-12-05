import 'package:flutter/material.dart';
import 'package:models/models.dart';

import '../../../screens/doctor_details_screen.dart';

class SessionListTile extends StatelessWidget {
  const SessionListTile({
    super.key,
    required this.session,
  });

  final Session session;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      // Add navigation
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DoctorDetailsScreen(doctorId: session.id);
            },
          ),
        );
      },
      contentPadding: EdgeInsets.zero,
      leading: Icon(session.sessionIcon.icon),
      title: Text(
        session.name,
        style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4.0),
          Text(
            session.capacity.name,
            style: textTheme.bodyMedium!.copyWith(
              color: colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Icon(Icons.location_city, color: colorScheme.tertiary, size: 16),
              const SizedBox(width: 4),
              Text(
                session.address,
                style: textTheme.bodySmall!.copyWith(
                  color: colorScheme.onSurface.withOpacity(.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: FilledButton(
        onPressed: () {},
        child: const Text('Book Now'),
      ),
    );
  }
}
