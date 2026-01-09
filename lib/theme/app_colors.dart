import 'package:flutter/material.dart';

class AppColors {
  // Main Theme Colors
  final Color primary;
  final Color background;
  final Color primaryAccent;

  // Card Colors
  final Color card;
  final Color playerCard;
  final Color deviceCardSelected;
  final Color playCard;
  final Color cardShadowPrimary;
  final Color cardShadowSecondary;

  // Text Colors
  final Color textLarge;
  final Color textMedium;
  final Color textSmall;
  final Color textTiny;
  final Color textMuted;

  // Player Text Colors
  final Color playerTitle;
  final Color playerSubtitle;
  final Color playerControls;

  // Navigation Colors
  final Color navBackground;
  final Color navIcon;
  final Color navIconSelected;
  final Color navTitle;

  // Control Colors
  final Color controlIcon;
  final Color controlActive;
  final Color controlInactive;
  final Color controlBackground;

  // Progress Colors
  final Color progressTrack;
  final Color progressThumb;
  final Color progressActive;
  final Color progressInactive;

  // Status Colors
  final Color statusSuccess;
  final Color statusError;
  final Color statusWarning;
  final Color statusInfo;

  // Button Colors
  final Color buttonPrimary;
  final Color buttonSecondary;
  final Color buttonDisabled;
  final Color buttonEnabled;
  final Color buttonPressed;
  final Color buttonTextPrimary;
  final Color buttonTextSecondary;
  final Color buttonTextDisabled;

  // Divider Colors
  final Color divider;
  final Color dividerStrong;
  final Color dividerWeak;

  AppColors({
    required this.primary,
    required this.background,
    required this.primaryAccent,
    required this.card,
    required this.playerCard,
    required this.deviceCardSelected,
    required this.playCard,
    required this.cardShadowPrimary,
    required this.cardShadowSecondary,
    required this.textLarge,
    required this.textMedium,
    required this.textSmall,
    required this.textTiny,
    required this.textMuted,
    required this.playerTitle,
    required this.playerSubtitle,
    required this.playerControls,
    required this.navBackground,
    required this.navIcon,
    required this.navIconSelected,
    required this.navTitle,
    required this.controlIcon,
    required this.controlActive,
    required this.controlInactive,
    required this.controlBackground,
    required this.progressTrack,
    required this.progressThumb,
    required this.progressActive,
    required this.progressInactive,
    required this.statusSuccess,
    required this.statusError,
    required this.statusWarning,
    required this.statusInfo,
    required this.buttonPrimary,
    required this.buttonSecondary,
    required this.buttonDisabled,
    required this.buttonEnabled,
    required this.buttonPressed,
    required this.buttonTextPrimary,
    required this.buttonTextSecondary,
    required this.buttonTextDisabled,
    required this.divider,
    required this.dividerStrong,
    required this.dividerWeak,
  });

