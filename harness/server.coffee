#
# ## Server
#
# Mock API endpoints and serve static assets in `app/public`.
#
# - Define custom routes with `routesPath` for API endpoints.
# - Easy to mock edge-case result sets and fast, offline integration tests.
#
fs = require 'fs'
express = require 'express'
livereload = require 'livereload'
root = require('path').normalize "#{__dirname}/.."
pub = "#{root}/app/public"
routesPath = "#{root}/app/routes.coffee"

app = express()
app.use app.router
app.use express.static pub
app.use express.bodyParser()

# If any custom routes are defined, use them.
app.use require routesPath if fs.stat routesPath

# Don't start `livereload` when the integration tests are running headlessly on `8081`.
if process.env.PORT is 8080
  refresher = livereload.createServer()
  refresher.watch pub

# Allow the integration test runner to run at a different port to avoid collision with `make server` on `8080`.
app.listen process.env.PORT or 8080