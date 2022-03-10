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

actor {

  //challenge 1
  public func swap (array : [Nat], entry1 : Nat, entry2 : Nat) : async [Nat] {
    var mutable_array : [var Nat] = Array.thaw(array);
    // var fixed_array : [Nat]  = 
    return Array.freeze(priv_swap(mutable_array, entry1, entry2));

  };

  func priv_swap (mutable_array : [var Nat], entry1 : Nat, entry2 : Nat) : [var Nat] {
    let entry1_val = mutable_array[entry1];
    let entry2_val = mutable_array[entry2];
    var buffer = Buffer.Buffer<Nat>(10);
    var counter : Nat = 0;
    
    mutable_array[entry1] := entry2_val;
    mutable_array[entry2] := entry1_val;
    
    return mutable_array;
  };

  //challenge 2
  public func init_count(n : Nat) : async [Nat] {
    var buffer = Buffer.Buffer<Nat>(10);

    for (i in (Iter.range(0, n-1))) {
      buffer.add(i);
    };

    return buffer.toArray();    
  };


  //challenge 3
  public func seven (array : [Nat]) : async Result.Result<Text, Text> {
    for (value in array.vals()) {
      if (value == 7) {
        return #ok("Seven is found");
      };      
    };
    return #err("Seven not found");
  };

  //challenge 4
  public func nat_opt_to_nat(n : ?Nat, m : Nat) : async Nat {
    switch(n) {
      case(null) {
        return (m);
      };
      case (?n) {
        return (n)
      };
    };
  };

  //challemnge 5
  public func day_of_the_week (n : Nat) : async ?Text {
    switch(n) {
      case(1) {
        return (Option.make("Monday"));
      };
      case(2) {
        return (Option.make("Tuesday"));
      };
      case(3) {
        return (Option.make("Wednesday"));
      };
      case(4) {
        return (Option.make("Thursday"));
      };
      case(5) {
        return (Option.make("Friday"));
      };
      case(6) {
        return (Option.make("Saturday"));
      };
      case(7) {
        return (Option.make("Sunday"));
      };
      case(_) {
        return null;
      };
    };
  };

  //challenge 6
  //populate all null elements with 0

  public func populate_array (array : [?Nat]) : async [Nat] {
    return(Array.map<?Nat, Nat>(array, replace_null_with_0));
  };

  func replace_null_with_0 (n : ?Nat) : Nat {
    switch(n) {
      case(null) {
        return 0;
      };
      case(?n) {
        return n;
      }
    };
  };

  //challenge 7
  public func sum_of_array (array : [Nat]) : async Nat {
    return(Array.foldLeft<Nat, Nat>(array, 0, Nat.add));
  };

  //challenge 8
  public func squared_array (array : [Nat]) : async [Nat] {
    return(Array.map(array, square_number));
  };

  func square_number(n : Nat) : Nat {
    return (n * n) ;
  };

  //challenge 9
  //increase each element in array by its index value
  public func increase_by_index (array : [Nat]) : async [Nat] {
    let actual = Array.mapEntries<Nat, Nat> (
      array, func( value: Nat, index: Nat) : Nat {
        (sum_2_nums (index, value))
      });

    return (actual);
  };
  
  
  func sum_2_nums( x: Nat, y: Nat) : Nat {
    return (x + y);
  };    

  //challenge 10
  func contains<A> ( array : [A], a : A, f : (A, A) -> Bool) :  Bool {
    for (value in array.vals()) {
      if (f(value, a)) {
        return true;
      };      
    };
    return false;
  };

  let same_func = func<A> (tuple: (A, A)) : Bool {
    if (tuple.0 == tuple.1) {
      return true;
    }; 
    return false;
  };



};