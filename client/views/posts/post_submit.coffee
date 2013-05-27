Template.postSubmit.events {
	'submit form': (event) ->
		event.preventDefault()

		post = {
			url: $(event.target).find('[name=url]').val(),
			title: $(event.target).find('[name=title]').val(),
			message: $(event.target).find('[name=message]').val()
		}

		post._id = Posts.insert post
		Meteor.Router.to 'postPage', post
}