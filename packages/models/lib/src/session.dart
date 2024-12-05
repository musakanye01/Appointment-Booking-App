import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:models/src/session_address.dart';
import 'package:models/src/session_capacity.dart';

class Session extends Equatable {
  final String id;
  final String name;
  final Icon sessionIcon;
  final String sessionNotes;
  final SessionCapacity capacity;
  final String address;

  const Session(
      {required this.id,
      required this.name,
      required this.sessionIcon,
      required this.sessionNotes,
      required this.capacity,
      required this.address});

  @override
  List<Object?> get props => [
        id,
        name,
        sessionIcon,
        capacity,
        address,
      ];

  static final sampleSession = [
    Session(
      id: '1',
      name: '2pm - 4 pm',
      sessionNotes:
          ' Extra Details the client might need to know, maybe amenities and facilities etc.',
      sessionIcon: const Icon(Icons.sports),
      capacity: SessionCapacity.oneIndividual,
      address: SessionAddress.sampleAddresses[0],
    ),
  ];
}
