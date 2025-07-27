import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/shered_pref_helper.dart';
import '../../../../../core/helpers/shred_pref_constants.dart';
import '../logic/cubit/theme_cubit.dart';

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({super.key});

  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();
}
class _DarkModeSwitchState extends State<DarkModeSwitch> {
  bool _isSwitched = false;

  @override
  void initState() {
    super.initState();
    _loadDarkModePreference();
  }

  void _loadDarkModePreference() async {
    bool isDarkMode = await SharedPrefHelper.getBool(SharedPrefKeys.isDark);
    setState(() {
      _isSwitched = isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).iconTheme.color;

    return Container(
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[500],
      ),
      child: SwitchListTile(
        title: Text(
          'Dark Mode',
          style: TextStyle(color: Colors.white),
        ),
        activeColor: Colors.white,
       // inactiveThumbColor: isDark ? Colors.green : Colors.black,
        contentPadding: const EdgeInsets.only(left: 22, right: 15),
        secondary: Icon(Icons.dark_mode_outlined, color: iconColor),
        value: _isSwitched,
        onChanged: (bool isDarkMode) async {
          context.read<ThemeCubit>().changeAppTheme();
          setState(() {
            _isSwitched = isDarkMode;
          });
          Navigator.of(context).pop(); // Close drawer
        },
      ),
    );
  }
}

