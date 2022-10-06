class DiaryEntry
    def initialize(title, contents)
        @title = title
        @contents = contents
        @furthest_read = 0
    end 

    def title
        return @title
    end

    def contents
        return @contents
    end 

    def count_words
        @list = @contents.split(" ")
        @words = @list.length
        return @words
    end

    def reading_time(wpm)
        if @words <= wpm
            return 1
        else 
            return (@words / wpm.to_f).ceil
        end
    end

    def reading_chunk(wpm, minutes)
        if @words <= wpm
            return @contents
        else
            if @furthest_read >= @words
                @furthest_read = 0
            end
            chunk_to_read = wpm * minutes 
            start_from = @furthest_read
            end_at = (@furthest_read + chunk_to_read) 
            to_read = @list[start_from...end_at].join(" ")
            @furthest_read = end_at
            return to_read
        end

    end
end 

# diary = DiaryEntry.new("Jessica Rabbit", "Hello my name is Deborah Chinonye Nwankwo")
#         diary.count_words
#         puts diary.reading_chunk(2, 1)
#         puts diary.reading_chunk(2, 1)
#         puts diary.reading_chunk(2, 1)
#         puts diary.reading_chunk(2, 1)