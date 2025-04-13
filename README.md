# RationalSkeptic's Custom Shell Scripts :)

## `convert_wallpapers.sh`
**Requirements**:[gowall](https://achno.github.io/gowall-docs/)
+ This shell-script converts all the wallpapers present in a directory into your choice of colorscheme.
+ Visit gowall's documentation website to find out the various colorscheme offered by them.
+ The converted wallpapers are stored in `~/Pictures/gowall` directory.
+ You can specify the wallpaper directory and the colorscheme. 

### How to run?

1. Clone the repository into a directory (Here,`~/custom-scripts`).
  ```
  git clone https://github.com/RationalSkeptic/custom-scripts.git ~/custom-scripts
  ```

2. Make `convert_wallpapers.sh` executable
  ```
  chmod +x ~/path/to/convert_wallpapers.sh
  ```

3. Run the script :)
  ```
  ./convert_wallpapers.sh
  ```

The script will prompt for input. 

#### Optional
You can also run the script this way: 
```
# Specify the options directly
./convert_wallpapers.sh --directory ~/path/to/wallpapers --theme theme_name

# Use Short options
./convert_wallpapers.sh --d ~/path/to/wallpapers --t theme_name