  factory AppColors.light() {
    return AppColors(
      primary: const Color(0xFF116264),
      background: Colors.white,
      primaryAccent: const Color.fromARGB(255, 201, 225, 249),
      card: const Color(0xFFF3F7F9),
      playerCard: const Color(0xFF95B8B9),
      deviceCardSelected: const Color(0xFFC3D6D7),
      playCard: const Color(0xFF116264),
      cardShadowPrimary: const Color.fromARGB(33, 0, 0, 0),
      cardShadowSecondary: const Color.fromARGB(26, 0, 0, 0),
      textLarge: const Color(0xFF2B2B2F),
      textMedium: const Color(0xFF2B2B2B),
      textSmall: const Color(0xFF6C7072),
      textTiny: const Color(0xFF6C7072),
      textMuted: const Color(0xFF8A8A8A),
      playerTitle: const Color(0xFF2B2B2B),
      playerSubtitle: const Color(0xFF6C7072),
      playerControls: const Color(0xFF6C7072),
      navBackground: const Color(0xFFE8F1F2),
      navIcon: const Color(0xFF2B2B2B),
      navIconSelected: const Color(0xFF116264),
      navTitle: const Color(0xFF2B2B2B),
      controlIcon: const Color(0xFF6C7072),
      controlActive: const Color(0xFF116264),
      controlInactive: const Color(0xFFB5B5B5),
      controlBackground: const Color(0xFFF3F7F9),
      progressTrack: const Color.fromARGB(255, 255, 255, 255),
      progressThumb: const Color(0xFF116264),
      progressActive: const Color(0xFF116264),
      progressInactive: const Color(0xFFB5B5B5),
      statusSuccess: Colors.green,
      statusError: Colors.red,
      statusWarning: Colors.orange,
      statusInfo: const Color(0xFF116264),
      buttonPrimary: const Color(0xFF116264),
      buttonSecondary: Colors.white,
      buttonDisabled: const Color(0xFFB5B5B5),
      buttonEnabled: const Color(0xFF54999b),
      buttonPressed: const Color.fromARGB(255, 34, 109, 116),
      buttonTextPrimary: Colors.white,
      buttonTextSecondary: const Color(0xFF116264),
      buttonTextDisabled: const Color(0xFF8A8A8A),
      divider: const Color(0xFFEAEAEA),
      dividerStrong: const Color(0xFFB5B5B5),
      dividerWeak: const Color(0xFFEAEAEA),
    );
  }

  factory AppColors.dark() {
    return AppColors(
      primary: const Color(0xFF116264),
      background: const Color(0xFF000000),
      primaryAccent: const Color(0xffCADCDC),
      card: const Color(0xFF1E1E1E),
      playerCard: const Color(0xFF252525),
      deviceCardSelected: const Color(0xFF2D2D2D),
      playCard: const Color(0xFF000000),
      cardShadowPrimary: const Color.fromARGB(33, 255, 255, 255),
      cardShadowSecondary: const Color.fromARGB(26, 255, 255, 255),
      textLarge: Colors.white,
      textMedium: Colors.white,
      textSmall: const Color.fromARGB(179, 255, 255, 255),
      textTiny: const Color.fromARGB(128, 255, 255, 255),
      textMuted: const Color.fromARGB(128, 255, 255, 255),
      playerTitle: Colors.white,
      playerSubtitle: const Color.fromARGB(179, 255, 255, 255),
      playerControls: Colors.white,
      navBackground: const Color(0xFF000000),
      navIcon: Colors.white,
      navIconSelected: const Color(0xFFCFDCDD),
      navTitle: Colors.white,
      controlIcon: Colors.white,
      controlActive: const Color(0xFFCFDCDD),
      controlInactive: const Color.fromARGB(128, 255, 255, 255),
      controlBackground: const Color(0xFF2C2C2C),
      progressTrack: const Color(0xFF404040),
      progressThumb: Colors.white,
      progressActive: Colors.white,
      progressInactive: const Color.fromARGB(61, 255, 255, 255),
      statusSuccess: const Color(0xFF4CAF50),
      statusError: const Color(0xFFFF5252),
      statusWarning: Colors.orangeAccent,
      statusInfo: const Color(0xFFCFDCDD),
      buttonPrimary: const Color(0xFFCFDCDD),
      buttonSecondary: const Color(0xFF2C2C2C),
      buttonDisabled: const Color(0xFF404040),
      buttonEnabled: const Color(0xFF54999b),
      buttonPressed: const Color.fromARGB(255, 34, 109, 116),
      buttonTextPrimary: Colors.white,
      buttonTextSecondary: const Color(0xFFCFDCDD),
      buttonTextDisabled: const Color.fromARGB(128, 255, 255, 255),
      divider: const Color(0xFF404040),
      dividerStrong: const Color.fromARGB(51, 255, 255, 255),
      dividerWeak: const Color(0xFF404040),
    );
  }

