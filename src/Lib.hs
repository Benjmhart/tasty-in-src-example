module Lib
    ( someFunc
    , unit_whatever
    , unit_whatever2
    ) where

import Prelude
import Test.Tasty.HUnit (assertBool)

someFunc :: IO ()
someFunc = putStrLn "someFunc"

unit_whatever :: IO ()
unit_whatever = assertBool "example" True

unit_whatever2 :: IO ()
unit_whatever2 = error "this cannot succeed"
