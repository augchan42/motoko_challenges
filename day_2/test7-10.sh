#challenge 7 day 2
echo CHALLENGE 7
echo trim whitespace on " blah    "
dfx canister call day_2 trim_whitespace '(" blah     ")'

echo CHALLENGE 8
echo find duplicated char on "hello"
dfx canister call day_2 duplicated_character '("hello")'
echo find duplicated char on "no repat"
dfx canister call day_2 duplicated_character '("no repat")'

echo CHALLENGE 9
echo size in bytes "hello"
dfx canister call day_2 size_in_bytes '("hello")'
