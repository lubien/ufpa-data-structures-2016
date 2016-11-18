module Tree
  ( Tree(Leaf, Node)
  , leaf
  , tree
  , lowest
  , greatest
  , removeLowest
  , prettyPrint
  , descendant
  , ancestor
  , find
  , isLeaf
  , isNode
  , findDistance
  , height
  , manyChildren
  , genericMinHeight
  , preOrder
  ) where

data Tree a
  = Leaf
  | Node a (Tree a) (Tree a)
  deriving (Show)

leaf :: Tree a
leaf =
  Leaf

tree :: a -> Tree a
tree x =
  Node x Leaf Leaf

insert :: Ord a => Tree a -> a -> Tree a
insert Leaf x =
  tree x
insert (Node xs left right) x
  | x == xs = Node xs left right
  | x < xs  = Node x (insert left x) right
  | x > xs  = Node x left (insert right x)

lowest :: Tree a -> Maybe a
lowest Leaf =
  Nothing
lowest (Node x Leaf _) =
  Just x
lowest (Node _ left _) =
  lowest left

greatest :: Tree a -> Maybe a
greatest Leaf =
  Nothing
greatest (Node x _ Leaf) =
  Just x
greatest (Node _ _ right) =
  greatest right

remove :: Ord a => Tree a -> a -> Tree a
remove Leaf _ =
  Leaf
remove (Node xs Leaf Leaf) x
  | x == xs = Leaf
  | otherwise = tree x
remove (Node xs left right) x
  | x == xs =
    let
      (lowestValue, rest) = removeLowest right
    in
      Node lowestValue left rest
  | otherwise = Node xs (remove left x) (remove right x)

removeLowest (Node x Leaf right) =
  (x, right)
removeLowest (Node _ left _) =
  removeLowest left

prettyPrint tree =
  let
    renderIndent indent =
      leftPad $ indent * 2

    prettyPrint Leaf indent =
      (renderIndent indent) ++ "Leaf"
    prettyPrint (Node x left right) indent =
      padding ++ (show x) ++ " {\n" ++
                 (prettyPrint left innerIndent) ++ "\n" ++
                 (prettyPrint right innerIndent) ++ "\n" ++
      padding ++ "}"
      where padding = (renderIndent indent)
            innerIndent = indent + 1
  in
    prettyPrint tree 0

leftPad n =
  concat $ replicate n " "

-- Exercises 01

-- Utils:

value :: Tree a -> Maybe a
value Leaf = Nothing
value (Node v _ _) = Just v

find :: (Eq a, Ord a) => Tree a -> a -> Bool
find Leaf _ = False
find (Node value left right) x
  | x == value = True
  | x < value  = find left x
  | x > value  = find right x

-- a)

-- idk how to name it in english so
-- deal with it
manyChildren :: Tree a -> Int
manyChildren Leaf = 0
manyChildren (Node _ Leaf Leaf) = 0
manyChildren (Node _ (Node _ _ _) (Node _ _ _)) = 2
manyChildren _ = 1

-- b)

descendant :: (Eq a) => Tree a -> a -> a -> Bool
descendant Leaf _ _ = False
descendant (Node current left right) a b
  | current == b = ((value left) == Just a) || ((value right) == Just a)
  | otherwise = (descendant left a b) || (descendant right a b)

-- c)

ancestor :: (Eq a) => Tree a -> a -> a -> Bool
ancestor = descendant

-- d)

isLeaf :: Tree a -> Bool
isLeaf Leaf = True
isLeaf _ = False

isNode :: Tree a -> Bool
isNode = not . isLeaf

-- e)

findDistance :: (Eq a, Ord a) => Tree a -> a -> Maybe Int
findDistance tree x =
  let
    findDistance' Leaf _ _ = Nothing
    findDistance' (Node value left right) x acc
      | x == value = Just acc
      | x < value  = findDistance' left x (acc + 1)
      | x > value  = findDistance' right x (acc + 1)
  in
    findDistance' tree x 0

-- f)

height :: Tree a -> Int
height Leaf = 1
height (Node value left right) =
  1 + (max (height left) (height right))

-- Exercises 02

genericMinHeight :: Int -> Int -> Int
genericMinHeight _ 1 = 1
genericMinHeight arity nodes =
  let
    rest = nodes - 1
    best_case = rest `div` arity + rest `mod` arity
  in
    1 + (genericMinHeight arity best_case)

-- Exercises 03

-- b)

-- preOrder :: Tree Char -> [a]
preOrder Leaf = []
preOrder (Node x left right) =
  x ++ (preOrder left) ++ (preOrder right)

