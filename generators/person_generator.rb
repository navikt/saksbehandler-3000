#!/usr/bin/env ruby
# frozen_string_literal: true

require 'date'
require 'json'

require_relative 'first_names'
require_relative 'last_names'
require_relative 'streets'

def rand_in_range(from, to)
  from, to = to, from if to < from
  rand(from..to)
end

def birthday_date(date, age)
  year = date.year - age

  day =
    if date.day == 29 && date.month == 2 && !::Date.leap?(year)
      28
    else
      date.day
    end

  ::Date.new(year, date.month, day)
end

def birthday(min_age: 18, max_age: 65)
  t = ::Date.today

  from = birthday_date(t, max_age)
  to   = birthday_date(t, min_age)

  rand_in_range(from, to).to_date
end

def gen_birth_date
  birthday
end

def gen_post_number
  format('%04d', rand(9999))
end

def gen_work
  rand(10) > 3
end

def gen_person_number
  format('%04d', rand(9999))
end

def gen_address
  format('%s %d', get_address, rand(25) + 1)
end

def create_person
  first_name, gender = get_first_name
  return {
    first_name: first_name,
    last_name: get_last_name,
    work: gen_work,
    birth_date: gen_birth_date,
    person_number: gen_person_number,
    street_address: gen_address,
    post_number: gen_post_number,
    gender: gender
  }
end

if ARGV.size == 1
  users = ARGV[0].to_i
  print '['
  (0...users).each do |i|
    print create_person.to_json
    print ',' unless (i + 1) == users
  end
  puts ']'
else
  puts create_person.to_json
end
