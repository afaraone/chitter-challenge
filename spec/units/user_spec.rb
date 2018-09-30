describe User do
  describe '.all' do
    it 'returns empty array on creation' do
      expect(User.all).to be_empty
    end
  end

  describe '.add' do
    it 'stores an entry of user details' do
      a = User.add("James", "js", "example@example.com", "p123")
      expect(User.all).to include(a)
      expect(a.id).to eq(1)
      expect(a.name).to eq("James")
      expect(a.user).to eq("js")
      expect(a.email).to eq("example@example.com")
      expect(a.password).to eq("p123")
    end

    it 'does not store if email not unique' do
      User.add("James", "js", "example@example.com", "p123")
      User.add("Adam", "af", "example@example.com", "p456")
      expect(User.all.size).to eq(1)
    end

    it 'does not store if user not unique' do
      User.add("James", "js", "example@example.com", "p123")
      User.add("John", "js", "example123@example.com", "p456")
      expect(User.all.size).to eq(1)
    end
  end
end
