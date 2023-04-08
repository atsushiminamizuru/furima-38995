require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name
      first_name_kanaとlast_name_kana、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailが固有かつ@を含んでいれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上128文字以下であれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合での入力であれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが一致していれば登録できる' do
        expect(@user).to be_valid
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）での入力であれば登録できる' do
        expect(@user).to be_valid
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）での入力であれば登録できる' do
        expect(@user).to be_valid
      end
      it 'first_name_kanaは全角（カタカナ）での入力であれば登録できる' do
        expect(@user).to be_valid
      end
      it 'last_name_kanaは全角（カタカナ）での入力であれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'パスワードに半角英字が含まれていない場合、登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'パスワードに半角数字が含まれていない場合、登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'パスワードに半角記号が含まれている場合、登録できない' do
        @user.password = '123ab%'
        @user.password_confirmation = '123ab%'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'パスワードに半角カタカナが含まれている場合、登録できない' do
        @user.password = '123abｨ'
        @user.password_confirmation = '123abｨ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'パスワードに全角英字が含まれている場合、登録できない' do
        @user.password = '123abＡ'
        @user.password_confirmation = '123abＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'パスワードに全角数字が含まれている場合、登録できない' do
        @user.password = '123ab６'
        @user.password_confirmation = '123ab６'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'パスワードに全角記号が含まれている場合、登録できない' do
        @user.password = '123ab％'
        @user.password_confirmation = '123ab％'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'パスワードに全角（漢字・ひらがな・カタカナ）が含まれている場合、登録できない' do
        @user.password = '123ab練しゅウ'
        @user.password_confirmation = '123ab練しゅウ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）ではない場合、登録できない' do
        @user.first_name = 'Tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）ではない場合、登録できない' do
        @user.last_name = 'Abe'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end
      it 'first_name_kanaは全角（カタカナ）ではない場合、登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
      it 'last_name_kanaは全角（カタカナ）ではない場合、登録できない' do
        @user.last_name_kana = 'あべ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
    end
  end
end
