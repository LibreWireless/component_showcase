import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import '../providers/customization_provider.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomizationProvider>(
      builder: (context, provider, child) {
        final colors = provider.customizedColors;
        final config = provider.config;

        return Container(
          width: 320,
          color: colors.card,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Header
              Text(
                'Customize',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: colors.textLarge,
                ),
              ),
              const SizedBox(height: 24),

              // Theme Mode Toggle
              _buildSectionTitle('Theme', colors),
              SwitchListTile(
                title: Text(
                  'Dark Mode',
                  style: TextStyle(color: colors.textMedium),
                ),
                value: config.isDarkMode,
                onChanged: (_) => provider.toggleDarkMode(),
                activeColor: colors.primary,
              ),
              const Divider(height: 32),

              // Font Family
              _buildSectionTitle('Font Family', colors),
              _buildFontFamilySelector(provider, colors),
              const SizedBox(height: 16),

              // Font Size
              _buildSectionTitle('Font Size', colors),
              Text(
                '${(config.fontSizeMultiplier * 100).toInt()}%',
                style: TextStyle(color: colors.textSmall),
              ),
              Slider(
                value: config.fontSizeMultiplier,
                min: 0.7,
                max: 1.5,
                divisions: 16,
                label: '${(config.fontSizeMultiplier * 100).toInt()}%',
                onChanged: provider.setFontSizeMultiplier,
                activeColor: colors.primary,
              ),
              const Divider(height: 32),

              // Colors
              _buildSectionTitle('Colors', colors),
              const SizedBox(height: 8),
              _buildColorPicker(
                context,
                'Primary Color',
                config.customPrimaryColor ?? colors.primary,
                (color) => provider.setPrimaryColor(color),
                () => provider.setPrimaryColor(null),
                colors,
              ),
              _buildColorPicker(
                context,
                'Background Color',
                config.customBackgroundColor ?? colors.background,
                (color) => provider.setBackgroundColor(color),
                () => provider.setBackgroundColor(null),
                colors,
              ),
              _buildColorPicker(
                context,
                'Button Color',
                config.customButtonColor ?? colors.buttonPrimary,
                (color) => provider.setButtonColor(color),
                () => provider.setButtonColor(null),
                colors,
              ),
              _buildColorPicker(
                context,
                'Text Color',
                config.customTextColor ?? colors.textLarge,
                (color) => provider.setTextColor(color),
                () => provider.setTextColor(null),
                colors,
              ),
              const Divider(height: 32),

              // Button Properties
              _buildSectionTitle('Button Properties', colors),
              const SizedBox(height: 8),
              Text(
                'Border Radius: ${config.borderRadius.toInt()}px',
                style: TextStyle(color: colors.textSmall),
              ),
              Slider(
                value: config.borderRadius,
                min: 0,
                max: 50,
                divisions: 50,
                onChanged: provider.setBorderRadius,
                activeColor: colors.primary,
              ),
              const SizedBox(height: 16),
              Text(
                'Button Height: ${config.buttonHeight.toInt()}px',
                style: TextStyle(color: colors.textSmall),
              ),
              Slider(
                value: config.buttonHeight,
                min: 32,
                max: 72,
                divisions: 40,
                onChanged: provider.setButtonHeight,
                activeColor: colors.primary,
              ),
              const Divider(height: 32),

              // Actions
              ElevatedButton.icon(
                onPressed: provider.resetToDefaults,
                icon: const Icon(Icons.refresh),
                label: const Text('Reset to Defaults'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.buttonPrimary,
                  foregroundColor: colors.buttonTextPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () => _showExportDialog(context, provider),
                icon: const Icon(Icons.code),
                label: const Text('Export Config'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: colors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title, dynamic colors) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: colors.textLarge,
        ),
      ),
    );
  }

  Widget _buildFontFamilySelector(CustomizationProvider provider, dynamic colors) {
    final fonts = [
      'Inter',
      'Roboto',
      'Poppins',
      'Lato',
      'Montserrat',
      'Open Sans',
      'Raleway',
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: colors.divider),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: provider.config.fontFamily,
          isExpanded: true,
          style: TextStyle(color: colors.textMedium, fontSize: 14),
          dropdownColor: colors.card,
          items: fonts.map((font) {
            return DropdownMenuItem(
              value: font,
              child: Text(font),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) provider.setFontFamily(value);
          },
        ),
      ),
    );
  }

  Widget _buildColorPicker(
    BuildContext context,
    String label,
    Color currentColor,
    Function(Color) onColorChanged,
    VoidCallback onReset,
    dynamic colors,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(color: colors.textMedium),
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  Color tempColor = currentColor;
                  return AlertDialog(
                    title: Text('Pick $label'),
                    content: SingleChildScrollView(
                      child: ColorPicker(
                        pickerColor: currentColor,
                        onColorChanged: (color) => tempColor = color,
                        pickerAreaHeightPercent: 0.8,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          onColorChanged(tempColor);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Select'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: currentColor,
                border: Border.all(color: colors.divider, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.refresh, size: 20, color: colors.controlIcon),
            onPressed: onReset,
            tooltip: 'Reset to default',
          ),
        ],
      ),
    );
  }

  void _showExportDialog(BuildContext context, CustomizationProvider provider) {
    final config = provider.config.toJson();
    final configString = config.entries
        .map((e) => '${e.key}: ${e.value}')
        .join('\n');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Configuration Export'),
          content: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: SelectableText(
                configString,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12,
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
