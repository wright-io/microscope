Meteor.publish 'newPosts', (options) ->
  query = new RegExp(options.keyword, 'i')
  Posts.find {$or: [{title: query}, {description: query}, {deal: query}, {street: query}, {city: query}, {state: query}, {zip: query}]}, {sort: {submitted: -1}}

# Meteor.publish 'bestPosts', ->
#   query = new RegExp('a', 'i')
#   Posts.find {$or: [{title: query}, {description: query}, {deal: query}, {street: query}, {city: query}, {state: query}, {zip: query}]}, {sort: {votes: -1, submitted: -1}}

Meteor.publish 'singlePost', (id) ->
  Posts.find id

Meteor.publish 'comments', (postId) ->
  Comments.find({postId: postId})

Meteor.publish 'notifications', ->
  Notifications.find {userId: this.userId}