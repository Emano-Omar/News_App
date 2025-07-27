import 'package:bloc/bloc.dart';
import 'package:news_app/core/helpers/shred_pref_constants.dart';
import 'package:news_app/features/ui/widgets/drawer/logic/cubit/theme_states.dart';

import '../../../../../../core/helpers/shered_pref_helper.dart';


class ThemeCubit extends Cubit<ThemeStates>{

  ThemeCubit(): super (ThemeInitialState());

  bool isDark = false;

  changeAppTheme({bool? fromShared}) async {
    if (fromShared != null) {
      isDark = fromShared;

      emit(AppThemeState());
    }
    else
    {
      isDark = !isDark;
      await saveThemeData(isDark);

      emit(AppThemeState());

    }
  }

  Future<void> saveThemeData(bool isDark) async
  {
    SharedPrefHelper.saveData(SharedPrefKeys.isDark, isDark);
  }
}

