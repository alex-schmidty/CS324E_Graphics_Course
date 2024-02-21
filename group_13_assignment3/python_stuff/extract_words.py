import pathlib 

def main():
    wordDict ={}
    with open(pathlib.Path(__file__).parent / 'novel.txt', encoding = 'ASCII', errors = "ignore") as full_txt:
        lines = full_txt.readlines()
        with open(pathlib.Path(__file__).parent / 'allwords.txt', 'w') as allwords:
            for line in lines:
                words = line.split(' ')
                for word in words:
                    word = modifyString(word)
                    if word:
                        allwords.write(word + '\n')
                        if word in wordDict:
                            wordDict[word] += 1
                        else:
                            wordDict[word] = 1
    with open(pathlib.Path(__file__).parent / "uniquewords.txt", "w") as uniquewords:
        for key in wordDict.keys():
            uniquewords.write(key+'\n')
    with open(pathlib.Path(__file__).parent / "wordfrequency.txt", "w") as wordfrequency:
        values = list(wordDict.values())
        maxVal = max(values)
        for i in range(1, maxVal+1):
            wordfrequency.write( str(i) + ":" + str(values.count(i)) +"\n")

# lowers case and removes non-letter chars
def modifyString(string):
    newString = ''
    for char in string.lower():
        if 'a' <= char <= 'z':
            newString += char
    return newString

if __name__ == '__main__':
    main()
