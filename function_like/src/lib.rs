use proc_macro::TokenStream;

#[proc_macro]
pub fn make_answer(_item: TokenStream) -> TokenStream {
	"fn answer() -> u32 {42}".parse().unwrap()
	// .parse is a proc_macro thing?
}
 
#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }
}
