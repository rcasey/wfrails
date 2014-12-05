#!/bin/bash
echo "Starting backup."
mysqldump -uroot wikifrac_dev > wikifrac_dev.sql
echo "Backup done."

