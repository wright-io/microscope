Template.newPosts.helpers {
  options: ->
    {sort: {submitted: -1}}
}

Template.bestPosts.helpers {
  options: ->
    {sort: {votes: -1}}
}

Template.postsList.helpers {
  postsWithRank: ->
    i = 0
    options = {sort: this.sort}

    return Posts.find({}, options)

  postsReady: ->
    this.handle.ready()

  allPostsLoaded: ->
    this.handle.ready() and Posts.find().count() < this.handle.loaded()
}

Template.postsList.events {
  'click .load-more': (event) ->
    event.preventDefault()
    this.handle.loadNextPage()
}