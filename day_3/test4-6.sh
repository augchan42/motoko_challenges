#DAY 3 challenge 4
echo CHALLENGE 4
echo nat_opt_to_nat number 4 and number 1
dfx canister call day_3 nat_opt_to_nat '(opt 4, 1)'
echo nat_opt_to_nat number null  and number 1
dfx canister call day_3 nat_opt_to_nat '(null, 1)'

echo challenge 5
echo day_of_the_week 7
dfx canister call day_3 day_of_the_week '(7)'
echo day_of_the_week 8
dfx canister call day_3 day_of_the_week '(8)'

echo CHALLENGE 6
echo populate_array opt 3,2,1,null,4
dfx canister call day_3 populate_array '(vec {opt 3;opt 2;opt 1;null;opt 4})'


