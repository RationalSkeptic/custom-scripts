#!/bin/bash
show_usage() {
  echo "Usage: $0 [options]"
  echo "Options:"
  echo "  -d, --directory DIR   Specify wallpaper directory (default: ~/Wallpapers)"
  echo "  -t, --theme THEME     Specify theme (default: dracula)"
  echo "  -h, --help            Display this help message"
  echo ""
  echo "Available themes may depend on your gowall version."
  echo "Common themes include: dracula, nord, gruvbox, solarized, catppuccin, etc."
  exit 1
}
# checking if gowall is installed...
if ! command -v gowall &>/dev/null; then
  echo "Error: gowall command not found. Please make sure it's installed."
  exit 1
fi
# Default values
WALLPAPER_DIR="$HOME/Wallpapers"
THEME="dracula"
# Parsing CLI args.
while [[ $# -gt 0 ]]; do
  case "$1" in
  -d | --directory)
    WALLPAPER_DIR="$2"
    shift 2
    ;;
  -t | --theme)
    THEME="$2"
    shift 2
    ;;
  -h | --help)
    show_usage
    ;;
  *)
    echo "Unknown option: $1"
    show_usage
    ;;
  esac
done
# Interactive mode if no arguments provided
if [ "$#" -eq 0 ] && [ "$WALLPAPER_DIR" = "$HOME/Wallpapers" ] && [ "$THEME" = "dracula" ]; then
  echo "Welcome to the Wallpaper Converter!"
  # Ask for directory
  read -p "Enter wallpaper directory (default: ~/Wallpapers): " user_dir
  if [ ! -z "$user_dir" ]; then
    WALLPAPER_DIR="$user_dir"
  fi
  # Ask for theme
  read -p "Enter theme to convert to (default: dracula): " user_theme
  if [ ! -z "$user_theme" ]; then
    THEME="$user_theme"
  fi
fi
# Check if the wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
  echo "Error: Wallpaper directory $WALLPAPER_DIR does not exist."
  exit 1
fi
# Expand tilde in path if needed
WALLPAPER_DIR="${WALLPAPER_DIR/#\~/$HOME}"
# Count total files
total_files=$(find "$WALLPAPER_DIR" -type f | wc -l)
echo "Found $total_files files in $WALLPAPER_DIR"
echo "Starting conversion to $THEME theme..."
# Counter for progress tracking
counter=0
# Process each file in the directory
find "$WALLPAPER_DIR" -type f | while read -r file; do
  # Get just the filename
  filename=$(basename "$file")
  # Increment and display progress
  ((counter++))
  echo "[$counter/$total_files] Converting: $filename"
  # Run the gowall command
  gowall convert "$file" -t "$THEME"
done
echo "Conversion complete! All wallpapers have been converted to the $THEME theme."
