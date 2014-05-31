
function install_yaourt {
	local aa=$(pwd)
	pacman -Syy --noconfirm yajl wget binutils base-devel

	cd /tmp

	wget https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
	tar -xpvf package-query.tar.gz
	cd package-query
	makepkg -i --asroot --noconfirm
	
	cd /tmp

	wget https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
	tar -xpvf yaourt.tar.gz
	cd yaourt
	makepkg -i --asroot --noconfirm

	cd $aa
}

function clear_disk {

    if [[ "$#" -lt 1 ]]; then
        echo "usage: clear_disk 'sdX' [blocks]"
        return 1
    fi

    local disk=/dev/$1
    
    local clear_blocks=2000000
    [[ "$#" -eq 2 ]] && local clear_blocks=$2

    dd if=/dev/zero of=$disk bs=512 count=$clear_blocks
    dd if=/dev/zero of=$disk bs=512 seek=$(( $(blockdev --getsz $disk) - $clear_blocks )) count=$clear_blocks

}




