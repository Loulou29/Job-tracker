Job tracking Excel from HTML webpages
================

## Background

Many job websites don’t have a built-in “export” function, to allow
users to create an Excel sheet with key description of the jobs
(e.g. company names, positions, deadlines, etc.).

## Goal

My codes converted job information on an html page into a manageable
Excel sheet, so that I can prioritize my job applications and not miss
application deadlines.

## Git workflow

I used the [git commands](https://www.youtube.com/watch?v=wrb7Gge9yoE)
below to create a local .git file and push my codes to Github:

1.  Open Terminal, type and enter: cd “/project_folder”
2.  Create .gitignore file in project folder, to specify what not to
    upload to Github
3.  git init
4.  git add README.md README.Rmd jobs.R job_tracker.Rproj
5.  git status
6.  git commit -m “first commit”
7.  git remote add origin
    <https://github.com/Loulou29/Housing-visualization.git>
8.  git branch -M main
9.  git push -u origin main
