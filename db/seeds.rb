will = User.create(name: "Will")
zach = User.create(name: "Zack")

tama1 = Tama.create(name: "tama1", family: "the fam family")
tama2 = Tama.create(name: "tama2", family: "the fam family")
tama3 = Tama.create(name: "tama3", family: "the fam family")
tama4 = Tama.create(name: "tama4", family: "the fam family")
tama5 = Tama.create(name: "tama5", family: "the fam family")

adoption1 = Adoption.create(user_id: will.id, tama_id: tama1.id)
adoption2 = Adoption.create(user_id: zach.id, tama_id: tama2.id)
adoption3 = Adoption.create(user_id: will.id, tama_id: tama2.id)
adoption4 = Adoption.create(user_id: will.id, tama_id: tama3.id)