Template.postSubmit.events {
	'submit form': (event) ->
		event.preventDefault()

		post = {
			title: $(event.target).find('[name=title]').val()
			url: $(event.target).find('[name=url]').val()
			street: $(event.target).find('[name=street]').val()
			city: $(event.target).find('[name=city]').val()
			state: $(event.target).find('[name=state]').val()
			zip: $(event.target).find('[name=zip]').val()
			deal: $(event.target).find('[name=deal]').val()
			description: $(event.target).find('[name=description]').val()
		}

		Meteor.call 'post', post, (error, id) ->
			if error?
				throwError error.reason
				if error.error is 302
					Meteor.Router.to 'postPage', error.details
			else
				Meteor.Router.to 'postPage', id
}