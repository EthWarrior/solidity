==== Source: C.sol ====
import "B.sol";
pragma experimental SMTChecker;
contract C is B {
	function h(uint _x) public view {
		assert(_x < x);
	}
}
==== Source: A.sol ====
contract A {
	uint x;
	function f(uint _x) public {
		x = _x;
	}
}
==== Source: B.sol ====
import "A.sol";
contract B is A {
	function g(uint _x) public view {
		assert(_x > x);
	}
}
// ----
// Warning 6328: (B.sol:71-85): CHC: Assertion violation happens here.
// Warning 6328: (C.sol:103-117): CHC: Assertion violation happens here.
