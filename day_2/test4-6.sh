#challenge 4 day 2
echo CHALLENGE 4
echo capitalize character c
dfx canister call day_2 capitalize_character '(99)'
echo capitalize character A
dfx canister call day_2 capitalize_character '(65)'

echo CHALLENGE 5
echo capitalize text the quick brown fox
dfx canister call day_2 capitalize_text '("the quick brown fox")'

echo CHALLENGE 6
echo is a inside the quick brown fox
dfx canister call day_2 is_inside '("the quick brown fox", 97)'
echo is c inside the quick brown fox
dfx canister call day_2 is_inside '("the quick brown fox", 99)'
