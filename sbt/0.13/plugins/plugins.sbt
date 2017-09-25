resolvers += "Artima Maven Repository" at "http://repo.artima.com/releases"

addSbtPlugin("org.ensime" % "sbt-ensime" % "2.0.1")
//addSbtPlugin("io.get-coursier" % "sbt-coursier" % "1.0.0-RC3")
addSbtPlugin("de.heikoseeberger" % "sbt-fresh" % "1.8.0")
//addSbtPlugin("org.scala-debugger" % "sbt-jdi-tools" % "1.0.0")
addSbtPlugin("net.virtual-void" % "sbt-dependency-graph" % "0.8.2")

//resolvers += Resolver.bintrayIvyRepo("scalacenter", "sbt-releases")
//addSbtPlugin("org.scala-sbt" % "sbt-zinc-plugin" % "1.0.0-X10")

addSbtPlugin("org.duhemm" % "sbt-errors-summary" % "0.4.1")
