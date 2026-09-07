(declare-project
  :name "jaylib-game-template"
  :description "Minimal Janet and Jaylib game template"
  :version "0.1.0"
  :dependencies [{:url "https://github.com/janet-lang/jaylib.git"
                  :tag "d7da7f14815e5ac70d02d6a942d1ae5adb04cb12"}])

(declare-executable
  :name "jaylib-game"
  :entry "src/main.janet")
