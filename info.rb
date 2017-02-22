class Person 
attr_accessor :dob, :first_name, :surname, :fullname, :phone_numbers
attr_reader :emails, :phone_numbers
  
  def initialize (first_name ='Joe', surname ='Bloggs', dob = "1 Jan 1990")
    @dob = dob
    @first_name = first_name
    @surname = surname
    @fullname = first_name + ' ' + surname
    @emails = []  
    @phone_numbers = []
  end

  def add_email(email)
    @emails.push(email)
  end

  def add_phone_num(phone_number)
    @phone_numbers.push(phone_number)
  end
  
  def remove_email(email)
    index = @emails.index(email)
    @emails.slice!(index)
  end

  def to_st
      return "#{@fullname} was born on #{@dob}. Their email addresses are: #{@emails}.Their phone numbers are #{@phone_numbers}"
  end

  def print_details 

    emailsStr = "";
    @emails.each do |email|
      emailsStr += "- #{email} \n" 
    end

    phonesStr = ""
    @phone_numbers.each do |phones|
      phonesStr += "- #{phones} \n" 
    end

    puts "#{@fullname}" 
    puts "\n"
    puts  "--------------"
    puts "\n"
    puts  "Date of Birth: #{@dob}"
    puts "\n"
    puts  "Email Addresses: #{emailsStr}"
    puts  "Phone Numbers:\n #{phonesStr}"

    
  end
end