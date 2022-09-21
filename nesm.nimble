
version       = "0.4.10"
author        = "xomachine (Fomichev Dmitriy)"
description   = "NESM stands for Nim's Easy Serialization Macro. The macro allowing generation of serialization functions by one line of code!"
license       = "MIT"
skipDirs      = @["tests", "demos"]

requires "nim >= 0.14.2"

from strutils import endsWith

task tests, "Run autotests":
  let test_files = listFiles("tests")
  for target in ["c", "cpp"]:
    echo "== Testing target " & target & " =="
    for file in test_files:
      if file.endsWith(".nim"):
        exec("nim " & target & " --run -d:nimOldCaseObjects -d:debug --gc:refc -o:tmpfile -p:" & thisDir() & " " & file)
        rmFile("tmpfile")

task docs, "Build documentation":
  exec("nim doc --project nesm.nim")
