{-# LANGUAGE OverloadedStrings #-}
module Canopy (
    url
    , find
    , start
    , Canopy.click
    , firefox
    , on
    , equals
    , (===)
) where

import Data.Text (Text, splitOn, append, toUpper, toLower, unpack)
import Test.WebDriver
import Test.WebDriver.Classes
import Test.WebDriver.Commands

start b = runSession defaultSession defaultCaps { browser = b }

url :: WebDriver wd => Text -> wd ()
url u = openPage $ unpack u

find selector = findElem $ ByCSS selector

click cssSelector = do
    e <- find cssSelector
    Test.WebDriver.click e

on :: WebDriver wd => Text -> wd ()
on url = do
    u <- getCurrentURL
    if (unpack url) /= u then error "Oops!" else return ()

equals :: WebDriver wd => Text -> Text -> wd ()
equals cssSelector value = do
    e <- find cssSelector
    text <- getText e
    if text /= value then error "Not equal!" else return ()

(===) :: WebDriver wd => Text -> Text -> wd ()
(===) cssSelector value = do cssSelector `equals` value
