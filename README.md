# vimide

IDE like features for Vim.

## What? Why?

Have been using Vim for a long time with minimal plugins. In particular, I had no language specific plugins or any that actually offered IDE like features. They seemed like bloat and all over the place. It did not feel like the Vim philosophy.

But after reaching intermediate Vim proficiency, and playing around with Smalltalk (specifically [Pharo](pharo.org)), I could see the value of integeration specific to language. 

Still, being a follower of the Vim philosophy, there is no way to edit code faster than Vim. IDE plugins for Vim like editing won't cut it. The only way this can happen for me, is to bring in IDE features to Vim.

So, this is not an IDE. It is bringing in IDE features to Vim. The different aspects may or may not be integerated as well as in an IDE, but they can be made to work together. There is a multitude of plugins for Vim that do different things, often overlapping in features. Choosing the plugins is completely up to you. Some plugins would work for some languages but not others.

## Features

The features I have decided upon so far. Support for some features sometimes only goes so far for a language. Some features can only be achieved by multiple plugins working together.

### Documentation Support

Lookup the corresponding manual for text under cursor. Lookup the definition (in programming sense) of "object" (meaning function,class etc).

### Autocomplete

Completion of code under cursor. Could be manual or automatic. Could also show arguments expected upon completion of a function name (say) in a popup or a separate window.

Typically implemented using omnifunc. You have a set of plugins that provide language specific completion hints (say backends). A seperate set of plugins provide customization of appearance and trigger (like the TAB key) or automatic completion (say frontend).

You could get away with a single frontend plugin customized to your needs. Several plugins may exist as backends for each languages. Some plugins try to integerate both backend and frontend behaviour into one for a single language.

### Syntax Checking

Syntax check typically means linters or static analysis tools that run on your code and give feedback either as a seperate list (using quicklist or loclist) or in the gutter (next to the line number). May be manually triggered or automatically (on save for instance).

Like autocompletion, you could loosely divide the work done into a frontend that presents errors, allows navigating errors etc and a backend that actually contains the logic for checking the syntax. Some plugins provide only frontend functionality. Each language has multiple backends. Some of these backends are direct tools that need to be installed outside (using say apt or pip). Some backends require a plugin as well to interact with said backend. Some plugins combine all functionality for some languages.

### Style Checking

Similar to syntax checking, except this enforces common style rules depending on language and style guide followed. May partially overlap with Syntax checking.

### Autoformatting

Fixing spacing, indentation, etc depeding on language/style guide etc. 

Simillar backend, frontend, mixed setup as above features.

### Compilation, Building, Testing

Need to be able to trigger these from inside and get results/errors back inside.

Similar backend/frontend/mixed setup.

### Snippets

Inserting common snippets of code quickly.

Similar backend/frontend/mixed setup.

## Organization

I do most language development in a Docker container, which means I can have vimrc configured per language with the base Docker image. 

Based on my normal [.vimrc](https://github.com/chanderg/dotfiles) which contains C/C++/Python specific features included.

## vigode

Vi Golang Development environment is a Docker based workflow for Go development. Includes Vi and necessary plugins inside the image.

Look at documentation of the `vim-go` plugin. All IDE features come from it. 

### Instructions

Build the image using the included Dockerfile. Use the `runner.sh` script to run a container for a project.

The idea is to have a seperate $GOPATH folder for each Golang project. This folder on the host is mounted inside the container. This is in the usual form of the $GOPATH, with src/, pkg/ and bin/ directories.

All `go get`s after this will use this as the GOPATH.

So all development and dependencies are in this folder on the host mounted as a volume inside. You could use other tools from the outside, eg `git`.

The development container itself is ephermeral. Once you save the files inside, you can safetly exit and delete the container. Next run will create a fresh container and mount the GOPATH, so you can start using it directly.
