@echo off
REM Create a directory for storing version history
mkdir .vcs

REM Create an empty index file for staging changes
type nul > .vcs\index.txt

echo Initialized empty version control system in %cd%
