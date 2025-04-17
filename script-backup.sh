BACKUP_DATE=$(date +%Y-%m-%d)
BORG_REPO="Backup"
borg create --stats --progress $BORG_REPO::backup-$BACKUP_DATE /etc /home
borg prune -v --keep-daily=7 --keep-weekly=4 --keep-monthly=6 $BORG_REPO
