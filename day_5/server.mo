// This is the server canister.

import Cycles "mo:base/ExperimentalCycles";
import Result "mo:base/Result";
import Nat "mo:base/Nat";

//challenge 7
shared ({ caller = creator }) actor class MyCanister() = {
    
    public shared ({ caller }) func withdraw_cycles (n : Nat) : async Result.Result<Text, Text> {
        let balance = Cycles.balance();
        if (n <= balance) {
            Cycles.add(n);
            return #ok("Withdrew " # Nat.toText(n));
        } else {
            return #err("Not enough cycle balance in canister to withdraw that amount");
        };                          
    };

};