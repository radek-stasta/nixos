wallpaper_dir="./wallpapers"
wallpapers=$(find "$wallpaper_dir" -type f | sort -R )

for wallpaper in $wallpapers; do
    preload_string+="preload = "$wallpaper"\n"
done

echo -en "$preload_string" > ../hypr/hyprpaper.conf