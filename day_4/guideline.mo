import Nat "mo:base/Nat";
actor {
    public func null_or_nat(n : ?Nat) : async Text {
        switch(n){
            // Case where n is null
            case(null) {
                return ("The argument is null");
            };
            // Case where n is a nat
            case(?something){
                return ("The argument is : " # Nat.toText(something));
            };
        };
    };
};