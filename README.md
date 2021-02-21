# tasty-in-src


Traditional testing modules have some disadvantages:
1) tests often require the same imports as the functions they are testing, creating duplicated labour
2) tests are stored in a seperate location from the functions they impact, so a failure requires a developer to find both the test module and the implementation module

the strategy shown in this repo makes a trade:

- tests are implmented in the same source module as the functions they test
- when compiling, the `tasty` dependencies are required when building both production and testing versions of the library.

But how?

- tasty autodiscover is configured in source using configuration variables
- the tasty autodiscover module is then imported in test/Main and run as the main function

Explain the discovery magic?
when you use the tasty discovery pragma, tasty automatically generates a module which is named Main by default.   

having a second `Main` module is a problem, so we use the `-optF --generated-module=Spec` option to change the name to Spec, so that we can import the `Spec.main` function that will be generated at compile time

in order to see this magic in action, run `stack test` and scroll through the output,  we've left the `-optF --debug` flag enabled here, so you will see the generated code in the output of `stack test`.


