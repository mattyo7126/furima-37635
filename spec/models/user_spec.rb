require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "姓を入力してください"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前を入力してください"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "姓のふりがなを入力してください"
      end
      it 'fist_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前のふりがなを入力してください"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "誕生日を入力してください"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '123abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Eメールはすでに存在します"
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは128文字以内で入力してください"
      end
      it '英字のみのpasswordでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードには半角英字と数字の両方を含めて設定してください"
      end
      it '数字のみのpasswordでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには半角英字と数字の両方を含めて設定してください")
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'あ11111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには半角英字と数字の両方を含めて設定してください")
      end
      it 'last_nameに半角文字が含まれていると登録できない' do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include "姓には全角文字を使用してください"
      end
      it 'first_nameに半角文字が含まれていると登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前には全角文字を使用してください"
      end
      it 'last_name_kanaにカタカナ以外の文字が含まれていると登録できない' do
        @user.last_name_kana = '山だa1-'
        @user.valid?
        expect(@user.errors.full_messages).to include "姓のふりがなには全角カタカナを使用してください"
      end
      it 'first_name_kanaにカタカナ以外の文字が含まれていると登録できない' do
        @user.first_name_kana = '太ろうa1-'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前のふりがなには全角カタカナを使用してください'
      end
    end
  end
end
