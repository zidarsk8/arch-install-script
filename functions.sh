
function install_yaourt {
	local aa=$(pwd)
	echo "\npacman -Syy --noconfirm yajl wget binutils base-devel"
	$DRY || pacman -Syy --noconfirm yajl wget binutils base-devel

	echo "\ncd /tmp"
	$DRY || cd /tmp
	echo "\nwget https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz"
	$DRY || wget https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
	echo "\ntar -xpvf package-query.tar.gz"
	$DRY || tar -xpvf package-query.tar.gz
	echo "\ncd package-query"
	$DRY || cd package-query
	echo "\nmakepkg -i --asroot --noconfirm"
	$DRY || makepkg -i --asroot --noconfirm
	
	echo "\ncd /tmp"
	$DRY || cd /tmp
	echo "\nwget https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz"
	$DRY || wget https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
	echo "\ntar -xpvf yaourt.tar.gz"
	$DRY || tar -xpvf yaourt.tar.gz
	echo "\ncd yaourt"
	$DRY || cd yaourt
	echo "\nmakepkg -i --asroot --noconfirm"
	$DRY || makepkg -i --asroot --noconfirm

	echo "\ncd $aa"
	$DRY || cd $aa
}


