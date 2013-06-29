if Posts.find().count() is 0
  
  # Posts._ensureIndex(
  #   {
  #     title: 'text', description: 'text', street: 'text', city: 'text', state: 'text', deal: 'text'
  #   },
  #   {
  #     name: 'post_text_index'
  #   }
  # )

  now = new Date().getTime()

  tomId = Meteor.users.insert {
    profile: {name: 'Tom Coleman'}
  }

  tom = Meteor.users.findOne tomId

  paulId = Meteor.users.insert {
    profile: {name: 'Paul Motenko'}
  }

  paul = Meteor.users.findOne paulId

  stackedId = Posts.insert {
    title: 'STACKED - Food well built'
    deal: 'Become a STACKED friend to fight cystic fibrosis!'
    description: '''
      The STACKED experience is all about getting exactly what you want. We offer America’s
      favorite foods – Burgers, Pizza, Salads and Mac ‘n’ Cheese. Choose between dozens of
      ingredients to create the perfect meal for your taste. Or you can select one of our
      recommended signature items. STACKED is a full-service restaurant with an innovative ordering
      approach that enables you to control when you order and pay, and customize your meal in a
      comfortable, uninhibited way. Great food, exactly how you want it, and when you want it. In
      other words, Food Well Built!'
    '''
    shortDescription: '''
      The STACKED experience is all about getting exactly what you want. We offer America’s
      favorite
    '''
    street: '1234 Main St.'
    city: 'Hometown'
    state: 'CA'
    zip: 12345
    userId: paul._id
    author: paul.profile.name
    url: 'http://www.stacked.com'
    submitted: now - 1 * 3600 * 1000
    commentsCount: 2
    upvoters: [], votes: 0
  }

  Comments.insert {
    postId: stackedId
    userId: tom._id
    author: tom.profile.name
    submitted: now - 5 * 3600 * 1000
    body: 'I love this place!!!'
  }

  Comments.insert {
    postId: stackedId
    userId: paul._id
    author: paul.profile.name
    submitted: now - 3 * 3600 * 1000
    body: 'Thank you for all the great comments! We are proud to do everything we can to support the fight.'
  }

  Posts.insert {
    title: 'BJs Restaurant & Brewhouse'
    deal: 'Pizookies and more'
    description: '''
      "Welcome to BJ’s.” This is how you are greeted when you come into our welcoming, caring, 
      dependable, high-energy and fun casual restaurants, and we promise to do whatever it takes 
      to serve high-quality food and beverages to every guest consistently. We never forget that each 
      person has a choice in where to dine and we feel privileged each time you choose BJ’s.  
      Welcome! We are glad you are here.
    '''
    shortDescription: '''
      "Welcome to BJ’s.” This is how you are greeted when you come into our welcoming, caring, 
      depe
    '''
    street: '22 Twain St.'
    city: 'Lionel'
    state: 'CA'
    zip: 54321
    userId: tom._id
    author: tom.profile.name
    url: 'http://www.bjsbrewhouse.com/'
    submitted: now - 10 * 3600 * 1000
    commentsCount: 0
    upvoters: [], votes: 0
  }

  # Posts.insert {
  #   title: 'The Meteor Book'
  #   userId: tom._id
  #   author: tom.profile.name
  #   url: 'http://themeteorbook.com'
  #   submitted: now - 12 * 3600 * 1000
  #   commentsCount: 0
  #   upvoters: [], votes: 0
  # }

  # for i in [1..10]
  #   Posts.insert {
  #     title: 'Test post #' + i
  #     userId: paul._id
  #     author: paul.profile.name
  #     url: 'http://google.com/?q=test-' + i
  #     submitted: now - i * 3600 * 1000
  #     commentsCount: 0
  #     upvoters: [], votes: 0
  #   }
