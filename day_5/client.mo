import Cycles "mo:base/ExperimentalCycles";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Principal "mo:base/Principal";
import Result "mo:base/Result";

shared ({ caller = creator }) actor class MyCanister (serverCanister : Principal) = {

//deposit cycles to this canister by withdrawing from remote canister
    public shared ({ caller }) func deposit_cycles (
        amount : Nat,
    ) : async Result.Result<Text, Text> {
        Debug.print("Current balance: " # Nat.toText(Cycles.balance()));
        let grandma : actor { recipe : () -> async Result.Result<Text, Text>; } = actor(Principal.toText(serverCanister));
        if (pay) {
            // We know the price is 1 million cycles, but we want to send grandma a little extra...
            Cycles.accept(1_000_100);
        };
        let recipe = await grandma.recipe();
        Debug.print("Unused balance: " # Nat.toText(Cycles.refunded()));
        recipe;
    };

    public func deposit_cycles () : async Nat {
    let amount = Cycles.available();
    // let limit : Nat = capacity - savings;
    // let acceptable = amount;
      // if (amount <= limit) amount
      // else limit;
    let accepted = Cycles.accept(amount);
    // assert (accepted == acceptable);
    // savings += acceptable;
    return accepted;
  };

};