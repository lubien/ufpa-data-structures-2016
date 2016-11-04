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
        EmptyTree
      )
    )
    (Node 72
      (Node 54
        EmptyTree
        (tree 67)
      )
      (tree 76)
    )

main = do
  putStrLn $ prettyPrint fixture
