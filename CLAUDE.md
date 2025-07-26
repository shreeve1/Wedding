# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Structure

This is a wedding website template repository containing:

- Root directory - Main "Nuptial" wedding template (HTML5, Bootstrap 3, Sass/SCSS)
- `web-bundles/` - AI agent configurations and team templates (not part of the wedding site)

## Wedding Template Architecture

A responsive HTML5 wedding website template built with Bootstrap 3, jQuery, and Sass. Features parallax scrolling, countdown timer, RSVP functionality, and Google Maps integration.

### Key Files
- `index.html` - Main homepage with hero section, couple intro, countdown, RSVP form
- `gallery.html` - Photo gallery with lightbox functionality
- `when-where.html` - Wedding venue and timing with Google Maps
- `registry.html` - Gift registry information
- `sass/style.scss` - Main stylesheet with custom variables and Bootstrap overrides
- `js/main.js` - Custom JavaScript for animations, mobile menu, countdown timer
- `gulpfile.js` - Gulp 4 build configuration with live reload

### Development Commands

Install dependencies:
```bash
npm install
```

Start development server with live reload (runs on http://localhost:8040 or http://[your-ip]:8040):
```bash
gulp
# or
npx gulp
```

Individual build tasks:
```bash
gulp sass    # Compile SCSS to CSS with source maps
gulp js      # Concatenate and minify JavaScript files
gulp watch   # Watch for file changes
gulp connect # Start development server only
```

### Build System Architecture

**Gulp Pipeline:**
- **SCSS Compilation**: `sass/style.scss` → `css/style.css` (expanded format with source maps)
- **JavaScript Bundling**: 11 JS files concatenated in specific order → `dist/scripts.js` → `dist/scripts.min.js`
- **Live Reload**: File watching with automatic browser refresh
- **Development Server**: Express server with LiveReload integration

**JavaScript Load Order (critical for functionality):**
1. `jquery.min.js` - Core jQuery
2. `jquery.easing.1.3.js` - Animation easing
3. `bootstrap.min.js` - Bootstrap components
4. `jquery.waypoints.min.js` - Scroll-triggered animations
5. `sticky.js` - Sticky navigation
6. `jquery.stellar.min.js` - Parallax scrolling (disabled on mobile)
7. `hoverIntent.js` - Enhanced hover interactions
8. `superfish.js` - Dropdown menu system
9. `jquery.magnific-popup.min.js` - Lightbox functionality
10. `magnific-popup-options.js` - Popup configuration
11. `google_map.js` - Google Maps integration
12. `main.js` - Custom application logic

### Styling System

**Sass Architecture:**
- **Primary Brand Color**: `#DC143C` (wedding red theme)
- **Typography**: 'Open Sans' (body), 'Montez' (decorative headings)
- **Bootstrap Integration**: Imports Bootstrap 3 variables and mixins for customization
- **Custom Mixins**: Cross-browser transforms, transitions, flexbox utilities
- **Responsive Design**: Mobile-first with custom breakpoints

### Key Features

**Animations & Interactions:**
- Stellar.js parallax effects (disabled on mobile devices)
- Waypoint-triggered CSS animations with staggered timing
- Sticky navigation with scroll detection
- Off-canvas mobile menu with hamburger toggle

**Functionality:**
- Real-time countdown timer to wedding date (currently set to Dec 13, 2025)
- Google Maps integration with venue location
- RSVP form handling
- Lightbox photo gallery
- Device detection for optimized mobile experience

### Customization Points

**Wedding Details** (update in relevant files):
- Couple names: Currently "James & Alyssa"
- Wedding date: Set in `js/main.js` countdown timer
- Venue information: Update in `when-where.html`
- Google Maps coordinates: Currently set to Philippines, needs updating
- Photos: Replace images in `images/` directory

**Security Considerations:**
- Google Maps API key is embedded in `index.html` - consider environment variables for production
- RSVP form needs backend integration for form submission

## MCP Integration Guide

- **[Serena MCP](https://github.com/oraios/serena)**:  
  - Use Serena MCP for deep semantic code search, refactoring, symbol navigation, and large codebase analysis.
  - Typical Serena triggers:
    - Symbol search (e.g. “Find usages of `UserManager`”)
    - Refactor operations across many files or classes
    - Large, context-aware code summaries
    - Auto-indexing of the project after big changes
  - Preferred invocation:  
    - "use serena" in prompts requesting refactoring, symbol lookups, or semantic navigation.

- **[Context7 MCP](https://github.com/upstash/context7)**:  
  - Use Context7 MCP for injecting real-time, version-specific documentation and code examples into code-related prompts.
  - Typical Context7 triggers:
    - Library/framework-specific implementation requests  
    - API usage, up-to-date documentation, or code snippets
    - Avoiding outdated or hallucinated API calls
  - Preferred invocation:  
    - "use context7" in prompts needing latest third-party doc/examples, e.g. “Show a FastAPI authentication middleware. use context7”

## Additional Guidance for Claude

- Always prefer **Serena MCP** for anything related to project structure, refactoring, or complex multi-file code analysis.
- Always prefer **Context7 MCP** for library, SDK, or framework documentation and example code based on the latest official sources.
- If both MCPs could apply, prioritize semantic code analysis (Serena) for internal code navigation, or documentation injection (Context7) for API/library use cases.
- Do NOT include outdated documentation or hallucinated APIs—defer to **Context7** when up-to-date information is needed.