# frozen_string_literal: true

require 'pry'

ANIMALS = [
  {
    species: 'monkey',
    age: 3,
    sex: 'male'
  },
  {
    species: 'monkey',
    age: 11,
    sex: 'male'
  },
  {
    species: 'monkey',
    age: 1,
    sex: 'male'
  },
  {
    species: 'squirrel',
    age: 5,
    sex: 'female'
  },
  {
    species: 'bear',
    age: 8,
    sex: 'female'
  },
  {
    species: 'bear',
    age: 4,
    sex: 'male'
  },
  {
    species: 'parrot',
    age: 1,
    sex: 'female'
  },
  {
    species: 'parrot',
    age: 6,
    sex: 'female'
  },
  {
    species: 'parrot',
    age: 4,
    sex: 'female'
  },
  {
    species: 'parrot',
    age: 5,
    sex: 'male'
  }
].freeze

PERMITTED_KEYS = %i[species age sex].freeze

class Animal
  attr_reader :result

  class << self
    def method_missing(name, *args)
      Animal.new.public_send(name, *args)
    end
  end

  def initialize
    @result = ANIMALS
  end

  def males
    @result = @result.select { |a| a[:sex] == 'male' }
    self
  end

  def females
    @result = @result.select { |a| a[:sex] == 'female' }
    self
  end

  def method_missing(name, *args)
    case name
    when /_less_than$/
      attr_name = name.to_s.sub(/_less_than$/, '').to_sym
      super unless PERMITTED_KEYS.include?(attr_name)
      @result = @result.select { |a| a[attr_name] < args[0] }
      self
    when /_greater_than$/
      attr_name = name.to_s.sub(/_greater_than$/, '').to_sym
      super unless PERMITTED_KEYS.include?(attr_name)
      @result = @result.select { |a| a[attr_name] > args[0] }
      self
    when /ies$/
      attr_name = "#{name.to_s.sub(/ies$/, '')}y"
      @result = @result.select { |a| a[:species] == attr_name }
      self
    when /s$/
      attr_name = name.to_s.sub(/s$/, '')
      @result = @result.select { |a| a[:species] == attr_name }
      self
    else
      super
    end
  end
end

binding.pry
