{-# LANGUAGE OverloadedStrings #-}
module Canopy (
      url
    , find
) where

import Data.Text (Text, splitOn, append, toUpper, toLower)
import Test.WebDriver 

capabilities = defaultCaps { browser = firefox }

run = runSession defaultSession capabilities $ do 
    url "http://stackoverflow.com" 
    e1 <- find "#nav-questions"
    click e1

url = openPage

find selector = findElem $ ByCSS selector
