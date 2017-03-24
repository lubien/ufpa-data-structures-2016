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
  putStrLn $ show $ complete fixture (height fixture)
  putStrLn $ show $ full fixture (height fixture)
  putStrLn $ show $ fullOrComplete fixture (height fixture)
  -- putStrLn $ prettyPrint fixture
  -- putStrLn $ show $ ancestor fixture 17 50
  -- putStrLn $ show $ find fixture 23
  -- putStrLn $ show $ isNode fixture
  -- putStrLn $ show $ findDistance fixture 50
  -- putStrLn $ show $ findDistance fixture 17
  -- putStrLn $ show $ height Leaf
  -- putStrLn $ show $ height (Node 10 Leaf Leaf)
  -- putStrLn $ show $ height fixture
  -- putStrLn $ show $ manyChildren fixture
