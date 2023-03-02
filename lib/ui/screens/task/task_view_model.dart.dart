import 'package:interview_task/core/constants/date_formates.dart';
import 'package:interview_task/core/constants/strings.dart';
import 'package:interview_task/core/models/platform.dart';
import 'package:interview_task/core/models/profile.dart';
import 'package:interview_task/core/view_model.s/base_view_model.dart';

class TaskViewModel extends BaseViewModel {
  Profile selectedUser = Profile();
  Platforms selectePlatform = Platforms();
  double? leftPosition = 0;
  double? topPosition = 0;
  bool showCalender = false;
  DateTime selectedDate = DateTime.now();
  String? selectDate = "Jul 1st";

  TaskViewModel() {
    selectDate = onlyMonth.format(selectedDate);
    notifyListeners();
  }

  ///
  /// users profile list
  ///
  List<Profile> userProfileList = [
    Profile(userImgUrl: "AA", username: "Ali Asghar"),
    Profile(userImgUrl: "HJ", username: "Hashim Jan"),
    Profile(userImgUrl: "AB", username: "Abdullah")
  ];

  ///
  /// available platform list
  List<Platforms> platformList = [
    Platforms(name: "Slack", imagePath: "$staticAssets/slack.png"),
    Platforms(name: "Trello", imagePath: "$staticAssets/trello.png"),
    Platforms(name: "Jira", imagePath: "$staticAssets/jira.png")
  ];

  ///
  /// change user profile from dropdown
  ///
  changeUser(Profile newUser) {
    selectedUser = newUser;
    notifyListeners();
  }

  ///
  /// change user platform from dropdown
  ///
  changePlatform(Platforms newPlatform) {
    selectePlatform = newPlatform;
    notifyListeners();
  }
}
