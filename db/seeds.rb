# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "json"

catalog_path = Rails.root.join("db/seed_data/streetball_items.json")
catalog = JSON.parse(File.read(catalog_path))

rarity_xp_bonus = {
	"Commun" => 1,
	"Rare" => 5,
	"Épique" => 10,
	"Légendaire" => 20
}

catalog.fetch("items", []).each do |item_data|
	attributes = item_data.fetch("attributes", {})

	item = Item.find_or_initialize_by(name: item_data["name"])
	item.assign_attributes(
		slot: item_data["type"].to_s.underscore,
		life_delta: attributes["vie"],
		strength_delta: attributes["agility"].to_i + attributes["disruption"].to_i,
		xp_bonus: rarity_xp_bonus.fetch(item_data["rarity"], 0),
		image_url: item_data["asset"],
		item_type: item_data["type"],
		rarity: item_data["rarity"],
		price: item_data["price"],
		stats: attributes,
		modifiers: item_data["modifiers"],
		asset: item_data["asset"],
		description: item_data["flavor_text"]
	)
	item.save!
end

require "json"

catalog_path = Rails.root.join("db", "seed_data", "streetball_items.json")
catalog = JSON.parse(File.read(catalog_path))

catalog.fetch("items", []).each do |item_data|
	attributes = item_data.fetch("attributes", {})
	modifiers = item_data.fetch("modifiers", {})

	item = Item.find_or_initialize_by(name: item_data.fetch("name"))
	item.assign_attributes(
		slot: item_data.fetch("type"),
		item_type: item_data.fetch("type"),
		rarity: item_data.fetch("rarity"),
		price: item_data.fetch("price"),
		stats: attributes,
		modifiers: modifiers,
		description: item_data.fetch("flavor_text"),
		image_url: item_data.fetch("asset"),
		life_delta: attributes["vie"] || 0,
		strength_delta: attributes["agility"] || 0,
		xp_bonus: attributes["disruption"] || 0
	)
	item.save!
end

# Minimal game seed: one quest, two steps, one riddle, one item reward
reward = Item.find_or_create_by!(name: "Épée d'initiation") do |i|
	i.slot = "weapon"
	i.life_delta = 0
	i.strength_delta = 2
	i.xp_bonus = 0
	i.image_url = ""
	i.item_type = "weapon"
	i.rarity = "Commun"
	i.price = 10
	i.stats = {}
	i.modifiers = {}
	i.description = "Une épée simple pour débuter."
end

quest = Quest.find_or_create_by!(title: "La première quête") do |q|
	q.description = "Participez à votre première aventure."
	q.reward_xp = 50
	q.published = true
end

step1 = Step.find_or_create_by!(quest: quest, position: 1) do |s|
	s.step_type = "riddle"
	s.reward_xp = 20
end

step2 = Step.find_or_create_by!(quest: quest, position: 2) do |s|
	s.step_type = "battle"
	s.reward_xp = 30
end

Riddle.find_or_create_by!(step: step1, question: "Quel est le Moov secret ?") do |r|
	r.answers = ["Triple Menace", "Shoot", "Goo_Drible", "Cross", "Spin", "Fake", "Pass"]
	r.correct_answer = "Drible"
end

QuestReward.find_or_create_by!(quest: quest, item: reward)
