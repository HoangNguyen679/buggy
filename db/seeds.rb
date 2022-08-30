user1 = User.create!(
  email: 'sam@example.org',
  username: 'samsam',
  password: 'sam-password',
)

user2 = User.create!(
  email: 'adam@example.org',
  username: 'adam123',
  password: 'adam-password',
)

Medium.create!(
  title: 'How I Met Your Mother - TOP 5 Moments',
  description: 'ALL RIGHTS BELONG TO 20TH CENTURY FOX , CBS AND RESPECTIVE OWNERS. NO COPYRIGHT INFRINGEMENT INTENDED.
    MADE AS A TRIBUTE AND FOR ENTERTAINMENT PURPOSES ONLY.',
  url: 'https://www.youtube.com/watch?v=sCUEc7ZGGeU',
  user: user1,
)

Medium.create!(
  title: 'Friends Best Moments From Season 2',
  description: 'joey and chandler friendship quotes
    joey and chandler bromance quotes
    joey and chandler hug
    joey and chandler wallpaper
    joey to my chandler quotes
    joey and chandler fanfiction
    joey and chandler kiss
    chandler and joey friends in real life',
  url: 'https://www.youtube.com/watch?v=7rDeTPxIz-Q',
  user: user1,
)

Medium.create!(
  title: 'The Big Bang Theory | Best of Sheldon | HBO Max',
  description: "HBO Max is WarnerMedia's direct-to-consumer offering with 10,000 hours of curated premium content.
    HBO Max offers powerhouse programming for everyone in the home, bringing together HBO, a robust slate of new
    original series, key third-party licensed programs and movies, and fan favorites from WarnerMedia’s rich library
    including Warner Bros., New Line, DC, CNN, TNT, TBS, truTV, Turner Classic Movies, Cartoon Network, Adult Swim,
    Crunchyroll, Rooster Teeth, Looney Tunes and more",
  url: 'https://www.youtube.com/watch?v=U1KGRnWjllg',
  user: user2,
)
