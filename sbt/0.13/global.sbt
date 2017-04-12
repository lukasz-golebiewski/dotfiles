libraryDependencies += "com.lihaoyi" % "ammonite" % "0.8.2" % "test" cross CrossVersion.full
initialCommands in (Test, console) := """ammonite.Main().run()"""


resolvers += "Artima Maven Repository" at "http://repo.artima.com/releases"
//libraryDependencies += "org.scala-debugger" %% "scala-debugger-api" % "1.0.0"

import org.ensime.EnsimeKeys._
ensimeScalaVersion in ThisBuild := "2.12.1"
ensimeIgnoreScalaMismatch in ThisBuild := true
