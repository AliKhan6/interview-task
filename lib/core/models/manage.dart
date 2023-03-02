import 'package:interview_task/core/models/platform.dart';
import 'package:interview_task/core/models/profile.dart';

class Manage {
  String? id;
  List<Profile>? usernames;
  String? selectedDate;
  String? taskDetails;
  List<Platforms>? platforms;

  Manage({
    this.id,
    this.usernames,
    this.selectedDate,
    this.taskDetails,
    this.platforms,
  });
}
