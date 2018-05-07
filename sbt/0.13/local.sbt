// Fixes problem with compilation to an encrypted filesystem
scalacOptions ++= Seq("-Xmax-classfile-name", "128")
