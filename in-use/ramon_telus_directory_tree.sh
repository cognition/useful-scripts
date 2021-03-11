#!/bin/bash 

# Written By: Ramon Brooker <rbrooker@aeo3.ca>
# (c) 2021

# A little script for created a file for quickly looking for a file within a large directory 
#  


## Update your title and root directory you want to list

TITLE=" Telus REF File Tree -- ${TIMESTAMP}"
DIR="/home/rbrooker/CFS/Telus_Remote/"

if [[ ${DIR} == '' ]]; then 
    echo "Please add a directory" 
    exit 0
fi

TIMEFMT='%d/%m/%y%t%kh%M'
TIMESTAMP=$(date -u +%d/%m/%y\ %kh%M\ UTC)
FILENAME="file-list_$(date -u +%a)"


cat > /tmp/.treelist <<EOF

        File Tree 
Use for a Quick Visual Search 

EOF

tree -F -t  $DIR >> /tmp/.treelist

sed -i s/\*$//g /tmp/.treelist
sed -i '5 s/.*//' /tmp/.treelist



rm ${DIR}/file-list*

cp /tmp/.treelist ${DIR}/$FILENAME.txt

# tree -H "" -F -t -T "${TITLE}" -C --timefmt $TIMEFMT $DIR -o ${DIR}/$FILENAME.html


