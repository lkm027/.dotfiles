#! /bin/bash
# grep -o " it .*do" FILE | wc -l           This counts the number of scenarios per file

# FILES=/var/www/vhosts/groot.lucas.neadwerx.com/qa/wholefoods/spec/views/planogram/*
# file_path=$1
# for f in /var/www/vhosts/groot.lucas.neadwerx.com/qa/wholefoods/spec/views/planogram/*
total_test_count=0
for f in $( find /var/www/vhosts/groot.lucas.neadwerx.com/qa/thd/spec/views -name '*.rb' );
do
    filename=${f##*/}
    if [[ $filename = *"config"* ]]
    then
        continue
    fi

    if [[ $filename = *"spec"* ]]
    then
        # Count the number of occurrences of it cases
        it_count= grep -o " it .*do" $f | wc -l
        scenario_count= grep -o " scenario .*do" $f | wc -l
        file_count=$((it_count+scenario_count))
        total_test_count=$((total_test_count+file_count))
        # echo $f $file_count
        # echo ${f##*/} $
    fi


done
echo Total count is $total_test_count
