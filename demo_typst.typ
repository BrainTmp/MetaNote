#import "metanote.typ": *

#show: doc => MetaNote(
  title: [
    An Introduction to Elementology (A)
  ],
  authors: (
    (
      name: "Impact",
      affiliation: "University of Genshin",
      email: "genshinimpact@gmail.com",
    ),
        (
      name: "Genshin",
      affiliation: "Teyvat Health University",
      email: "GenshinTHU@gmail.com",
    ),
  ),
  doc,
)

= The Study of Elemental Energy

== Character Energy Regeneration

We have discovered that the elemental energy of the world is closely related to the elemental attributes of the characters. When a character comes into contact with elemental energy, it triggers an energy recovery. The energy recovery value for the corresponding character is influenced by factors such as team size, the elemental attribute of the character and the elemental energy, and the elemental recharge efficiency.

#theorem("Character Energy Regeneration")[
  When a character in the field comes into contact with energy drops (referred to as "spheres" hereafter, including particles or crystals), it triggers an energy recovery. Both on-field and off-field characters can obtain energy.

  The energy recovery value for the corresponding character is influenced by factors such as team size, the elemental attribute of the character and the energy drop, and the elemental recharge efficiency.

  The calculation formula is as follows: Actual energy recovery value = Basic energy recovery value $times$ Elemental conversion coefficient $times$ Team allocation coefficient $times$ Current elemental recharge efficiency.
]

#proof[
  I don't have access to the specific game mechanics or code to provide direct proof of this conclusion. However, the information you provided aligns with common gameplay mechanics in many RPG and adventure games, where characters can gain energy or mana by interacting with specific objects or elements within the game world. This mechanic is often influenced by various factors such as team composition, character attributes, and environmental elements.

  To further validate this conclusion for Genshin Impact, I recommend consulting the official game documentation, community forums, or reaching out to the game's support channels for detailed information on energy recovery mechanics and calculations.
]

=== Basic Energy Recovery Value

#corollary()[
  The basic energy recovery value is determined by the energy drop and the elemental attribute of the character. The basic energy recovery value of the same energy drop is different for different elemental attributes.
]

#note[
  Note that the basic energy recovery value is not affected by the elemental recharge efficiency, and the elemental conversion coefficient is 1, so we arrived at a strong conclusion that the basic energy recovery value is determined by the energy drop and the elemental attribute of the character.
]

Now we enter the next stage of the proof. We will first prove that the basic energy recovery value is determined by the energy drop and the elemental attribute of the character. Then we will prove that the basic energy recovery value of the same energy drop is different for different elemental attributes.