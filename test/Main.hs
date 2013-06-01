{-# LANGUAGE OverloadedStrings #-}

import Data.Text (Text, splitOn, append, toUpper, toLower)
import Canopy
import Test.WebDriver

--run = runSession defaultSession capabilities $ do
--    url "http://stackoverflow.com"
--    e1 <- find "#nav-questions"
--    click e1


main :: IO()
main = do
    start firefox $ do
        url "http://stackoverflow.com"
        e1 <- find "#nav-questions"
        click e1
        --on "http://stackoverflow.com/questions"

--run :: Test.WebDriver.wd -> ()
--run browser =
