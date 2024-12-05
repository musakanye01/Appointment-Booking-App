import 'package:models/models.dart';

class DoctorRepository {
  const DoctorRepository(
      // TODO: Inject the required dependencies
      // e.g. class to connect with the db
      );

  Future<List<SessionCapacity>> fetchDoctorCategories() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // TODO: get those data from the DB
    return SessionCapacity.values;
  }

  Future<List<Session>> fetchDoctors() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return Session.sampleSession;
  }

  Future<List<Session>> fetchDoctorsByCategory(String categoryId) async {
    throw UnimplementedError();
  }

  Future<Session?> fetchDoctorById(String doctorId) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return Session.sampleSession.firstWhere(
      (doctor) => doctor.id == doctorId,
    );
  }
}
