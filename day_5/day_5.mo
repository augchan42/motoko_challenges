import Debug "mo:base/Debug";
import Iter "mo:base/Iter";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Char "mo:base/Char";
import Nat32 "mo:base/Nat32";
import Float "mo:base/Float";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Result "mo:base/Result";
import Option "mo:base/Option";
import Principal "mo:base/Principal";
import Blob "mo:base/Blob";
import Hashmap "mo:base/HashMap";
import Cycles "mo:base/ExperimentalCycles";

actor {

  //challenge 1
  public shared(msg) func is_anonymous () : async Bool {
    
    if (Principal.isAnonymous(msg.caller)) {
      return true;
    };
    return false;
  };

  //challenge 2
  //create hashmap of 0 size, with principals as key and Nat as value
  //Just use the included equal and hash functions from Principal for the map
  let favoriteNumber : Hashmap.HashMap<Principal, Nat> = Hashmap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

  //challenge 3
  public shared(msg) func add_favorite_number (n : Nat) : () {
    favoriteNumber.put(msg.caller, n);
  };
  
  public shared(msg) func show_favorite_number () : async ?Nat {
    return favoriteNumber.get(msg.caller);
  };

  //challenge 4

  func show_favorite_number4(p : Principal) : ?Nat {
    return favoriteNumber.get(p);
  };

  public shared(msg) func add_favorite_number4 (n : Nat) : async Text {
    if (show_favorite_number4(msg.caller) != null) {
      return ("You've already registered your number");
    } else {
      add_favorite_number(n);
      return ("You've successfully registered your number");
    };
  };

  //challenge 5
  public shared(msg) func update_favorite_number (n : Nat) : async Text {
    var replaceResult = favoriteNumber.replace(msg.caller, n);
    if (replaceResult == null) {
      return ("Updating to value " # Nat.toText(n) # " no previous value");
    } else {
      return "Updating to value " # Nat.toText(n) # " with previous value: " # Nat.toText(Option.unwrap(replaceResult));
    }
  };

  public shared(msg) func delete_favorite_number () : async Text {
    if (show_favorite_number4(msg.caller) != null) {
      var fav = show_favorite_number4(msg.caller);
      favoriteNumber.delete(msg.caller);
      return ("favorite number " # Nat.toText(Option.unwrap(fav)) # " deleted.");
    } else {
      return ("no favorite number to delete");
    };
  };

  //challenge 6
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

  //challenge 8
  stable var versionNumber : Nat = 0;
  stable var counter : Nat = 0;

  public func increment_counter (x : Nat) : async Nat {
    versionNumber := counter + x;
    return (counter);
  };

  system func preupgrade() {
    // Do something before upgrade
    versionNumber := versionNumber + 1;
    Debug.print("Current versionNumber: " # Nat.toText(versionNumber));

  };

};