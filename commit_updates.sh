#!/bin/bash

gitdir=$(pwd)
cd ~/.config
mv nvim.zip nvim.zip.old 2>/dev/null
zip nvim.zip -r nvim
mv nvim.zip $gitdir
cd $gitdir
git add nvim.zip
git commit -m "updated nvim config"
git push
