Unstarted attempt at writing a procedural Rust macro for generating geometric algebra implementations given a specified metric and choice of basis blades and their storage order.

'Procedural' means it's a program that runs inside the compiler at compile time and can do arbitrary processing (as opposed to 'declarative' macros which are more limited, like C preprocessor ones). They come in three kinds:

* 'derive' proc macros get applied to data structures, so I guess you'd specify the basis blade choices and ordering most directly this way

* 'attribute' proc macros get applied to anything, this could be used to maybe e.g. write executable maths in TeX notation directly in your code

* 'function-like' proc macros seem the simplest approach, they're invoked directly and passed arguments like a function, and return Rust code to be compiled

It would also be nice to be able to program specialized implementation details, like using SIMD intrinsics for efficiency when you know how the geometric elements are going to be used.

### Reading list

Pinned topics in `macros` channel at [Rust discord](https://discord.gg/4e9qXV).

[Reverse Polish Notation implemented in a declarative macro](https://rreverser.com/writing-complex-macros-in-rust/).

[Support library](https://doc.rust-lang.org/proc_macro/), [parsing](https://github.com/dtolnay/syn) and [quasi-quoting](https://docs.rs/quote/0.6.13/quote/) crates.

### List of SIMD intrinsic instructions used in [Klein](https://www.jeremyong.com/klein/) 

All operate on four floats at a time?

[_mm_and_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_and_ps&expand=5197), 
[_mm_andnot_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_andnot_ps&expand=5197), 
[_mm_blend_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_blend_ps&expand=5197), 
[_mm_castsi](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_castsi&expand=5197), 
[_mm_cmpeq_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_cmpeq_ps&expand=5197), 
[_mm_cmplt_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_cmplt_ps&expand=5197), 
[_mm_dp_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_dp_ps&expand=5197), 
[_mm_loadu_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_loadu_ps&expand=5197), 
[_mm_movehdup_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_movehdup_ps&expand=5197), 
[_mm_movehl_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_movehl_ps&expand=5197), 
[_mm_moveldup_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_moveldup_ps&expand=5197), 
[_mm_movelh_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_movelh_ps&expand=5197), 
[_mm_movemask_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_movemask_ps&expand=5197), 
[_mm_mul_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_mul_ps&expand=5197), 
[_mm_rcp_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_rcp_ps&expand=5197), 
[_mm_rsqrt_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_rsqrt_ps&expand=5197), 
[_mm_set](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_set&expand=5197), 
[_mm_set_epi](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_set_epi&expand=5197), 
[_mm_set_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_set_ps&expand=5197), 
[_mm_set_ss](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_set_ss&expand=5197), 
[_mm_setzero_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_setzero_ps&expand=5197), 
[_mm_shuffle_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_shuffle_ps&expand=5197), 
[_mm_store_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_store_ps&expand=5197), 
[_mm_store_ss](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_store_ss&expand=5197), 
[_mm_storeu_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_storeu_ps&expand=5197), 
[_mm_sub_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_sub_ps&expand=5197), 
[_mm_sub_ss](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_sub_ss&expand=5197), 
[_mm_shuffle_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_shuffle_ps&expand=5197), 
[_mm_unpackhi_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_unpackhi_ps&expand=5197), 
[_mm_unpacklo_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_unpacklo_ps&expand=5197), 
[_mm_xor_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_xor_ps&expand=5197),
