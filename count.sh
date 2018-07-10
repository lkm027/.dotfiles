#! /bin/bash
# grep -o " it .*do" FILE | wc -l           This counts the number of scenarios per file

# FILES=/var/www/vhosts/groot.lucas.neadwerx.com/qa/wholefoods/spec/views/planogram/*
for f in /var/www/vhosts/groot.lucas.neadwerx.com/qa/wholefoods/spec/views/planogram/*
do
    count= grep -o " it .*do" $f | wc -l
    echo $f $count
    echo ${f##*/}
done
