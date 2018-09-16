#!/bin/bash

bundle exec jekyll b
firebase deploy --only hosting:blog

