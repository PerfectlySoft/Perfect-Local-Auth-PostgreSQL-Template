//
//  Routes.swift
//  Perfect-Local-Auth-template
//
//  Created by Jonathan Guthrie on 2017-02-20.
//	Copyright (C) 2017 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectHTTPServer
import LocalAuthentication

func mainRoutes() -> [[String: Any]] {

	var routes: [[String: Any]] = [[String: Any]]()
	// Special healthcheck
	routes.append(["method":"get", "uri":"/healthcheck", "handler":Handlers.healthcheck])

	// add Static files
	routes.append(["method":"get", "uri":"/**", "handler":PerfectHTTPServer.HTTPHandler.staticFiles,
	               "documentRoot":"./webroot",
	               "allowResponseFilters":true])

	// Handler for home page
	routes.append(["method":"get", "uri":"/", "handler":Handlers.main])

	// Login
	routes.append(["method":"get", "uri":"/login", "handler":Handlers.login]) // simply a serving of the login GET
	routes.append(["method":"post", "uri":"/login", "handler":LocalAuthWebHandlers.login])
	routes.append(["method":"get", "uri":"/logout", "handler":LocalAuthWebHandlers.logout])

	// Register
	routes.append(["method":"get", "uri":"/register", "handler":LocalAuthWebHandlers.register])
	routes.append(["method":"post", "uri":"/register", "handler":LocalAuthWebHandlers.registerPost])
	routes.append(["method":"get", "uri":"/verifyAccount/{passvalidation}", "handler":LocalAuthWebHandlers.registerVerify])
	routes.append(["method":"post", "uri":"/registrationCompletion", "handler":LocalAuthWebHandlers.registerCompletion])

	// JSON
	routes.append(["method":"get", "uri":"/api/v1/session", "handler":LocalAuthJSONHandlers.session])
	routes.append(["method":"get", "uri":"/api/v1/me", "handler":LocalAuthJSONHandlers.me])
	routes.append(["method":"get", "uri":"/api/v1/logout", "handler":LocalAuthJSONHandlers.logout])
	routes.append(["method":"post", "uri":"/api/v1/register", "handler":LocalAuthJSONHandlers.register])
	routes.append(["method":"post", "uri":"/api/v1/login", "handler":LocalAuthJSONHandlers.login])
	routes.append(["method":"post", "uri":"/api/v1/changepassword", "handler":LocalAuthJSONHandlers.changePassword])

	// OAuth2 Redirector (see https://github.com/OAuthSwift/OAuthSwift/wiki/API-with-only-HTTP-scheme-into-callback-URL)
	/*
	for 'oauth-swift' URL scheme : http://oauthswift.herokuapp.com/callback/{path?query} which redirect to oauth-swift://oauth-callback/{path?query}
	*/
	routes.append(["method":"get", "uri":"/api/v1/oauth/return", "handler":LocalAuthJSONHandlers.oAuthRedirecter])

	return routes
}
