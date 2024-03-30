import os

# Dynamically find out the path to the current user's home directory
home_dir = os.path.expanduser('~')

# Define the path to the 'wallpapers' directory
wallpaper_dir = os.path.join(home_dir, '.config/hyprpaper/wallpapers')
# Define the path to the 'hyprpaper.conf' file
config_file = '../hypr/hyprpaper.conf'

# Open the config file in append mode
with open(config_file, 'a') as file:
    # Walk through the wallpaper directory
    for root, dirs, files in os.walk(wallpaper_dir):
        # Iterate through each file
        for name in files:
            # Create the preload line
            preload_line = f'preload = {os.path.join(root, name)}\n'
            # Write the line to the file
            file.write(preload_line)