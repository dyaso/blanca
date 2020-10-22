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

### List of all SIMD intrinsics used in [Klein](https://www.jeremyong.com/klein/), `_mm_` prefixes trimmed 

`grep -hor _mm_[a-z0-9_]* klein/src/* | sort | uniq` # -h = don't show file names, -o = only show matching words not context

[add_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_add_ps), 
[add_ss](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_add_ss), 
[andnot_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_andnot_ps), 
[and_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_and_ps), 
[blend_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_blend_ps), 
[castsi128_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_castsi128_ps), 
[cmpeq_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_cmpeq_ps), 
[cmplt_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_cmplt_ps), 
[dp_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_dp_ps), 
[loadu_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_loadu_ps), 
[movehdup_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_movehdup_ps), 
[movehl_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_movehl_ps), 
[moveldup_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_moveldup_ps), 
[movelh_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_movelh_ps), 
[movemask_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_movemask_ps), 
[mul_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_mul_ps), 
[mul_ss](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_mul_ss), 
[rcp_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_rcp_ps), 
[rsqrt_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_rsqrt_ps), 
[set1_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_set1_ps), 
[set_epi32](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_set_epi32), 
[set_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_set_ps), 
[set_ss](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_set_ss), 
[setzero_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_setzero_ps), 
[shuffle_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_shuffle_ps), 
[store_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_store_ps), 
[store_ss](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_store_ss), 
[storeu_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_storeu_ps), 
[sub_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_sub_ps), 
[sub_ss](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_sub_ss), 
[swizzle_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_swizzle_ps), 
[unpackhi_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_unpackhi_ps), 
[unpacklo_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_unpacklo_ps), 
[xor_ps](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#text=_mm_xor_ps), 

