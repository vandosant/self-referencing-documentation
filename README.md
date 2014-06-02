# Dictionary references

You work at a library.  People always ask you for words, and when you give them definitions, they ask about those
words as well.  You need to write a program that will help you come up with a list of related words.

You have a dictionary in JSON format, that looks like this:

```
{
  "word": {
    "definition": "a {collection} of {letters}",
    "url": "//example.com/word"
  },
  "letter": {
    "definition": "a character representing one or more of the sounds used in speech; any of the symbols of an alphabet",
    "url": "//example.com/letter"
  },
  "collection": {
    "definition": "a group of things or people",
    "url": "//example.us/collection"
  }
}
```

You need to parse this text, and generate a data structure that includes the urls of the referenced words (from brackets).

Some words are pluralized, and you have to be able to traverse to them anyway.

## Examples

For example, when given "word", your program should return:


```
{
  definition: "a collection of letters",
  see_also: [
    "//example.com/letter",
    "//example.com/collection"
  ]
}
```

# Setup

* Fork
* Clone
* Turn on TravisCI for the fork by
  visiting https://travis-ci.org/profile/<github user name>, clicking the "Sync now" button
  and scrolling down to find the repository to build.
* Create a new branch for your work using `git checkout -b v1`
* Implement specs and code
* Push using `git push -u origin v1`

## Further Practice

This warmup can be completed multiple times to increase your comfort level with the material.
To work on this from scratch, you can:

1. Add an upstream remote that points to the original repo `git remote add upstream git@github.com:gSchool/self-referencing-documentation.git`
1. Fetch the latest from the upstream remote using `git fetch upstream`
1. Create a new branch from the master branch of the upstream remote `git checkout -b v2 upstream/master`
1. Implement specs and code
1. Push using `git push -u origin v2`

Each time you do the exercise, create a new branch. For example the 3rd time you do the exercise the branch
name will be v3 instead of v2.
