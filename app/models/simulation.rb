require 'csv'

class Simulation
  def initialize(number_of_initial_cases: 30, number_of_stickers: 3)
    @people = {}
    @records = []
    @number_of_stickers = number_of_stickers
    number_of_initial_cases.times { |x| @people[x] = number_of_stickers }
    FakeRecord.reset(number_of_initial_cases)
  end

  def run(interaction_count: 150)
    interaction_count.times do
      source = give_sticker
      new_record = FakeRecord.new(source)
      @records << new_record
      @people[new_record.id] = @number_of_stickers
    end
  end

  def data
    column_names = Record.column_names
    CSV.generate do |csv|
      csv << column_names
      @records.each do |record|
        csv << column_names.map { |c| record.send(c) }
      end
    end
  end

  private

  def give_sticker
    person = @people.keys.sample
    stickers_left = @people[person]
    if stickers_left == 1
      @people.delete(person)
    else
      @people[person] = stickers_left - 1
    end
    person
  end

  class FakeClock
    def self.now
      @now ||= Time.now
      @now += rand(60*3) + 30
    end
  end

  class FakeRecord
    attr_reader :id, :source_id, :gender, :age_range, :infection_location, :created_at, :updated_at

    def self.reset(next_id)
      @next_id = next_id
    end

    def self.next_id
      value = @next_id
      @next_id += 1
      value
    end

    def initialize(source_id)
      @source_id = source_id
      @gender = Record.genders.keys.sample
      @age_range = Record.age_ranges.keys.sample
      @infection_location = Record.infection_locations.keys.sample
      @created_at = @updated_at = FakeClock.now
      @id = FakeRecord.next_id
    end
  end
end
