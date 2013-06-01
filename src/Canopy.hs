{-# LANGUAGE OverloadedStrings #-}
module Canopy (
    url
    , find
    , start
) where

import Data.Text (Text, splitOn, append, toUpper, toLower, unpack)
import Test.WebDriver
import Test.WebDriver.Classes

start b = runSession defaultSession defaultCaps { browser = b }

url :: WebDriver wd => Text -> wd ()
url u = openPage $ unpack u

find selector = findElem $ ByCSS selector
