# bintray

Manage packages in bintray.

## SYNOPSIS

    rerun [ARGS] bintray: [ package-delete | package-exists | package-update | package-upload ] [OPTIONS]

## README

The *bintray* commands help you manage packages in bintray.

Use `package-upload` to create a package version and upload
a file.

Use `package-delete` to delete a package version from a repository.

To check if a package exists, use `package-exists`.

Use `package-update` to set the package description and labels.

Authentication
--------------

You must have a valid bintray login and [API key](options/apikey/index.html).

## COMMANDS

* [package-delete](commands/package-delete/index.html): Delete a package version from bintray.
* [package-exists](commands/package-exists/index.html): Checks if the package exists.
* [package-update](commands/package-update/index.html): Update the information of the specified package.
* [package-upload](commands/package-upload/index.html): Uploads and publishes a package file.

## OPTIONS

* [apikey](options/apikey/index.html): The password used for REST authentication.
* [description](options/description/index.html): The package description.
* [descriptor](options/descriptor/index.html): File containing package metadata.
* [file](options/file/index.html): The file to upload and publish.
* [labels](options/labels/index.html): The package labels.
* [org](options/org/index.html): The bintray organization.
* [package](options/package/index.html): The package name.
* [repo](options/repo/index.html): The targeted repo.
* [user](options/user/index.html): The bintray subject, aka username.
* [version](options/version/index.html): The package version.

## TESTS

* [package-delete-1](tests/package-delete-1.html)
* [package-exists-1](tests/package-exists-1.html)
* [package-upload-1](tests/package-upload-1.html)

## LIBRARY

* [functions.sh](lib/functions.html)

## METADATA

* `NAME` = bintray
* `DESCRIPTION` = "Manage packages in bintray."
* `SHELL` = "bash"
* `VERSION` = 1.0.0
* `REQUIRES` = 
* `EXTERNALS` = 
* `LICENSE` = 

----

*Generated by stubbs:docs Sun May 19 09:22:46 PDT 2013*