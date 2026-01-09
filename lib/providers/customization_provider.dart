import 'package:flutter/material.dart';
import '../models/customization_config.dart';
import '../theme/app_colors.dart';

class CustomizationProvider extends ChangeNotifier {
  CustomizationConfig _config = CustomizationConfig();
  
  CustomizationConfig get config => _config;
  
  AppColors get colors => _config.isDarkMode 
      ? AppColors.dark() 
      : AppColors.light();

  AppColors get customizedColors {
    var baseColors = colors;
    
    if (_config.customPrimaryColor != null) {
      baseColors = baseColors.copyWith(
        primary: _config.customPrimaryColor,
        buttonPrimary: _config.customPrimaryColor,
        controlActive: _config.customPrimaryColor,
        progressActive: _config.customPrimaryColor,
      );
    }
    
    if (_config.customBackgroundColor != null) {
      baseColors = baseColors.copyWith(
        background: _config.customBackgroundColor,
      );
    }
    
    if (_config.customButtonColor != null) {
      baseColors = baseColors.copyWith(
        buttonPrimary: _config.customButtonColor,
        buttonEnabled: _config.customButtonColor,
      );
    }
    
    if (_config.customTextColor != null) {
      baseColors = baseColors.copyWith(
        textLarge: _config.customTextColor,
        textMedium: _config.customTextColor,
        playerTitle: _config.customTextColor,
      );
    }
    
    return baseColors;
  }

  void updateConfig(CustomizationConfig newConfig) {
    _config = newConfig;
    notifyListeners();
  }

  void toggleDarkMode() {
    _config = _config.copyWith(isDarkMode: !_config.isDarkMode);
    notifyListeners();
  }

  void setFontFamily(String fontFamily) {
    _config = _config.copyWith(fontFamily: fontFamily);
    notifyListeners();
  }

  void setFontSizeMultiplier(double multiplier) {
    _config = _config.copyWith(fontSizeMultiplier: multiplier);
    notifyListeners();
  }

  void setPrimaryColor(Color? color) {
    _config = _config.copyWith(
      customPrimaryColor: color,
      clearCustomPrimary: color == null,
    );
    notifyListeners();
  }

  void setBackgroundColor(Color? color) {
    _config = _config.copyWith(
      customBackgroundColor: color,
      clearCustomBackground: color == null,
    );
    notifyListeners();
  }

  void setButtonColor(Color? color) {
    _config = _config.copyWith(
      customButtonColor: color,
      clearCustomButton: color == null,
    );
    notifyListeners();
  }

  void setTextColor(Color? color) {
    _config = _config.copyWith(
      customTextColor: color,
      clearCustomText: color == null,
    );
    notifyListeners();
  }

  void setBorderRadius(double radius) {
    _config = _config.copyWith(borderRadius: radius);
    notifyListeners();
  }

  void setButtonHeight(double height) {
    _config = _config.copyWith(buttonHeight: height);
    notifyListeners();
  }

  void resetToDefaults() {
    _config = CustomizationConfig();
    notifyListeners();
  }
}
