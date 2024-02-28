import 'package:flutter/material.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/constants/app_icons.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  bool _isDropDownOpen = false;
  final List<String> _values = [
    "English",
    "Deutsch",
    "Deutsch",
    "Deutsch",
    "Deutsch",
    "Deutsch",
    "Deutsch",
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isDropDownOpen = !_isDropDownOpen;
            });
          },
          child: Container(
            width: 130,
            color: AppColors.transparent,
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _values[_selectedIndex],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                Image.asset(
                  _isDropDownOpen ? AppIcons.arrowRight : AppIcons.dropdown,
                  color: AppColors.white,
                  width: 28,
                  height: 28,
                ).onlyPadding(l: 6),
              ],
            ),
          ),
        ),
        if (_isDropDownOpen)
          Container(
            width: 130,
            height: 430,
            decoration: BoxDecoration(
              color: AppColors.lightBlack,
              border: Border.all(
                color: AppColors.grey,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _values.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                      _isDropDownOpen = false;
                    });
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: index == _selectedIndex
                          ? AppColors.lightPurple.withOpacity(.6)
                          : AppColors.transparent,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _values[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: index == _selectedIndex
                            ? AppColors.lightPurple
                            : AppColors.lightGrey,
                      ),
                    ),
                  ).onlyPadding(b: 12),
                );
              },
            ),
          ).onlyPadding(t: 20),
      ],
    );
  }
}
