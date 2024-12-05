import 'package:doctor_booking_app_with_flutter_and_bloc/screens/doctor_details_screen.dart';
import 'package:flutter/material.dart';

class MainNavBar extends StatelessWidget {
  const MainNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BottomNavigationBar(
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurface.withOpacity(0.5),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedFontSize: 14,
      selectedLabelStyle: textTheme.bodySmall,
      unselectedLabelStyle: textTheme.bodySmall,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        switch (index) {
          case 0:
            print(index);
            // TODO: Navigate somewhere
            break;
          case 1:
            print(index);
            // TODO: Testing detail if it still works
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const DoctorDetailsScreen(doctorId: "2");
                },
              ),
            );
            break;
          // ... other index
          default:
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          label: 'Bookings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
