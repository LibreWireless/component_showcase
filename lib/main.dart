import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers/customization_provider.dart';
import 'widgets/control_panel.dart';
import 'screens/button_showcase.dart';
import 'screens/typography_showcase.dart';
import 'screens/colors_showcase.dart';
import 'screens/cards_showcase.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CustomizationProvider(),
      child: const LibreComponentShowcase(),
    ),
  );
}

class LibreComponentShowcase extends StatelessWidget {
  const LibreComponentShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomizationProvider>(
      builder: (context, provider, child) {
        final colors = provider.customizedColors;
        final config = provider.config;

        return MaterialApp(
          title: 'Libre App Component Showcase',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: config.isDarkMode ? Brightness.dark : Brightness.light,
            scaffoldBackgroundColor: colors.background,
            primaryColor: colors.primary,
            textTheme: GoogleFonts.getTextTheme(config.fontFamily).apply(
              bodyColor: colors.textLarge,
              displayColor: colors.textLarge,
            ),
          ),
          home: const ShowcaseHome(),
        );
      },
    );
  }
}

class ShowcaseHome extends StatefulWidget {
  const ShowcaseHome({Key? key}) : super(key: key);

  @override
  State<ShowcaseHome> createState() => _ShowcaseHomeState();
}

class _ShowcaseHomeState extends State<ShowcaseHome> {
  int _selectedIndex = 0;
  bool _isPanelVisible = true;

  final List<_NavItem> _navItems = [
    _NavItem('Buttons', Icons.smart_button, const ButtonShowcase()),
    _NavItem('Typography', Icons.text_fields, const TypographyShowcase()),
    _NavItem('Colors', Icons.palette, const ColorsShowcase()),
    _NavItem('Cards', Icons.view_agenda, const CardsShowcase()),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomizationProvider>(
      builder: (context, provider, child) {
        final colors = provider.customizedColors;
        final config = provider.config;

        return Scaffold(
          backgroundColor: colors.background,
          body: Row(
            children: [
              // Left Navigation
              Container(
                width: 240,
                decoration: BoxDecoration(
                  color: colors.navBackground,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(2, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Container(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Libre App',
                            style: GoogleFonts.getFont(
                              config.fontFamily,
                              fontSize: (24 * config.fontSizeMultiplier).toDouble(),
                              fontWeight: FontWeight.bold,
                              color: colors.primary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Component Showcase',
                            style: GoogleFonts.getFont(
                              config.fontFamily,
                              fontSize: (12 * config.fontSizeMultiplier).toDouble(),
                              color: colors.textSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    // Navigation Items
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: _navItems.length,
                        itemBuilder: (context, index) {
                          final item = _navItems[index];
                          final isSelected = _selectedIndex == index;
                          return _buildNavItem(
                            item.label,
                            item.icon,
                            isSelected,
                            () => setState(() => _selectedIndex = index),
                            colors,
                            config,
                          );
                        },
                      ),
                    ),
                    // Footer
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(height: 1),
                          const SizedBox(height: 16),
                          Text(
                            'Interactive UI Style Guide',
                            style: GoogleFonts.getFont(
                              config.fontFamily,
                              fontSize: (12 * config.fontSizeMultiplier).toDouble(),
                              color: colors.textMuted,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'v1.0.0',
                            style: GoogleFonts.getFont(
                              config.fontFamily,
                              fontSize: (10 * config.fontSizeMultiplier).toDouble(),
                              color: colors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Main Content
              Expanded(
                child: _navItems[_selectedIndex].screen,
              ),
              // Right Control Panel
              if (_isPanelVisible) const ControlPanel(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => setState(() => _isPanelVisible = !_isPanelVisible),
            backgroundColor: colors.buttonPrimary,
            child: Icon(
              _isPanelVisible ? Icons.close : Icons.tune,
              color: colors.buttonTextPrimary,
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(
    String label,
    IconData icon,
    bool isSelected,
    VoidCallback onTap,
    dynamic colors,
    dynamic config,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? colors.primary.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? Border.all(color: colors.primary, width: 2)
              : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? colors.navIconSelected : colors.navIcon,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: GoogleFonts.getFont(
                config.fontFamily,
                fontSize: (14 * config.fontSizeMultiplier).toDouble(),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? colors.navIconSelected : colors.navIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem {
  final String label;
  final IconData icon;
  final Widget screen;

  _NavItem(this.label, this.icon, this.screen);
}
