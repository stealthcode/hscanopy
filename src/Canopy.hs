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
    , reload
) where

import Data.Text (Text, splitOn, append, toUpper, toLower, unpack, pack)
import Test.WebDriver
import Test.WebDriver.Classes
import Test.WebDriver.Commands
import Test.WebDriver.Commands.Wait

start b = runSession defaultSession defaultCaps { browser = b }

url :: WebDriver wd => Text -> wd ()
url u = openPage $ unpack u

find selector = findElem $ ByCSS selector

click cssSelector = find cssSelector >>= Test.WebDriver.click

on :: WebDriver wd => Text -> wd ()
on url = do
    waitUntil 5 $ do
        u <- getCurrentURL
        expect $ (unpack url) == u

reload :: WebDriver wd => wd ()
reload = do
    u <- getCurrentURL
    url $ pack u

equals :: WebDriver wd => Text -> Text -> wd ()
equals cssSelector value = do
    waitUntil 5 $ do
        e <- find cssSelector
        text <- getText e
        expect $ text == value


(===) :: WebDriver wd => Text -> Text -> wd ()
(===) cssSelector value = do cssSelector `equals` value
