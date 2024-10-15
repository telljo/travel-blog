// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import DropdownController from "./dropdown_controller"
application.register("dropdown", DropdownController)

import GeolocationController from "./geolocation_controller"
application.register("geolocation", GeolocationController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MapController from "./map_controller"
application.register("map", MapController)

import RemovalsController from "./removals_controller"
application.register("removals", RemovalsController)

import SearchController from "./search_controller"
application.register("search", SearchController)
