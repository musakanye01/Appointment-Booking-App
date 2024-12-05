import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/widgets/bottom_nav_bars/main_nav_bar.dart';
import '../shared/widgets/cards/appointment_preview_card.dart';
import '../shared/widgets/list_tiles/session_list_tile.dart';
import '../shared/widgets/titles/section_title.dart';
import '../state/home/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a bloc and provide it to the HomeView
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Create the HomeView UI
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 4.0),
            Text(
              'Tendai',
              style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4.0),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search for bookings',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Container(
                  margin: const EdgeInsets.all(4.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: colorScheme.onSurfaceVariant,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(
                    Icons.filter_alt_outlined,
                    color: colorScheme.surfaceContainerHighest,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading ||
              state.status == HomeStatus.initial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == HomeStatus.loaded) {
            return const SingleChildScrollView(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _MySchedule(),
                  SizedBox(height: 24.0),
                  _DailyAvailableSessions(),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Error loading data'));
          }
        },
      ),
      bottomNavigationBar: const MainNavBar(),
    );
  }
}

class _MySchedule extends StatelessWidget {
  const _MySchedule();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: 'My Schedule',
              action: 'See all',
              onPressed: () {
                //Navigate to a list of the appointment preview cards,
              },
            ),
            AppointmentPreviewCard(
              appointment: state.myAppointments.firstOrNull,
            ),
          ],
        );
      },
    );
  }
}

class _DailyAvailableSessions extends StatelessWidget {
  const _DailyAvailableSessions();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: 'Sessions Available Today ',
              action: 'See all',
              onPressed: () {},
            ),
            const SizedBox(height: 8.0),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return Divider(
                  height: 24.0,
                  color: colorScheme.surfaceContainerHighest,
                );
              },
              itemCount: state.dailyAvailableSession.length,
              itemBuilder: (context, index) {
                final session = state.dailyAvailableSession[index];
                return SessionListTile(session: session);
              },
            ),
          ],
        );
      },
    );
  }
}
