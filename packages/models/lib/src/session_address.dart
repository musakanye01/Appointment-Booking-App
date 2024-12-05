import 'package:equatable/equatable.dart';

class SessionAddress extends Equatable {
  final String id;
  final String name;

  const SessionAddress({
    required this.id,
    required this.name,
  });

  SessionAddress copyWith({
    String? id,
    String? name
  }) {
    return SessionAddress(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  static const sampleAddresses = ["Crown Plaza", "Arlington Estate"];
}
