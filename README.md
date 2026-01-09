# Libre App Component Showcase

An interactive web-based UI component showcase and style guide for the Libre App. This tool allows customers and stakeholders to visualize and customize UI components in real-time, experimenting with different colors, fonts, and styling options.

![Libre App Component Showcase](https://img.shields.io/badge/Flutter-Web-02569B?logo=flutter)
![Version](https://img.shields.io/badge/version-1.0.0-blue)

## 🎯 Purpose

This showcase application enables:
- **Interactive Component Preview**: See all UI components (buttons, text, cards, colors) in one place
- **Real-time Customization**: Change colors, fonts, and styling properties on the fly
- **Customer Collaboration**: Share with clients to get feedback on design choices
- **Design System Documentation**: Serve as a living style guide for developers
- **Export Configurations**: Save and share customization settings

## ✨ Features

### 🎨 Interactive Components
- **Buttons**: Primary, secondary, disabled, animated, and icon buttons
- **Typography**: All text styles with different weights and sizes
- **Colors**: Complete color palette for light and dark themes
- **Cards**: Various card types including device cards and player cards

### 🎛️ Customization Controls
- **Theme Toggle**: Switch between light and dark modes
- **Font Family**: Choose from 7 popular fonts (Inter, Roboto, Poppins, etc.)
- **Font Size**: Adjust from 70% to 150% of base size
- **Color Pickers**: Customize primary, background, button, and text colors
- **Button Properties**: Adjust border radius and button height
- **Reset Function**: Return to default settings instantly
- **Export Config**: Generate configuration code to share

### 📱 Responsive Design
- Collapsible control panel
- Clean navigation sidebar
- Optimized for desktop and tablet viewing

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.10.0 or higher)
- Web browser (Chrome, Firefox, Safari, or Edge)

### Installation

1. **Navigate to the project directory:**
```bash
cd component_showcase
```

2. **Install dependencies:**
```bash
flutter pub get
```

3. **Run the application:**
```bash
flutter run -d chrome
```

Or for any available web browser:
```bash
flutter run -d web-server
```

## 🌐 Deployment

### Build for Production

```bash
flutter build web --release
```

The built files will be in the `build/web` directory.

### Deploy Options

#### 1. **GitHub Pages** (Free)
```bash
# Build the app
flutter build web --release --base-href "/component_showcase/"

# Deploy to GitHub Pages (example using gh-pages)
cd build/web
git init
git add .
git commit -m "Deploy to GitHub Pages"
git remote add origin https://github.com/yourusername/component_showcase.git
git push -f origin main:gh-pages
```

Access at: `https://yourusername.github.io/component_showcase/`

#### 2. **Netlify** (Free)
- Drag and drop the `build/web` folder to Netlify
- Or connect your GitHub repository for automatic deployments

#### 3. **Firebase Hosting** (Free)
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize Firebase
firebase init hosting

# Deploy
firebase deploy
```

#### 4. **Vercel** (Free)
```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
cd build/web
vercel
```

## 📖 Usage Guide

### For Customers/Clients

1. **Browse Components**: Use the left sidebar to navigate between different component categories
2. **Customize**: Use the right panel to adjust colors, fonts, and other properties
3. **Experiment**: Try different combinations to see what works best
4. **Export**: Click "Export Config" to get the configuration values
5. **Share Feedback**: Screenshot or share the URL with your customizations

### For Developers

1. **Reference**: Use this as a reference for implementing components
2. **Testing**: Test different color combinations and accessibility
3. **Documentation**: Share with team members as living documentation
4. **Integration**: Export configurations and integrate into your main app

## 🎨 Customization Options

### Available Controls

| Control | Description | Range/Options |
|---------|-------------|---------------|
| Theme Mode | Light/Dark toggle | Light, Dark |
| Font Family | Typography selection | Inter, Roboto, Poppins, Lato, Montserrat, Open Sans, Raleway |
| Font Size | Scale multiplier | 70% - 150% |
| Primary Color | Main brand color | Color picker |
| Background Color | App background | Color picker |
| Button Color | Button fill color | Color picker |
| Text Color | Primary text color | Color picker |
| Border Radius | Button corner radius | 0px - 50px |
| Button Height | Button vertical size | 32px - 72px |

## 📁 Project Structure

```
component_showcase/
├── lib/
│   ├── main.dart                          # Main app entry point
│   ├── models/
│   │   └── customization_config.dart      # Configuration model
│   ├── providers/
│   │   └── customization_provider.dart    # State management
│   ├── screens/
│   │   ├── button_showcase.dart           # Button components
│   │   ├── typography_showcase.dart       # Text styles
│   │   ├── colors_showcase.dart           # Color palette
│   │   └── cards_showcase.dart            # Card components
│   ├── theme/
│   │   └── app_colors.dart                # Color definitions
│   └── widgets/
│       └── control_panel.dart             # Customization controls
├── web/
│   └── index.html                         # Web entry point
├── pubspec.yaml                           # Dependencies
└── README.md                              # This file
```

## 🔧 Dependencies

- `flutter`: SDK
- `google_fonts`: ^6.1.0 - Font customization
- `flutter_colorpicker`: ^1.0.3 - Color picker widget
- `provider`: ^6.1.1 - State management
- `url_launcher`: ^6.2.2 - External links

## 🎯 Use Cases

### 1. Client Presentations
Share the live URL with clients to demonstrate design flexibility and gather feedback on color schemes and typography choices.

### 2. Design System Documentation
Use as a living style guide that developers can reference when building new features.

### 3. Accessibility Testing
Test color contrast ratios and readability with different text sizes and color combinations.

### 4. Branding Exploration
Experiment with different brand colors to see how they affect the entire UI without modifying code.

### 5. Developer Onboarding
Help new team members understand the component library and design system quickly.

## 🤝 Sharing with Customers

### Option 1: Live URL
Deploy to a hosting service and share the URL:
```
https://your-showcase.netlify.app
```

### Option 2: Screen Recording
Record a video walkthrough showing the customization features:
- Use tools like Loom, QuickTime, or OBS
- Demonstrate changing colors, fonts, and seeing results in real-time

### Option 3: Screenshots + Config Export
- Take screenshots of different configurations
- Export the configuration JSON
- Share in a PDF or presentation

## 🔐 Configuration Export Format

When you click "Export Config", you'll get data like:

```
fontFamily: Roboto
fontSizeMultiplier: 1.2
customPrimaryColor: 4280361249
customBackgroundColor: null
customButtonColor: 4282532475
customTextColor: null
isDarkMode: false
borderRadius: 16.0
buttonHeight: 48.0
```

## 📝 Notes

- This is a **showcase/demo application** - it doesn't connect to any backend
- All customizations are temporary and reset on page refresh
- For persistent configurations, implement local storage or backend integration
- Optimized for desktop/tablet viewing (min width: 1024px recommended)

## 🐛 Troubleshooting

### Issue: Fonts not loading
**Solution**: Ensure you have internet connection as Google Fonts loads from CDN

### Issue: Colors look different
**Solution**: Check your monitor color calibration and browser color profile

### Issue: App is slow
**Solution**: Use Chrome or Edge for best performance with Flutter Web

## 📄 License

This component showcase is part of the Libre App project.

## 🙏 Acknowledgments

- Based on the Libre App design system
- Built with Flutter Web
- Uses Google Fonts for typography
- Color picker by flutter_colorpicker

---

**Built with ❤️ for the Libre App project**

For questions or feedback, please contact the development team.
