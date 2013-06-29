Meteor.publish 'newPosts', (keyword, limit) ->
  
  # NOTE: used to have: query = new RegExp(options.keyword, 'i')
  # Didn't work correctly without refreshing server (e.g. saving code)
  # Code below seems to work - was based on https://github.com/meteor/meteor/issues/1089
  # Maybe this is fixed in later meteor versions?
  query = {$regex: (keyword), $options: 'i'}

  Posts.find({$or: [{title: query}, {description: query}, {deal: query}, {street: query}, {city: query}, {state: query}, {zip: query}, {author: query}]}, {sort: {submitted: -1}, limit: limit})

Meteor.publish 'bestPosts', (keyword, limit) ->

  # NOTE: used to have: query = new RegExp(options.keyword, 'i')
  # Didn't work correctly without refreshing server (e.g. saving code)
  # Code below seems to work - was based on https://github.com/meteor/meteor/issues/1089
  # Maybe this is fixed in later meteor versions?
  query = {$regex: (keyword), $options: 'i'}

  Posts.find({$or: [{title: query}, {description: query}, {deal: query}, {street: query}, {city: query}, {state: query}, {zip: query}, {author: query}]}, {sort: {votes: -1, submitted: -1}, limit: limit})

Meteor.publish 'singlePost', (id) ->
  Posts.find id

Meteor.publish 'comments', (postId) ->
  Comments.find({postId: postId})

Meteor.publish 'notifications', ->
  Notifications.find {userId: this.userId}