import Tree

fixture =
  Node "+"
    (tree "a")
    (Node "*"
      (tree "b")
      (Node "-"
        (Node "/"
          (tree "c")
          (tree "d")
        )
        (tree "e")
      )
    )

main = do
  putStrLn $ preOrder $ fixture
