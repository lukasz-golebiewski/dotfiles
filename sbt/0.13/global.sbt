libraryDependencies += "com.lihaoyi" % "ammonite" % "1.0.2" % "test" cross CrossVersion.full

resolvers += "Artima Maven Repository" at "http://repo.artima.com/releases"
//libraryDependencies += "org.scala-debugger" %% "scala-debugger-api" % "1.0.0"

cancelable in Global := true

import org.ensime.EnsimeKeys._
//ensimeScalaVersion in ThisBuild := "2.12.1"
//ensimeIgnoreScalaMismatch in ThisBuild := true
