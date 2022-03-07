import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";
import Nat "mo:base/Nat";

actor {

//challenge 1
  public func nat_to_nat8 ( n : Nat ) : async Nat8 {
    return(Nat8.fromNat(n));
  };

//challenge 2
  public func max_number_with_n_bits  ( bits: Nat ) : async Nat {
    return((2 ** bits) -1 );//max is 2 to the exponent bits minus 1
  };

//challenge 3
  public func decimal_to_bits ( n : Nat ) : async Text {
  var counter : Nat = 0;
  var bits : Nat = n;
  var bitflags : Text = "";

  // if (n % 2 > 0) {
  //   bitflags := "1";
  //   bits -= 1;
  // } else {
  //   bitflags := "0";
  // }

    //keep dividing n by 2 while it's greater than 0
    while (bits > 0) {
      if (bits % 2 > 0) {
        bitflags := Text.concat("1", bitflags);
      } else {
        bitflags := Text.concat("0", bitflags);
      };

      bits := bits / 2;
    };

    // return(Nat.toText(counter));
    return (bitflags);
  };

};