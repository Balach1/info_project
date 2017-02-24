
describe Person do
  let(:person){person = Person.new("joe", "bloggs", "1 Jan 1990") }
  it "Should Initialize" do
  
  expect(person.dob.strftime('%-d %b %Y')).to eq "1 Jan 1990"
  expect(person.first_name.capitalize).to eq "Joe"
  expect(person.surname.capitalize).to eq "Bloggs"
  expect(person.emails).to eq []
  expect(person.phone_numbers).to eq []
  end
  it "Should take dob" do
  person.dob = "01 jan 1990"
  expect(person.dob).to eq "01 jan 1990"
  end
  it "Should take person First name" do
  
  person.first_name = "Joe"
  expect(person.first_name).to eq "Joe"
  end 
  it "Should take person Surname" do
  
  person.surname = "Bloggs"
  expect(person.surname).to eq "Bloggs"
  end
  it "Should display full name" do
  
  person.first_name = "Joe"
  person.surname = "Bloggs"
  expect(person.fullname).to eq "Joe Bloggs"
  end
  it "Should take email address"do
   
  person.add_email("joe@foo.com")
  person.add_email("joe.bloggs@work.com")
  expect(person.emails).to eq ["joe@foo.com","joe.bloggs@work.com"]
  end
  it "should take phone numbers"do
  
  person.add_phone_num("07712345678")
  person.add_phone_num("02012345678")
  expect(person.phone_numbers).to eq ["07712345678","02012345678"]
  end
  it "should delete a person's email" do
  
  person.add_email("joe@foo.com")
  person.add_email("joe.bloggs@work.com")
  expect(person.emails).to eq ["joe@foo.com","joe.bloggs@work.com"]
  person.remove_email("joe@foo.com")
  expect(person.emails).to eq ["joe.bloggs@work.com"]
  end
  it "should show string form of person" do
  person.add_email("joe@foo.com")
  person.add_email("joe.bloggs@work.com")
  person.add_phone_num("07712345678")
  person.add_phone_num("02012345678")
  expect(person.emails).to eq ["joe@foo.com","joe.bloggs@work.com"]
  person.remove_email("joe@foo.com")
  expect(person.emails).to eq ["joe.bloggs@work.com"]
  expect(person.to_st).to eq ("Joe Bloggs was born on 1990-01-01. Their email addresses are: [\"joe.bloggs@work.com\"].Their phone numbers are [\"07712345678\", \"02012345678\"]")
  person.print_details()
  end
end

  describe AddressBook do
    let(:person1){person1 = Person.new("joe", "blogs", "1 Jan 1990")}
    let(:person2){person2 = Person.new("andy", "nother", "2 Jan 1995")}
    let(:book){book = AddressBook.new}
    let(:entries){entries = AddressBook.new}
    it "should Initialize"do
    expect([].entries).to eq []
  end
  it "should add details to address book"do
    book.add_p(person1)
    book.add_p(person2)
    expect(book.entries).to eq ([person1, person2])

  end

end
