import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/customization_provider.dart';

class ButtonShowcase extends StatefulWidget {
  const ButtonShowcase({Key? key}) : super(key: key);

  @override
  State<ButtonShowcase> createState() => _ButtonShowcaseState();
}

class _ButtonShowcaseState extends State<ButtonShowcase> {
  bool _isAnimating = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomizationProvider>(
      builder: (context, provider, child) {
        final colors = provider.customizedColors;
        final config = provider.config;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle('Buttons', colors, config),
              const SizedBox(height: 32),

              // Primary Buttons
              _buildSectionTitle('Primary Buttons', colors, config),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildButton(
                    'Primary Button',
                    colors.buttonPrimary,
                    colors.buttonTextPrimary,
                    config,
                  ),
                  _buildButton(
                    'Enabled',
                    colors.buttonEnabled,
                    colors.buttonTextPrimary,
                    config,
                  ),
                  _buildButton(
                    'Pressed',
                    colors.buttonPressed,
                    colors.buttonTextPrimary,
                    config,
                    onPressed: null,
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Secondary Buttons
              _buildSectionTitle('Secondary Buttons', colors, config),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildOutlinedButton(
                    'Secondary',
                    colors.buttonTextSecondary,
                    config,
                  ),
                  _buildOutlinedButton(
                    'Outlined',
                    colors.primary,
                    config,
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Disabled State
              _buildSectionTitle('Disabled State', colors, config),
              const SizedBox(height: 16),
              _buildButton(
                'Disabled',
                colors.buttonDisabled,
                colors.buttonTextDisabled,
                config,
                onPressed: null,
              ),
              const SizedBox(height: 32),

              // Animated Button
              _buildSectionTitle('Animated Button', colors, config),
              const SizedBox(height: 16),
              _buildAnimatedButton(colors, config),
              const SizedBox(height: 32),

              // Icon Buttons
              _buildSectionTitle('Icon Buttons', colors, config),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildIconButton(
                    Icons.play_arrow,
                    colors.buttonPrimary,
                    colors.buttonTextPrimary,
                    config,
                  ),
                  _buildIconButton(
                    Icons.pause,
                    colors.controlActive,
                    Colors.white,
                    config,
                  ),
                  _buildIconButton(
                    Icons.skip_next,
                    colors.buttonEnabled,
                    Colors.white,
                    config,
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Button Sizes
              _buildSectionTitle('Button Sizes', colors, config),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildButton(
                    'Small Button',
                    colors.buttonPrimary,
                    colors.buttonTextPrimary,
                    config.copyWith(buttonHeight: 36),
                  ),
                  const SizedBox(height: 12),
                  _buildButton(
                    'Medium Button',
                    colors.buttonPrimary,
                    colors.buttonTextPrimary,
                    config.copyWith(buttonHeight: 48),
                  ),
                  const SizedBox(height: 12),
                  _buildButton(
                    'Large Button',
                    colors.buttonPrimary,
                    colors.buttonTextPrimary,
                    config.copyWith(buttonHeight: 60),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTitle(String text, dynamic colors, dynamic config) {
    return Text(
      text,
      style: GoogleFonts.getFont(
        config.fontFamily,
        fontSize: (32 * config.fontSizeMultiplier).toDouble(),
        fontWeight: FontWeight.bold,
        color: colors.textLarge,
      ),
    );
  }

  Widget _buildSectionTitle(String text, dynamic colors, dynamic config) {
    return Text(
      text,
      style: GoogleFonts.getFont(
        config.fontFamily,
        fontSize: (20 * config.fontSizeMultiplier).toDouble(),
        fontWeight: FontWeight.w600,
        color: colors.textLarge,
      ),
    );
  }

  Widget _buildButton(
    String text,
    Color backgroundColor,
    Color textColor,
    dynamic config, {
    VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        minimumSize: Size(120, config.buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(config.borderRadius),
        ),
        elevation: 2,
      ),
      child: Text(
        text,
        style: GoogleFonts.getFont(
          config.fontFamily,
          fontSize: (16 * config.fontSizeMultiplier).toDouble(),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildOutlinedButton(
    String text,
    Color color,
    dynamic config,
  ) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        side: BorderSide(color: color, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        minimumSize: Size(120, config.buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(config.borderRadius),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.getFont(
          config.fontFamily,
          fontSize: (16 * config.fontSizeMultiplier).toDouble(),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildIconButton(
    IconData icon,
    Color backgroundColor,
    Color iconColor,
    dynamic config,
  ) {
    return Container(
      width: config.buttonHeight,
      height: config.buttonHeight,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(config.borderRadius),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon),
        color: iconColor,
        iconSize: 24,
        onPressed: () {},
      ),
    );
  }

  Widget _buildAnimatedButton(dynamic colors, dynamic config) {
    return GestureDetector(
      onTap: () {
        setState(() => _isAnimating = true);
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (mounted) setState(() => _isAnimating = false);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: config.buttonHeight,
        width: _isAnimating ? config.buttonHeight : 200,
        decoration: BoxDecoration(
          color: _isAnimating ? colors.buttonPressed : colors.buttonPrimary,
          borderRadius: BorderRadius.circular(
            _isAnimating ? config.buttonHeight / 2 : config.borderRadius,
          ),
          boxShadow: [
            BoxShadow(
              color: colors.buttonPrimary.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: _isAnimating
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                'Animate',
                style: GoogleFonts.getFont(
                  config.fontFamily,
                  fontSize: (16 * config.fontSizeMultiplier).toDouble(),
                  fontWeight: FontWeight.w500,
                  color: colors.buttonTextPrimary,
                ),
              ),
      ),
    );
  }
}
