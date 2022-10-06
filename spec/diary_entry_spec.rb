require "diary_entry"

RSpec.describe DiaryEntry do 
    it "returns the title of diary" do 
        diary = DiaryEntry.new("Jessica Rabbit", "This is Jessica Rabbit")
        results = diary.title
        expect(results).to eq "Jessica Rabbit"
    end

    it "returns the contents of diary" do 
        diary = DiaryEntry.new("Jessica Rabbit", "This is Jessica Rabbit")
        results = diary.contents
        expect(results).to eq "This is Jessica Rabbit"
    end

    it "returns 4" do
        diary = DiaryEntry.new("Jessica Rabbit", "This is Jessica Rabbit")
        results = diary.count_words 
        expect(results).to eq 4
    end

    it "returns 1 minute" do
        diary = DiaryEntry.new("Jessica Rabbit", "This is Jessica Rabbit")
        diary.count_words
        results = diary.reading_time(200) 
        expect(results).to eq 1
    end

    it "returns 2 minutes" do
        diary = DiaryEntry.new("Jessica Rabbit", "test " * 400)
        diary.count_words
        results = diary.reading_time(200) 
        expect(results).to eq 2
    end

    it "returns 'Nwankwo' back in string format" do
        diary = DiaryEntry.new("Jessica Rabbit", "Hello my name is Deborah Chinonye Nwankwo")
        diary.count_words
        diary.reading_chunk(2, 1)
        diary.reading_chunk(2, 1)
        diary.reading_chunk(2, 1)
        results = diary.reading_chunk(2, 1)
        expect(results).to eq "Nwankwo"
    end

    it "returns content back in string format" do
        diary = DiaryEntry.new("Jessica Rabbit", "Hello my name is Deborah Chinonye Nwankwo")
        diary.count_words
        diary.reading_chunk(1, 1)
        diary.reading_chunk(1, 1)
        diary.reading_chunk(1, 1)
        diary.reading_chunk(1, 1)
        diary.reading_chunk(1, 1)
        diary.reading_chunk(1, 1)
        diary.reading_chunk(1, 1)
        diary.reading_chunk(1, 1)
        results = diary.reading_chunk(1, 1)
        expect(results).to eq "my"
    end

    it "returns an error if no string given" do
        diary = DiaryEntry.new("Jessica Rabbit", "Hello my name is Deborah Chinonye Nwankwo")
        diary.count_words
        diary.reading_chunk(1, 1)
        diary.reading_chunk(1, 1)
        diary.reading_chunk(1, 1)
        diary.reading_chunk(1, 1)
        diary.reading_chunk(1, 1)
        diary.reading_chunk(1, 1)
        diary.reading_chunk(1, 1)
        diary.reading_chunk(1, 1)
        results = diary.reading_chunk(1, 1)
        expect(results).to eq "my"
    end

end