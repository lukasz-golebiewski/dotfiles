libraryDependencies += "com.lihaoyi" % "ammonite" % "1.0.2" % "test" cross CrossVersion.full

sourceGenerators in Test += Def.task {
  val file = (sourceManaged in Test).value / "amm.scala"
  IO.write(file, """object amm extends App { ammonite.Main().run() }""")
  Seq(file)
}.taskValue

// Optional, required for the `source` command to work
(fullClasspath in Test) ++= {
  (updateClassifiers in Test).value
    .configurations
    .find(_.configuration == Test.name)
    .get
    .modules
    .flatMap(_.artifacts)
    .collect{case (a, f) if a.classifier == Some("sources") => f}
}

resolvers += "Artima Maven Repository" at "http://repo.artima.com/releases"
//libraryDependencies += "org.scala-debugger" %% "scala-debugger-api" % "1.0.0"

cancelable in Global := true

import org.ensime.EnsimeKeys._
//ensimeScalaVersion in ThisBuild := "2.12.1"
//ensimeIgnoreScalaMismatch in ThisBuild := true
