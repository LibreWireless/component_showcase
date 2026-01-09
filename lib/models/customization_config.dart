import 'package:flutter/material.dart';

class CustomizationConfig {
  final String fontFamily;
  final double fontSizeMultiplier;
  final Color? customPrimaryColor;
  final Color? customBackgroundColor;
  final Color? customButtonColor;
  final Color? customTextColor;
  final bool isDarkMode;
  final double borderRadius;
  final double buttonHeight;

  CustomizationConfig({
    this.fontFamily = 'Inter',
    this.fontSizeMultiplier = 1.0,
    this.customPrimaryColor,
    this.customBackgroundColor,
    this.customButtonColor,
    this.customTextColor,
    this.isDarkMode = false,
    this.borderRadius = 25.0,
    this.buttonHeight = 48.0,
  });

  CustomizationConfig copyWith({
    String? fontFamily,
    double? fontSizeMultiplier,
    Color? customPrimaryColor,
    Color? customBackgroundColor,
    Color? customButtonColor,
    Color? customTextColor,
    bool? isDarkMode,
    double? borderRadius,
    double? buttonHeight,
    bool clearCustomPrimary = false,
    bool clearCustomBackground = false,
    bool clearCustomButton = false,
    bool clearCustomText = false,
  }) {
    return CustomizationConfig(
      fontFamily: fontFamily ?? this.fontFamily,
      fontSizeMultiplier: fontSizeMultiplier ?? this.fontSizeMultiplier,
      customPrimaryColor: clearCustomPrimary ? null : (customPrimaryColor ?? this.customPrimaryColor),
      customBackgroundColor: clearCustomBackground ? null : (customBackgroundColor ?? this.customBackgroundColor),
      customButtonColor: clearCustomButton ? null : (customButtonColor ?? this.customButtonColor),
      customTextColor: clearCustomText ? null : (customTextColor ?? this.customTextColor),
      isDarkMode: isDarkMode ?? this.isDarkMode,
      borderRadius: borderRadius ?? this.borderRadius,
      buttonHeight: buttonHeight ?? this.buttonHeight,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fontFamily': fontFamily,
      'fontSizeMultiplier': fontSizeMultiplier,
      'customPrimaryColor': customPrimaryColor?.value,
      'customBackgroundColor': customBackgroundColor?.value,
      'customButtonColor': customButtonColor?.value,
      'customTextColor': customTextColor?.value,
      'isDarkMode': isDarkMode,
      'borderRadius': borderRadius,
      'buttonHeight': buttonHeight,
    };
  }

  factory CustomizationConfig.fromJson(Map<String, dynamic> json) {
    return CustomizationConfig(
      fontFamily: json['fontFamily'] ?? 'Inter',
      fontSizeMultiplier: json['fontSizeMultiplier'] ?? 1.0,
      customPrimaryColor: json['customPrimaryColor'] != null 
          ? Color(json['customPrimaryColor']) 
          : null,
      customBackgroundColor: json['customBackgroundColor'] != null 
          ? Color(json['customBackgroundColor']) 
          : null,
      customButtonColor: json['customButtonColor'] != null 
          ? Color(json['customButtonColor']) 
          : null,
      customTextColor: json['customTextColor'] != null 
          ? Color(json['customTextColor']) 
          : null,
      isDarkMode: json['isDarkMode'] ?? false,
      borderRadius: json['borderRadius'] ?? 25.0,
      buttonHeight: json['buttonHeight'] ?? 48.0,
    );
  }
}
