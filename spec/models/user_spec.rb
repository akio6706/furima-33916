require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '入力するところが全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上で英字と数字の両方を含んでいればあれば登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        expect(@user).to be_valid
      end
      it 'ユーザー本名を全角（漢字・ひらがな・カタカナ）で入力すれば登録できる' do
        @user.last_name = '山だノ'
        @user.first_name = '太ろウ'
        expect(@user).to be_valid
      end
      it 'ユーザー本名のフリガナを全角（カタカナ）で入力すれば登録できる' do
        @user.last_kana = 'ヤマダ'
        @user.first_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name は苗字を入力して下さい。')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name は名前を入力して下さい。')
      end
      it 'last_kanaが空では登録できない' do
        @user.last_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank", 'Last kana はカタカナで入力して下さい。')
      end
      it 'first_kanaが空では登録できない' do
        @user.first_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank", 'First kana はカタカナで入力して下さい。')
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'test0'
        @user.password_confirmation = 'test0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字で入力して下さい。')
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字で入力して下さい。')
      end
      it 'passwordが全角では登録できないこと' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字で入力して下さい。')
      end
      it 'last_nameが半角文字だと登録できないこと' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は苗字を入力して下さい。')
      end
      it 'first_nameが半角文字だと登録できないこと' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は名前を入力して下さい。')
      end
      it 'last_kanaが半角文字だと登録できない' do
        @user.last_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana はカタカナで入力して下さい。')
      end
      it 'last_kanaがカタカナ以外の全角文字だと登録できない' do
        @user.last_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana はカタカナで入力して下さい。')
      end
      it 'first_kanaが半角文字だと登録できない' do
        @user.first_kana = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana はカタカナで入力して下さい。')
      end
      it 'first_kanaがカタカナ以外の全角文字だと登録できない' do
        @user.first_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana はカタカナで入力して下さい。')
      end
    end
  end
end
