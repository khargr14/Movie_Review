# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


     movie = Movie.create([{
        title: 'Baby Mama', 
        description: 'When straightlaced Kate learns shes infertile, she hires immature Angie to be her surrogate, inviting hilarity as both women prepare for motherhood.', 
        director: 'Michael McCullers', 
        movie_length: '1h 38m'}])

     movie = Movie.create([{
        title: 'A Bad Moms Christmas', 
        description: 'Stressed-out moms Amy, Carla and Kiki are back, and the looming Christmas holiday gets even more daunting when their mothers show up for a visit.', 
        director: 'Jon Lucas', 
        movie_length: '1h 44m'}])

     movie = Movie.create([{
        title: 'Bird Box', 
        description: 'Five years after an ominous unseen presence drives most of society to suicide, a survivor and her two children make a desperate bid to reach safety.',
        director: 'Susanne Bier', 
        movie_length: '2h 4m'}])

     movie = Movie.create([{
        title: 'A Fall From Grace', 
        description: 'When gentle, law-abiding Grace confesses to killing her new husband, her skeptical young lawyer sets out to uncover the truth.',
        director: 'Tyler Perry', 
        movie_length: '2h '}])

    movie = Movie.create([{
        title: 'The Notebook', 
        description: "Two young lovers are torn apart by war and class differences in the 1940s in this adaptation of Nicholas Sparks's best-selling novel.",
        director: 'Nick Cassavetes', 
        movie_length: '2h 3m'}])

    movie = Movie.create([{
        title: '50 First Dates', 
        description: 'After falling for a pretty art teacher who has no short-term memory, a marine veterinarian has to win her over again every single day.',
        director: 'Peter Segal', 
        movie_length: '1h 39m'}])
        