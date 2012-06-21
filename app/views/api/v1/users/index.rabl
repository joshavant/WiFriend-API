object @users
 
# Reuse the show template definition
extends "api/v1/users/show"
 
# Let's add an "id" resource for the index action
attributes :id