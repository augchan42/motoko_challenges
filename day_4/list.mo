import List "mo:base/List";


module {
    public type List<T> = ?(T, List<T>);

//challenge 7

    public func is_null<T> (l : List<T>) : Bool {
        switch(l) {
            case (null) { return true };
            case (?l) { return false };
        }
    };

//challenge 8
    public func last<T>(l : List<T>) : ?T {
    switch l {
        case null { null };
        case (?(x, null)) { ?x }; //last element in the list
        case (?(_, t)) { last<T>(t) }; //recursive call until the next element in the list is null
      }
    };

//challenge 9
    public func size<T>(l : List<T>) : Nat {
        func rec(l : List<T>, n : Nat) : Nat {
        switch l {
            case null { n };//end of the list, return the counter
            case (?(_, t)) { rec(t, n + 1) };//recursively go through the list and increment the counter
        }
        };
        rec(l,0)
    };

    //challenge 10
    public func get<T>(l : List<T>, n : Nat) : ?T {
        switch (n, l) {
        case (_, null) { null }; //if list is null return null
        case (0, (?(h, t))) { ?h }; //if getting 0, return current element
        case (_, (?(_, t))) { get<T>(t, n - 1) };//otherwise recurse through the list
        }
    };    

//challenge 11
    public func reverse<T>(l : List<T>) : List<T> {
        func rec(l : List<T>, r : List<T>) : List<T> {
        switch l {
            case null { r };
            case (?(h, t)) { rec(t, ?(h, r)) };
        }
        };
        rec(l, null)
    };
};
