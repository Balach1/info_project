
describe Person do
  it "Should Initialize" do
    person = Person.new("joe", "bloggs", "1 Jan 1990")
    expect(person.class).to eq Person
    expect(person.dob).to eq "1 Jan 1990"
    expect(person.first_name.capitalize).to eq "Joe"
    expect(person.surname.capitalize).to eq "Bloggs"
    #expect(person.fullname).to eq person.first_name, person.surname
    expect(person.emails).to eq []
    expect(person.phone_numbers).to eq []
  end
  it "Should set dob" do
    person = Person.new
    person.dob = "1 Jan 1990"
    expect(person.dob).to eq "1 Jan 1990"
  end
  it "Should take person First name" do
    person = Person.new
    person.first_name = "Joe"
    expect(person.first_name).to eq "Joe"
  end 
  it "Should take person Surname" do
    person = Person.new
    person.surname = "Bloggs"
    expect(person.surname).to eq "Bloggs"
  end
  it "Should display full name" do
    person = Person.new
    person.first_name = "Joe"
    person.surname = "Bloggs"
    expect(person.fullname).to eq "Joe Bloggs"
  end
  it "Should take email address"do
    person = Person.new 
    person.add_email("joe@foo.com")
    person.add_email("joe.bloggs@work.com")
    expect(person.emails).to eq ["joe@foo.com","joe.bloggs@work.com"]
  end
  it "should take phone numbers"do
    person = Person.new
    person.add_phone_num("07712345678")
    person.add_phone_num("02012345678")
    expect(person.phone_numbers).to eq ["07712345678","02012345678"]
  end
  it "should delete a person's email" do
    person = Person.new
    person.add_email("joe@foo.com")
    person.add_email("joe.bloggs@work.com")
    expect(person.emails).to eq ["joe@foo.com","joe.bloggs@work.com"]
    person.remove_email("joe@foo.com")
    expect(person.emails).to eq ["joe.bloggs@work.com"]
  end
  it "should show string form of person" do
    person = Person.new("Joe", "Bloggs")
    person.add_email("joe@foo.com")
    person.add_email("joe.bloggs@work.com")
    person.add_phone_num("07712345678")
    person.add_phone_num("02012345678")
    expect(person.emails).to eq ["joe@foo.com","joe.bloggs@work.com"]
    person.remove_email("joe@foo.com")
    expect(person.emails).to eq ["joe.bloggs@work.com"]
    person.print_details()
    expect(person.to_st).to eq ("Joe Bloggs was born on 1 Jan 1990. Their email addresses are: [joe.bloggs@work.com]. Their phone numbers are [07712345678,02012345678]")

  end
end

