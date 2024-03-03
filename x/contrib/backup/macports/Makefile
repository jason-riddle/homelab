backup: backup-macports-installed-ports backup-macports-requested-ports

backup-macports-installed-ports:
	port -qv installed > macports-installed-ports.txt

backup-macports-requested-ports:
	port echo requested | cut -d ' ' -f 1 | uniq > macports-requested-ports.txt
