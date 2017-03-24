import Tree

-- data Operator = Plus | Minus | Product | Division
--   deriving (Show)

-- data Expression v
--   = Value v
--   | Group ( Expression v ) Operator ( Expression v )
--   deriving (Show)

-- readParens ('(':x) = "(\n" ++ readParens x
-- readParens (')':xs) = "\n)" ++ readParens xs
-- readParens (x:xs) = x : readParens xs
-- -- readParens x = readExp x
-- readParens x = x

-- numbers = ['1'..'9']
-- operators = "+-*/"

-- peekLiteral ([]) acc = acc
-- peekLiteral (x:y:xs) acc
--   | x `elem` number =
--     if y `elem` operators then
--                           peekLiteral (y:xs) x
--                           else
--                           peekLiteral ()
--   | x `elem` operators = 2
--   | otherwise = 3

-- readParens ('(':x) = "(\n" ++ readParens x
-- readParens (')':xs) = "\n)" ++ readParens xs
-- readParens (x:xs) = x : readParens xs
-- -- readParens x = readExp x
-- readParens x = x

-- readExp :: String -> Tree Char
-- readExp (x:'+':y:_) = Node '+' (readExp [x]) (readExp [y])
-- -- readExp (x:'+':y:xs) = (Group (Value x) Plus (Value y))
-- -- readExp (x:xs) = Value x : readExp xs
-- readExp (x:[]) = tree x

-- test ('1':'+':'2':_) = 1
-- text x = 2

main = do
  putStrLn $ show $ peekLiteral $ "1234+5"
  -- putStrLn $ show $ readParens $ "foo"
  -- putStrLn $ show $ readParens $ "(foo"
  -- putStrLn $ show $ readParens $ "(foo)"
  -- putStrLn $ readParens $ "(f(hue)oo(man))"
  -- putStrLn $ show $ test $ "1+2"
  -- putStrLn $ prettyPrint $ readParens $ "1+2"
  -- putStrLn $ show $ readExp $ "1+2"
  -- putStrLn $ show $ readExp $ "1+2"
