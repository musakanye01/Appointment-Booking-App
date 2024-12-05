part of 'home_bloc.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<SessionCapacity> sessionCapacities;
  final List<Session> dailyAvailableSession;
  final List myAppointments;

  const HomeState({
    this.status = HomeStatus.initial,
    this.sessionCapacities = const <SessionCapacity>[],
    this.dailyAvailableSession = const <Session>[],
    this.myAppointments = const [],
  });

  HomeState copyWith({
    HomeStatus? status,
    List<SessionCapacity>? doctorCategories,
    List<Session>? nearbyDoctors,
    List? myAppointments,
  }) {
    return HomeState(
      status: status ?? this.status,
      sessionCapacities: doctorCategories ?? this.sessionCapacities,
      dailyAvailableSession: nearbyDoctors ?? this.dailyAvailableSession,
      myAppointments: myAppointments ?? this.myAppointments,
    );
  }

  @override
  List<Object> get props => [
        status,
        sessionCapacities,
        dailyAvailableSession,
        myAppointments,
      ];
}
