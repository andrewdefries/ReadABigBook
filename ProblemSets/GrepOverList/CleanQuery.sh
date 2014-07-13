cat IndexList.txt | sed 's/"[^"]*"//' | sed 's/"//g' | cut -c 2-300 > query


pico query
