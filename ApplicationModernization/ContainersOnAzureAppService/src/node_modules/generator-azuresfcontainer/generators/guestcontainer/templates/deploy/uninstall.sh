#!/bin/bash

azure servicefabric application delete fabric:/<%= appName %>
azure servicefabric application type unregister <%= appTypeName %> 1.0.0
