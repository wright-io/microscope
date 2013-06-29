# @newPostsHandle = Meteor.subscribeWithPagination 'newPosts', word, 5
# @bestPostsHandle = Meteor.subscribeWithPagination 'bestPosts', word, 5
#Meteor.subscribe 'newPosts', 'stack'
Session.set 'keyword', 'bj'

Deps.autorun ->
  Meteor.subscribe 'singlePost', Session.get('currentPostId')
  Meteor.subscribe 'comments', Session.get('currentPostId')
  Meteor.subscribe 'newPosts', {keyword: Session.get 'keyword'}

Meteor.subscribe 'notifications'

