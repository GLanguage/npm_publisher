#!/usr/bin/env sh

# OS
OS=`uname -s`

# Ask for info
echo 'Publish version: '
read VERSION
echo 'Current branch: '
read BRANCH
echo "Commit Description: (v$VERSION) "
read DESC
def=''
if [ $DESC == $def ] # Default
then
	DESC="v$VERSION"
fi

# Update package.json
if [ $OS == Darwin ] # Mac
then
	sed -i "" "s/\"version\": \".\",/\"version\": \"$VERSION\",/" package.json
else # Linux
	sed -i "s/\"version\": \".\",/\"version\": \"$VERSION\",/" package.json
fi

# npm publish
npm publish

# git
git add .
git commit -m "$DESC"
git checkout master
git merge $BRANCH
git branch -d $BRANCH
git push origin master
