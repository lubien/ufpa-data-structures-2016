module Tree
  ( Tree(EmptyTree, Node)
  , emptyTree
  , tree
  , lowest
  , greatest
  , removeLowest
  , prettyPrint
  ) where

data Tree a
  = EmptyTree
  | Node a (Tree a) (Tree a)
  deriving (Show)

emptyTree :: Tree a
emptyTree =
  EmptyTree

tree :: a -> Tree a
tree x =
  Node x EmptyTree EmptyTree

insert :: Ord a => Tree a -> a -> Tree a
insert EmptyTree x =
  tree x
insert (Node xs left right) x
  | x == xs = Node xs left right
  | x < xs  = Node x (insert left x) right
  | x > xs  = Node x left (insert right x)

lowest :: Tree a -> Maybe a
lowest EmptyTree =
  Nothing
lowest (Node x EmptyTree _) =
  Just x
lowest (Node _ left _) =
  lowest left

greatest :: Tree a -> Maybe a
greatest EmptyTree =
  Nothing
greatest (Node x _ EmptyTree) =
  Just x
greatest (Node _ _ right) =
  greatest right

remove :: Ord a => Tree a -> a -> Tree a
remove EmptyTree _ =
  EmptyTree
remove (Node xs EmptyTree EmptyTree) x
  | x == xs = EmptyTree
  | otherwise = tree x
remove (Node xs left right) x
  | x == xs =
    let
      (lowestValue, rest) = removeLowest right
    in
      Node lowestValue left rest
  | otherwise = Node xs (remove left x) (remove right x)

removeLowest (Node x EmptyTree right) =
  (x, right)
removeLowest (Node _ left _) =
  removeLowest left

prettyPrint tree =
  let
    renderIndent indent =
      leftPad $ indent * 2

    prettyPrint EmptyTree indent =
      (renderIndent indent) ++ "EmptyTree"
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
