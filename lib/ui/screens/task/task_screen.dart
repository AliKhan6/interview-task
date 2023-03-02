import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:interview_task/core/constants/date_formates.dart';
import 'package:interview_task/core/constants/strings.dart';
import 'package:interview_task/core/constants/text_styles.dart';
import 'package:interview_task/core/enums/view_state.dart';
import 'package:interview_task/ui/custom_widgets/platform_dropdown.dart';
import 'package:interview_task/ui/screens/task/task_view_model.dart.dart';
import 'package:provider/provider.dart';
import '../../custom_widgets/user_profile_dropdown.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          body: Stack(
            children: [
              ///
              /// management Tile [username, image and platform]
              ///
              ///
              managementTile(model),
              ////
              ///
              /// Calender
              ///
              ///

              model.showCalender
                  ?
                  // Show Calender
                  calender(model)
                  :
                  // don't show calender
                  Container(),
            ],
          ),
        );
      },
    );
  }

  calender(TaskViewModel model) {
    return Positioned(
      left: (model.leftPosition ?? 0) - 10,
      top: (model.topPosition ?? 0) + 10,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 2,
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(0, 0))
            ]),
        height: 380,
        width: 380,
        padding: const EdgeInsets.all(10),
        child: Expanded(
          child: Column(
            children: [
              SizedBox(
                  height: 360,
                  width: 340,
                  child: Expanded(
                    child: CalendarCarousel(
                      todayTextStyle:
                          subBodyTextStyle.copyWith(color: Colors.black),
                      todayBorderColor: Colors.grey,
                      weekendTextStyle:
                          subBodyTextStyle.copyWith(color: Colors.black),
                      weekDayBackgroundColor: Colors.grey.withOpacity(0.2),
                      weekDayPadding: const EdgeInsets.symmetric(vertical: 8),
                      weekdayTextStyle:
                          subBodyTextStyle.copyWith(color: Colors.black),
                      dayButtonColor: Colors.white,
                      leftButtonIcon: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  color: Colors.grey.withOpacity(0.2),
                                  offset: const Offset(0, 0))
                            ]),
                        child: const Center(
                            child: Icon(Icons.keyboard_arrow_left,
                                color: Colors.grey)),
                      ),
                      rightButtonIcon: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  color: Colors.grey.withOpacity(0.2),
                                  offset: const Offset(0, 0))
                            ]),
                        child: const Center(
                            child: Icon(Icons.keyboard_arrow_right,
                                color: Colors.grey)),
                      ),
                      selectedDateTime: model.selectedDate,
                      showOnlyCurrentMonthDate: true,
                      todayButtonColor: Colors.transparent,
                      thisMonthDayBorderColor: Colors.grey,
                      daysHaveCircularBorder: false,
                      selectedDayButtonColor: Colors.blueAccent,
                      onDayPressed: (date, events) {
                        model.showCalender = false;
                        model.selectedDate = date;
                        model.selectDate = onlyMonth.format(model.selectedDate);
                        model.setState(ViewState.idle);
                      },
                      dayPadding: 5,
                      pageScrollPhysics: const NeverScrollableScrollPhysics(),
                      customGridViewPhysics:
                          const NeverScrollableScrollPhysics(),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  managementTile(TaskViewModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 3,
                      color: Colors.grey.withOpacity(0.2),
                      offset: const Offset(0.5, 1))
                ]),
            child: Column(
              children: [
                ///
                /// user dropdown and clender
                ///
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 200,
                          child: UserProfileDropdown(
                            selectedItem:
                                model.selectedUser.username ?? "Select User",
                            value: model.selectedUser.username ?? "Select User",
                            selectedImgUrl:
                                model.selectedUser.userImgUrl ?? "SU",
                            list: model.userProfileList,
                            onChanged: (val) {
                              model.changeUser(val);
                            },
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTapDown: (details) {
                        print(details);
                        if (model.leftPosition == null) {
                          final tapPosition = details.globalPosition;
                          model.leftPosition = tapPosition.dx;
                          model.topPosition = tapPosition.dy;
                        }
                      },
                      onTap: () {
                        model.showCalender = true;
                        print(model.showCalender);
                        model.setState(ViewState.idle);
                      },
                      child: Row(
                        children: [
                          Image.asset("$staticAssets/calender.png",
                              height: 30, width: 30, color: Colors.black54),
                          const SizedBox(width: 5),
                          Text("${model.selectDate}", style: bodyTextStyle)
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),

                ///
                /// task details
                ///
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      maxLines: 4,
                      onChanged: (value) {},
                      initialValue:
                          "Overcome key issues to meet key milestones drink from the firehose, yet beef up (let's not try to) boil the ocean (here/there/everywhere).",
                      style: bodyTextStyle,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    )),

                ///
                /// platform dropdown
                ///
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: PlatformDropdown(
                        selectedItem:
                            model.selectePlatform.name ?? "Select User",
                        value: model.selectePlatform.name ?? "Select User",
                        selectedImgUrl: model.selectePlatform.imagePath ??
                            "$staticAssets/slack.png",
                        list: model.platformList,
                        onChanged: (val) {
                          model.changePlatform(val);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
