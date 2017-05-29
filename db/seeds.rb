# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#User.create(name: "Nguyen Van Hanh", email: "hanhnv.bkhn@gmail.com", password: "123456")

category_list = [
  "VietNam",
  "Korea",
  "Japan",
  "Europe"
]
food_list = [
  ["rau muong", 10000, "anh rau muong", "rau muong tuoi ngon, dam bao sach se"],
  ["rau ngot", 15000, "anh rau ngot", "rau ngot tuoi ngon, ve sinh an toan thuc pham"],
  ["thit bo", 120000, "anh thit bo", "thit bo sach, co ngon goc ro rang"],
  ["ca chua", 10000, "anh ca chua", "ca chua ngon, khong cay, nguon goc ro rang"],
  ["co ca", 7000, "anh co ca", "co ca nguyen chat, khong chua chat doc hai"],
  ["khoai tay chien", 30000, "anh khoai tay chien", "khoai tay chien ron"]
]
combo_list = [
  "2 trong 1",
  "khuyen mai chao mung 2 nam thanh lap"
]
Food.delete_all
food_list.each do |name, price, image, description|
  Food.create(name: name, price: price, image: image, description: description)
end

Category.delete_all
category_list.each do |name|
  Category.create(name: name)
end

CategoryFood.delete_all
CategoryFood.create(
  food_id: Food.find_by(name: "rau muong").id,
  category_id: Category.find_by(name: "VietNam").id
)
CategoryFood.create(
  food_id: Food.find_by(name: "rau muong").id,
  category_id: Category.find_by(name: "Korea").id
)
CategoryFood.create(
  food_id: Food.find_by(name: "rau muong").id,
  category_id: Category.find_by(name: "Japan").id
)
CategoryFood.create(
  food_id: Food.find_by(name: "rau ngot").id,
  category_id: Category.find_by(name: "Korea").id
)
CategoryFood.create(
  food_id: Food.find_by(name: "rau ngot").id,
  category_id: Category.find_by(name: "Europe").id
)
CategoryFood.create(
  food_id: Food.find_by(name: "rau ngot").id,
  category_id: Category.find_by(name: "Japan").id
)
CategoryFood.create(
  food_id: Food.find_by(name: "thit bo").id,
  category_id: Category.find_by(name: "Japan").id
)
CategoryFood.create(
  food_id: Food.find_by(name: "ca chua").id,
  category_id: Category.find_by(name: "Japan").id
)
Combo.delete_all
combo_list.each do |name|
  Combo.create(name: name)
end
ComboDetail.delete_all
ComboDetail.create(
  food_id: Food.find_by(name: "co ca").id,
  combo_id: Combo.find_by(name: "2 trong 1").id
)
ComboDetail.create(
  food_id: Food.find_by(name: "khoai tay chien").id,
  combo_id: Combo.find_by(name: "2 trong 1").id
)
ComboDetail.create(
  food_id: Food.find_by(name: "thit bo").id,
  combo_id: Combo.find_by(name: "khuyen mai chao mung 2 nam thanh lap").id
)
ComboDetail.create(
  food_id: Food.find_by(name: "rau muong").id,
  combo_id: Combo.find_by(name: "khuyen mai chao mung 2 nam thanh lap").id
)
ComboDetail.create(
  food_id: Food.find_by(name: "co ca").id,
  combo_id: Combo.find_by(name: "khuyen mai chao mung 2 nam thanh lap").id
)
