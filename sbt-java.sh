#!/bin/sh

#create a folder structure
read -p "Enter the name of the app: [Default is app] " appName

if [[ -z $appName ]]
then
  appName="app"
fi

mkdir -p $appName/project
cd $appName

# create an initial build.sbt file
echo 'organization := "your.group.id"

name := "'$appName'"

version := "1.0"

autoScalaLibrary := false

crossPaths := false

EclipseKeys.projectFlavor := EclipseProjectFlavor.Java

testOptions += Tests.Argument(TestFrameworks.JUnit, "-q", "-v")

libraryDependencies ++= Seq(
  "junit" % "junit" % "4.10" % "test",
  "com.novocode" % "junit-interface" % "0.10" % "test"
)
' > build.sbt


# create an initial Build.scala file
echo 'import sbt._

object AppBuild extends Build {
}

' > project/Build.scala


# create an initial plugins.sbt file
echo 'addSbtPlugin("com.typesafe.sbteclipse" % "sbteclipse-plugin" % "2.5.0")

addSbtPlugin("com.github.mpeltonen" % "sbt-idea" % "1.6.0")' > project/plugins.sbt
