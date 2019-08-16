@contacts = []

def display_menu
  puts "\n--- Ruby Contact List ---"
  puts "\nSelect from the following options:"
  puts "1) View Contacts"
  puts "2) Add Contact"
  puts "3) Edit Contact"
  puts "4) Delete Contact"
  puts "5) Exit"
  print "> "

  case gets.strip
  when "1"
    show_contacts
    display_menu
  when "2"
    add_contact
    display_menu
  when "3"
    edit_contact
    display_menu
  when "4"
    delete_contact
    display_menu
  when "5"
    abort "\nExiting contacts list\n"
  else
    puts "Input not recognized. Try again."
    display_menu
  end
end

def show_contacts
  if @contacts.empty?
    no_contacts
  else
    puts "\n*** Contact List ***"
    @contacts.each_with_index do |contact, index|
    puts " #{index + 1}) Name: #{contact[:name]}\tPhone Number: #{contact[:phone_number]}"
    end
  end
end

def add_contact
  puts "\nWhat is the name of your contact?"
  print "> "
  @contacts << {:name => gets.strip}
  puts "What is #{@contacts.last[:name]}'s phone number?"
  @contacts.last[:phone_number] = gets.strip
  puts "\nDo you have any more contacts to add? y/n"
  print "> "
  if gets.strip == "y"
    add_contact
  else
    puts "\nReturning to main menu..."
  end
end

def edit_contact
  if @contacts.empty?
    no_contacts
  else
    show_contacts
    puts "\nWhich contact would you like to edit?"
    print "> "
    pointer = gets.to_i
    puts "\nWhat is the new name for this contact?"
    print "> "
    name = gets.strip
    @contacts[pointer - 1][:name] = name
    puts "\nWhat is the new phone number for #{name}"
    print "> "
    number = gets.strip
    @contacts[pointer -1][:phone_number] = number

    puts "\nIs this correct? y/n"
    show_contacts
    print "> "
    if gets.strip == "n"
      edit_contact
    else
      puts "\nReturning to the main menu..."
    end
  end
end

def no_contacts
  puts "\nThere are no contacts in your list to display."
  puts "Returning to the main menu"
  display_menu
end

def delete_contact
  if @contacts.empty?
    no_contacts
  else
    show_contacts
    puts "\nWhich contact would you like to delete?"
    print "> "
    pointer = gets.to_i
    name = @contacts[pointer - 1]
    puts "#{name[:name]} has been deleted..."
    @contacts.delete_at(pointer - 1)

    if !@contacts.empty?
      puts "\nIs there another contact you'd like delete? y/n"
      print "> "
      if gets.strip == "y"
        delete_contact
      end
    else
      puts "\nAll contacts have been removed."
      puts "Returning to the main menu..."
    end
  end
end

display_menu