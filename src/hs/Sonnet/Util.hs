module Sonnet.Util(trim, csv, lg, s) where

import Data.List
import Data.Char
import System.IO.Unsafe


import Language.Haskell.TH.Quote
import Language.Haskell.TH.Lib


--------------------------------------------------------------------------------
----
---- Util

trim :: String -> String
trim  = f . f where f = reverse . dropWhile isSpace

csv :: Show a => [a] -> String
csv =  concat . intersperse " " . map show

lg :: (Show a) => a -> a
lg a =  unsafePerformIO $ putStrLn (show a) >> return a

s :: QuasiQuoter
s = QuasiQuoter (litE . stringL) (litP . stringL) undefined undefined


