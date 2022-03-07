// actor {

//   let a : Nat8 = 255;

// };


import Char "mo:base/Char";
actor {
    //	Return the character corresponding to the unicode value n.
    public func unicode_to_character(n : Nat32) : async Text {
    	let char : Char = Char.fromNat32(n);
    	return(Char.toText(char));
    };
};
