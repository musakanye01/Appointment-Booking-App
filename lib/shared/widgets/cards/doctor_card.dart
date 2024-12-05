import 'package:flutter/material.dart';
import 'package:models/models.dart';

class DoctorCard extends StatefulWidget {
  const DoctorCard({
    super.key,
    required this.session,
    this.showAbout = true,
    this.showMoreInformation = true,
  });

  final Session session;
  final bool showAbout;
  final bool showMoreInformation;

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final moreInformation = [
      {
        'icon': Icons.account_circle_outlined,
        'label': 'Patients',
        'value': "WTF",
      },
      {
        'icon': Icons.star_border,
        'label': 'Experience',
        'value': '3 years',
      },
      {
        'icon': Icons.favorite_border,
        'label': 'Rating',
        'value': "WTF",
      },
      {
        'icon': Icons.numbers,
        'label': 'Reviews',
        'value': "WTF",
      }
    ];

    return Card(
      color: Colors.transparent,
      elevation: 0.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile
          Row(
            children: [
              CircleAvatar(
                radius: 48.0,
                backgroundColor: colorScheme.surface,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.session.name,
                      style: textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      widget.session.capacity.name,
                      style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.onSurface.withOpacity(.5),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: colorScheme.secondary,
                          size: 16,
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          'New York, USA',
                          style: textTheme.bodySmall!.copyWith(
                            color: colorScheme.onSurface.withOpacity(.5),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(height: 32.0, color: colorScheme.surfaceContainerHighest),

          // About
          ...widget.showAbout
              ? [
                  Text(
                    'About',
                    style: textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    widget.session.sessionNotes,
                    maxLines: showAll ? null : 3,
                    style: textTheme.bodyMedium!.copyWith(
                      color: colorScheme.onSurface.withOpacity(.5),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),
                    onPressed: () {
                      setState(() {
                        showAll = !showAll;
                      });
                    },
                    child: Text(
                      showAll ? 'Show less' : 'Show all',
                      style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.secondary,
                        decoration: TextDecoration.underline,
                        decorationColor: colorScheme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ]
              : [],

          // More information
          ...widget.showMoreInformation
              ? [
                  Row(
                    children: moreInformation
                        .map(
                          (e) => Expanded(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: colorScheme.primary,
                                  foregroundColor: colorScheme.onPrimary,
                                  child: Icon(e['icon'] as IconData),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  e['value'].toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodyLarge!.copyWith(
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  e['label'] as String,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  )
                ]
              : []
        ],
      ),
    );
  }
}
