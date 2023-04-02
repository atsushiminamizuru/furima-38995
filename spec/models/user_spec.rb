require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "安倍", last_name: "太郎", first_name_kana: "アベ", last_name_kana: "タロウ", birth_date: "1933/11/12")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000", first_name: "安倍", last_name: "太郎", first_name_kana: "アベ", last_name_kana: "タロウ", birth_date: "1933/11/12")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空だと登録できない' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "", password_confirmation: "00000000", first_name: "安倍", last_name: "太郎", first_name_kana: "アベ", last_name_kana: "タロウ", birth_date: "1933/11/12")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'password_confirmationが空だと登録できない' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "", first_name: "安倍", last_name: "太郎", first_name_kana: "アベ", last_name_kana: "タロウ", birth_date: "1933/11/12")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'first_nameが空だと登録できない' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "", last_name: "太郎", first_name_kana: "アベ", last_name_kana: "タロウ", birth_date: "1933/11/12")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_nameが空だと登録できない' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "安倍", last_name: "", first_name_kana: "アベ", last_name_kana: "タロウ", birth_date: "1933/11/12")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_name_kanaが空だと登録できない' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "安倍", last_name: "太郎", first_name_kana: "", last_name_kana: "タロウ", birth_date: "1933/11/12")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'last_name_kanaが空だと登録できない' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "安倍", last_name: "太郎", first_name_kana: "アベ", last_name_kana: "", birth_date: "1933/11/12")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'birth_dateが空だと登録できない' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "安倍", last_name: "太郎", first_name_kana: "アベ", last_name_kana: "タロウ", birth_date: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birth date can't be blank")
    end
    it "emailが重複している場合は登録できない" do
      User.create(nickname: "tanaka", email: "tanaka@example.com", password: "00000000", password_confirmation: "00000000", first_name: "安倍", last_name: "太郎", first_name_kana: "アベ", last_name_kana: "タロウ", birth_date: "1933/11/12")
      user = User.new(nickname: "yamada", email: "tanaka@example.com", password: "password", password_confirmation: "password", first_name: "花子", last_name: "山田", first_name_kana: "ハナコ", last_name_kana: "ヤマダ", birth_date: "2000-01-02")
      user.valid?
      expect(user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailが@を含まない場合は登録できない" do
      user = User.new(nickname: "abe", email: "invalid-email", password: "00000000", password_confirmation: "00000000", first_name: "安倍", last_name: "太郎", first_name_kana: "アベ", last_name_kana: "タロウ", birth_date: "1933/11/12")
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが6文字未満だと登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "12345", password_confirmation: "12345", first_name: "安倍", last_name: "太郎", first_name_kana: "アベ", last_name_kana: "タロウ", birth_date: "1933/11/12")
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordとpassword_confirmationが一致しないと登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "11111111", first_name: "安倍", last_name: "太郎", first_name_kana: "アベ", last_name_kana: "タロウ", birth_date: "1933/11/12")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
