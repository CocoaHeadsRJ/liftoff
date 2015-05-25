#!/usr/bin/env bash

bundle install
<% if enable_settings && use_cocoapods %>
pod install
<% end %>
<% if use_carthage %>
carthage update
<% end %>
