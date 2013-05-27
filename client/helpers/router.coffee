Meteor.Router.add {
	'/': 'postsList',
	'/posts/:_id': {
		to: 'postPage',
		and: (id) ->
			Session.set 'currentPostId', id
	},
	'/submit': 'postSubmit'
}

Meteor.Router.filters {
	'requireLogin': (page) ->
		if Meteor.user()
			page
		else
			'accessDenied'
}

Meteor.Router.filter 'requireLogin', {only: 'postSubmit'}