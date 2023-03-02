import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:interview_task/core/constants/text_styles.dart';
import 'package:interview_task/core/models/platform.dart';

// ignore: must_be_immutable
class PlatformDropdown extends StatefulWidget {
  final String? value;
  List<Platforms>? list;
  final String? selectedImgUrl;
  // ignore: prefer_typing_uninitialized_variables
  final onChanged;
  String? selectedItem;
  PlatformDropdown(
      {super.key,
      this.list,
      this.onChanged,
      this.value,
      this.selectedItem,
      this.selectedImgUrl});

  @override
  State<PlatformDropdown> createState() => _UserProfileDropdownState();
}

class _UserProfileDropdownState extends State<PlatformDropdown> {
  String? selectedValue;

  List<DropdownMenuItem<Platforms>> _addDividersAfterItems(
      List<Platforms> items) {
    List<DropdownMenuItem<Platforms>> menuItems = [];
    for (var item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<Platforms>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Image.asset(
                    "${item.imagePath}",
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    item.name ?? "",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item == items.last)
            DropdownMenuItem<Platforms>(
              enabled: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Row(
                  children: const [
                    Text("None", style: subBodyTextStyle),
                  ],
                ),
              ),
            ),
        ],
      );
    }
    return menuItems;
  }

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
          Image.asset(
            "${widget.selectedImgUrl}",
            height: 30,
            width: 30,
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
