# Harness

Tools for writing HTML, CSS, and JavaScript with unit and integration testing, dependency management, deployment and API mocks.

The most common use case is a project that involves a Rails app and a Backbone.js app.
Traditionally, both apps would be kept in the same codebase out of convenience but at the expense of portability and boundary.
With `harness` you can give the apps separate codebases and still have the same test and front end preprocessing tools you'd expect with a Rails stack.

Write an app with `harness` and deploy it to any host web app or even S3.


# Features
__Auto-compiling assets__

  - Compiled on save
  - CoffeeScript
  - Stylus


__Browser auto-refresh with [`live-reload`](https://github.com/livereload/livereload-extensions)__

  - Page is refreshed in any browser currently opened to `localhost:8080` every time a source file changes


__Auto-running unit tests in all browsers with [`jasmine`](http://pivotal.github.com/jasmine/) and [`testem`](https://github.com/airportyh/testem)__

  - Unit tests are auto-run in any browser currently opened to `localhost:7357` every time a source or test file changes


__Headless integration tests in Webkit with [`casperjs`](http://casperjs.org/)__

  - Run integration tests regularly to assert common use cases and user flows


__Documentation with [`groc`](https://github.com/nevir/groc)__

  - Inline comments with markdown are parsed and displayed as HTML documentation


__Dependency management with [`browserify`](https://github.com/substack/node-browserify)__

  - Modularize, prevent global leakage, and control module dependencies


__Endpoint mocks with [`express`](http://expressjs.com/)__

  - Mock out server endpoints with sample responses that mimic production


__Deployment to filesystem__

  - `make deploy` accepts an `OUTPUT` variable to `cp` the output assets to another codebase on the filesystem



## Collateral Benefits
__App/Platform independent__

  - Embeddable for any app in any country on any platform. Just define some configuration and endpoints.


__Runtime dependency independent__

  - Use any dependencies you want -- backbone.js, ember.js or fuckit.js


__Clear and defined integration points__

  - Forces upfront thought to define the boundaries and interfaces for client-side code


__Less global impact__

  - Reduce the reliance on super objects


__Fast and transparent tests__

  - Run automatically on every file change so test setup is painless
  - Early detection of regressions

---


# Dependencies
- gcc: install via Xcode
- [node.js 0.8.8+](http://nodejs.org/dist/v0.8.8/node-v0.8.8.pkg)
- pygments: `sudo easy_install pygments`
- casper.js: `brew install casperjs`

`make install` to install dependencies after a fresh clone.

---


## Workflow
`make server` starts file watchers for `src/` and `/test` and a server at `http://localhost:8080` for development.

`make test` to run the tests at `http://localhost:7357` in all open browsers every time a source or test file is changed.

`make itest` to run the integration tests every time a source or test file is changed.

`make deploy OUTPUT=/path/to/www` to make a build and `cp public/prefix*` a directory of your choosing.

