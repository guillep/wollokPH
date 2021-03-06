Class {
	#name : #WollokLangObject,
	#superclass : #WollokNativeObject,
	#category : #'Wollok-Interpreter'
}

{ #category : #accessing }
WollokLangObject class >> wollokClassName [

	^ 'wollok.lang.Object'
]

{ #category : #'native methods' }
WollokLangObject >> checkNotNull: aReceiver with: aMaybeNull with: variableName [

	aReceiver = interpreter nullObject 
		ifTrue: [ self halt ].

]

{ #category : #'native methods' }
WollokLangObject >> generateDoesNotUnderstandMessage: aReceiver with: anObjectString with: aSelector with: numberOfArguments [ 

	^ interpreter asWollokString: ('Instances of ' , aReceiver wollokClass fullyQualifiedName asString ,
	 ' do not understand ', aSelector  asPharoString  )
]

{ #category : #'native methods' }
WollokLangObject >> identity: aWollokObject [ 
	
	^ interpreter asWollokNumber: aWollokObject hash
]

{ #category : #'native methods' }
WollokLangObject >> kindName: aWollokObject [ 

	| title |
	title := aWollokObject wollokClass name.

	^ interpreter asWollokString: (title first isVowel ifTrue: ['an '] ifFalse: ['a ']) , title
]
