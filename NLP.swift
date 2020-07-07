import NaturalLanguage
//https://developer.apple.com/documentation/naturallanguage

//1 Text preprocessing

//1.1 Language Identification
//Supported languages: https://developer.apple.com/documentation/naturallanguage/nllanguage
//let recognizer = NLLanguageRecognizer()
//recognizer.processString("订阅我的频道") //can be called multiple times in a row if text has multiple parts
//if let lang = recognizer.dominantLanguage { //best hypotheses
//    print(lang.rawValue)
//}
//let hypotheses = recognizer.languageHypotheses(withMaximum:4) //specify max number of returned languages
//for (key, probability) in hypotheses {
//    print("\(key.rawValue) - \(probability)")
//}

//1.2 Tokenization
//let tokenizer = NLTokenizer(unit: .word)
//let text = "订阅我的频道" //???
//tokenizer.string = text
//tokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { tokenRange, _ in
//    print(text[tokenRange])
//    return true
//}

//1.3 Lemmatization
//let text = "I was running yesterday. My legs hurt a lot."
//let tagger = NLTagger(tagSchemes: [.lemma])
//tagger.string = text
//tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .lemma) { tag, tokenRange in
//    if let tag = tag {
//        print("\(text[tokenRange]) - \(tag.rawValue)")
//    }
//    return true
//}

//1.4 Sentiment Analysis
//let tagger = NLTagger(tagSchemes: [.sentimentScore])
//let text = "This new iPhone is great!"
//tagger.string = text
//let (sentiment, _) = tagger.tag(at: text.startIndex, unit: .paragraph, scheme: .sentimentScore)
//print(sentiment!.rawValue)



//2 Word Tagging

//2.1 Identifying Parts of Speech
//Reference: https://developer.apple.com/documentation/naturallanguage/nltagscheme/2976610-lexicalclass
//let text = "I love working from home, I save a lot of time on commuting."
//let tagger = NLTagger(tagSchemes: [.lexicalClass])
//tagger.string = text
//let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace]
//tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .lexicalClass, options: options) { tag, tokenRange in
//    if let tag = tag {
//        print("\(text[tokenRange]): \(tag.rawValue)")
//    }
//    return true
//}


//2.2 Identifying Named Entities like People, Places, and Organizations
//let text = "Apple was founded by Steve Jobs, Steve Wozniak, and Ronald Wayne in April 1976, in Los Altos, California"
//
//let tagger = NLTagger(tagSchemes: [.nameType])
//tagger.string = text
//
//let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]
//let tags: [NLTag] = [.personalName, .placeName, .organizationName]
//
//tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .nameType, options: options) { tag, tokenRange in
//    // Get the most likely tag, and print it if it's a named entity.
//    if let tag = tag, tags.contains(tag) {
//        print("\(text[tokenRange]): \(tag.rawValue)")
//    }
//
//    let (hypotheses, _) = tagger.tagHypotheses(at: tokenRange.lowerBound, unit: .word, scheme: .nameType, maximumCount: 1)
//    print(hypotheses)
//
//   return true
//}




//3. Word Embedding

//Supported Languages: English, Spanish, French, Italian, German, Portuguese, Simplified Chinese

//- Get vector for word
//let embedding = NLEmbedding.wordEmbedding(for: .english)
//let vector = embedding!.vector(for: "chair")
//print(vector)

//- Compute distance between two words
//let embedding = NLEmbedding.wordEmbedding(for: .english)
//let distance = embedding!.distance(between: "couch", and: "sofa")
//print(distance)

//- Get nearest neighbors for word
//let embedding = NLEmbedding.wordEmbedding(for: .english)
//embedding!.enumerateNeighbors(for: "chair", maximumCount: 5) { (string, distance) -> Bool in
//    print("\(string) - \(distance)")
//    return true
//}

//- Get nearest neighbors for vector
//let embedding = NLEmbedding.wordEmbedding(for: .english)
//let vectorA = embedding!.vector(for: "couch")
//let vectorB = embedding!.vector(for: "window")
//let vector = zip(vectorA!,vectorB!).map(+)
//embedding!.enumerateNeighbors(for: vector, maximumCount: 5) { (string, distance) -> Bool in
//    print("\(string) - \(distance)")
//    return true
//}




//4. Sentence Embedding

//- Get vector for sentence
//if let embedding = NLEmbedding.sentenceEmbedding(for: .english) {
//    let sentence = "This is a sentence."
//
//    if let vector = embedding.vector(for: sentence) {
//        print(vector)
//    }
//}

//- Compute distance between two sentences
//if let embedding = NLEmbedding.sentenceEmbedding(for: .english) {
//    let sentence = "I'm working from home."
//
//    let dist = embedding.distance(between: sentence, and: "He is working from home too.")
//    print(dist)
//}
