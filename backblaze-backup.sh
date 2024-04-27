hostname=$(hostname)

backblaze-b2 sync --delete /Storage/backups b2://BENVER-proxmox-backup/$hostname
#backblaze-b2 sync --threads 1 --delete /mnt/Storage/ben b2://BENVER-NAS-backup/ben
