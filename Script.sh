PS3='Make your choice : '
echo "================= CHANGE YOUR INTERFACES ================="
echo "NOTE: CASE ARE SENSITIVE, WATCH FOR UPPER AND LOWER CASE"
echo
menu=("1. Ganti Wallpaper" "2. Ganti Icon" "3. Ganti Tema" "4. Menambah User" "Quit")
select opt in "${menu[0]}"

do
	case $opt in
		"${menu[0]}")
		echo "Masukkan file(ex: /rootDownloads/aq61.png) : "
		read wp
		while [ ! -f $wp ]
			do
			echo "Cannot find path to file"
			read wp
			done
		gsetting set org.gnome.desktop.background picture-uri "file://$wp";;

		"${menu[1]}")
		echo "Masukkan file/folder yang ingin diganti(ex: /root/test) : "
		read wp
		echo "Masukkan file icon(ex: /usr/share/pixmaps/gnome-spider.png) : "
		read icon
		gvfs-set-attribute $wp metadata::custom-icon "file://$icon"
		echo "if nothing happened, the directory you wrote is wrong"
		;;

		"${menu[2]}")
		echo "Masukkan nama tema dari direktori /usr/share/themes (ex: Adwaita) :"
		read theme
		gsettings set org.gnome.desktop.interface gtk-theme "$theme"
		;;

		"Quit")
		break
		;;
		*) echo invalid menu;;
	esac
done