  AppColors copyWith({
    Color? primary,
    Color? background,
    Color? primaryAccent,
    Color? card,
    Color? playerCard,
    Color? deviceCardSelected,
    Color? playCard,
    Color? cardShadowPrimary,
    Color? cardShadowSecondary,
    Color? textLarge,
    Color? textMedium,
    Color? textSmall,
    Color? textTiny,
    Color? textMuted,
    Color? playerTitle,
    Color? playerSubtitle,
    Color? playerControls,
    Color? navBackground,
    Color? navIcon,
    Color? navIconSelected,
    Color? navTitle,
    Color? controlIcon,
    Color? controlActive,
    Color? controlInactive,
    Color? controlBackground,
    Color? progressTrack,
    Color? progressThumb,
    Color? progressActive,
    Color? progressInactive,
    Color? statusSuccess,
    Color? statusError,
    Color? statusWarning,
    Color? statusInfo,
    Color? buttonPrimary,
    Color? buttonSecondary,
    Color? buttonDisabled,
    Color? buttonEnabled,
    Color? buttonPressed,
    Color? buttonTextPrimary,
    Color? buttonTextSecondary,
    Color? buttonTextDisabled,
    Color? divider,
    Color? dividerStrong,
    Color? dividerWeak,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      background: background ?? this.background,
      primaryAccent: primaryAccent ?? this.primaryAccent,
      card: card ?? this.card,
      playerCard: playerCard ?? this.playerCard,
      deviceCardSelected: deviceCardSelected ?? this.deviceCardSelected,
      playCard: playCard ?? this.playCard,
      cardShadowPrimary: cardShadowPrimary ?? this.cardShadowPrimary,
      cardShadowSecondary: cardShadowSecondary ?? this.cardShadowSecondary,
      textLarge: textLarge ?? this.textLarge,
      textMedium: textMedium ?? this.textMedium,
      textSmall: textSmall ?? this.textSmall,
      textTiny: textTiny ?? this.textTiny,
      textMuted: textMuted ?? this.textMuted,
      playerTitle: playerTitle ?? this.playerTitle,
      playerSubtitle: playerSubtitle ?? this.playerSubtitle,
      playerControls: playerControls ?? this.playerControls,
      navBackground: navBackground ?? this.navBackground,
      navIcon: navIcon ?? this.navIcon,
      navIconSelected: navIconSelected ?? this.navIconSelected,
      navTitle: navTitle ?? this.navTitle,
      controlIcon: controlIcon ?? this.controlIcon,
      controlActive: controlActive ?? this.controlActive,
      controlInactive: controlInactive ?? this.controlInactive,
      controlBackground: controlBackground ?? this.controlBackground,
      progressTrack: progressTrack ?? this.progressTrack,
      progressThumb: progressThumb ?? this.progressThumb,
      progressActive: progressActive ?? this.progressActive,
      progressInactive: progressInactive ?? this.progressInactive,
      statusSuccess: statusSuccess ?? this.statusSuccess,
      statusError: statusError ?? this.statusError,
      statusWarning: statusWarning ?? this.statusWarning,
      statusInfo: statusInfo ?? this.statusInfo,
      buttonPrimary: buttonPrimary ?? this.buttonPrimary,
      buttonSecondary: buttonSecondary ?? this.buttonSecondary,
      buttonDisabled: buttonDisabled ?? this.buttonDisabled,
      buttonEnabled: buttonEnabled ?? this.buttonEnabled,
      buttonPressed: buttonPressed ?? this.buttonPressed,
      buttonTextPrimary: buttonTextPrimary ?? this.buttonTextPrimary,
      buttonTextSecondary: buttonTextSecondary ?? this.buttonTextSecondary,
      buttonTextDisabled: buttonTextDisabled ?? this.buttonTextDisabled,
      divider: divider ?? this.divider,
      dividerStrong: dividerStrong ?? this.dividerStrong,
      dividerWeak: dividerWeak ?? this.dividerWeak,
    );
  }
}
