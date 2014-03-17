#
# Cookbook Name:: afterdark-webhead
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

critical_recipes = [
                    "afterdark-webhead::acl",
                    "afterdark-webhead::content",
                    "afterdark-webhead::nginx",
                   ]

# Run critical recipes
critical_recipes.each do | recipe |
  include_recipe recipe
end
