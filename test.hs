import Tree

fixture =
  Node 50
    (Node 17
      (Node 12
        (tree 9)
        (tree 14)
      )
      (Node 23
        (tree 19)
        Leaf
      )
    )
    (Node 72
      (Node 54
        Leaf
        (tree 67)
      )
      (tree 76)
    )

main = do
  -- putStrLn $ prettyPrint fixture
  putStrLn $ show $ ancestor fixture 17 50
