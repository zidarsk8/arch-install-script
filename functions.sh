function install_yaourt {
    local aa=$(pwd)
    pacman -Syy --noconfirm wget yajl

    cd /tmp

    wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz
    tar -xpvf package-query.tar.gz
    chmod 777 package-query
    cd package-query
    sudo -u nobody makepkg --noconfirm
    pacman --noconfirm -U package-query*.xz

    
    cd /tmp

    wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz
    tar -xpvf yaourt.tar.gz
    chmod 777 yaourt
    cd yaourt
    sudo -u nobody makepkg --noconfirm
    pacman --noconfirm -U yaourt*-any.pkg.tar.xz

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
