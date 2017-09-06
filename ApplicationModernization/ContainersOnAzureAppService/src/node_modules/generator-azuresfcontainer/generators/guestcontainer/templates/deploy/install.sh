#!/bin/bash

azure servicefabric application package copy <%= appPackage %> fabric:ImageStore
azure servicefabric application type register <%= appPackage %>
azure servicefabric application create fabric:/<%= appName %>  <%= appTypeName %> 1.0.0


