# Multi-threaded Ruby HTTP Server from Scatch with Rack / Rails support

This is a basic HTTP server built from scratch using only Ruby.

* It starts a new thread for each connection.
* It checks for files on disk and serves them up if they exists (**Note: this is not production ready**)
* If no file exists, it will fallback to a Rack application defined as `APP`. This can be any Rack app, including Rails.
* Errors from Rack applications are logged and a 500 error is automatically returned
