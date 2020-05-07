# npm_publisher

A shell script to update package on npm and on GitHub automatically.

## Usage

Copy `/publish.sh` into your package directory.

Make sure:

- Your project is based on `git` (by `git init` or `git clone`)
- You have a branch for your new package version (by `git branch <branchname>`)
- You are at the branch for the new version (by `git checkout <branchname>`)
- You have a `npm` account and you have logged in (by `npm login`)
- Your package is not scoped (you can change the source code if you want)
- You have a `package.json` under your package directory
- You have a `"version"` property in `package.json`
- You have a remote repo `origin` (by `git remote add origin <url>`)

Run:

```shell
$ chmod +x publish.sh
$ ./publish.sh
```

The script will ask for:

1. Your new version number
2. Name of the branch for the new version
3. Commit description

The script will do:

1. Publish the new version of the package to `npm`
2. Commit your new version branch and merge it to `master`
3. Change your current branch to `master` and delete the previous branch
4. Push the local `master` branch to the `master` branch in the remote repo `origin`

**Notice:** If commit description is not given (nothing entered) , then the default description will be `v<version_number>`. 

