import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:interview_task/core/constants/text_styles.dart';
import 'package:interview_task/core/models/profile.dart';

// ignore: must_be_immutable
class UserProfileDropdown extends StatefulWidget {
  final String? value;
  List<Profile>? list;
  final String? selectedImgUrl;
  // ignore: prefer_typing_uninitialized_variables
  final onChanged;
  String? selectedItem;
  UserProfileDropdown(
      {super.key,
      this.list,
      this.onChanged,
      this.value,
      this.selectedItem,
      this.selectedImgUrl});

  @override
  State<UserProfileDropdown> createState() => _UserProfileDropdownState();
}

class _UserProfileDropdownState extends State<UserProfileDropdown> {
  String? selectedValue;

  List<DropdownMenuItem<Profile>> _addDividersAfterItems(List<Profile> items) {
    List<DropdownMenuItem<Profile>> menuItems = [];
    for (var item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<Profile>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        shape: BoxShape.circle),
                    child: Center(
                        child: Text("${item.userImgUrl}",
                            style: subBodyTextStyle)),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    item.username ?? "",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item == items.last)
            DropdownMenuItem<Profile>(
              enabled: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Row(
                  children: const [
                    Text("New", style: bodyTextStyle),
                    SizedBox(width: 5),
                    Icon(Icons.add)
                  ],
                ),
              ),
            ),
        ],
      );
    }
    return menuItems;
  }

  ///
  /// dropdown button
  ///
  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      iconStyleData: const IconStyleData(
          iconSize: 0.0,
          icon: Icon(
            Icons.dry_outlined,
            color: Colors.transparent,
          )),
      dropdownStyleData: const DropdownStyleData(elevation: 3),
      underline: Container(),
      isExpanded: true,
      hint: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3), shape: BoxShape.circle),
            child: Center(
                child:
                    Text("${widget.selectedImgUrl}", style: subBodyTextStyle)),
          ),
          const SizedBox(width: 10),
          Text(
            '${widget.selectedItem}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF090A0A),
            ),
          ),
        ],
      ),
      items: _addDividersAfterItems(widget.list!),
      value: selectedValue,
      onChanged: widget.onChanged,
    );
  }
}
