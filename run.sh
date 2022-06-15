
############################# 14_recover_public_ip.sh

# echo "Usage: $0 <wan-interface> <guest IP>"
# echo "Usage: $0 eth0 192.168.1.1"

interface_name=`ip link show | grep '2: ' | awk -F ' ' '{print substr($2, 1, length($2)-1)}'`
sudo iptables -t nat -D PREROUTING -i "$interface_name" -j DNAT --to 192.168.1.1


############################# 04_start_qemu_versatilepb.sh

# screen -d -m ./04_start_qemu_versatilepb.sh "$3" "$4" tap0 "$6"

# screen -d -m sudo qemu-system-mips -nographic \
# -M malta \
# -kernel /local/repository/qemu-images/vmlinux \
# -hda /local/repository/qemu-images/rootfs.ext2 \
# -append "root=/dev/hda console=tty0" \
# -net nic -net tap,ifname=tap0,script=no


sudo qemu-system-mips -nographic \
-M malta \
-kernel /local/repository/qemu-images/vmlinux \
-hda /local/repository/qemu-images/rootfs.ext2 \
-append "root=/dev/hda console=tty0" \
-net nic -net tap,ifname=tap0,script=no


# echo "Removing old SSH known_hosts ... "
# ssh-keygen -f "/root/.ssh/known_hosts" -R "192.168.1.1"

			# 31_relaunch_guest_versatilepb.sh
 		# 		14_recover_public_ip.sh
			# 	04_start_qemu_versatilepb.sh
			# 	11_test_guest_init_status.sh
			# 	12_install_raspmonitor.sh
			# 	13_replace_public_ip.sh

############################# 13_replace_public_ip.sh

# echo "Usage: $0 <wan-interface> <guest IP>"
# echo "Usage: $0 eth0 192.168.1.1"

sudo iptables -t nat -A PREROUTING -i "$interface_name" -j DNAT --to 192.168.1.1