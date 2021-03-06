Class {
	#name : #WollokLangNumber,
	#superclass : #WollokNativeObject,
	#category : #'Wollok-Interpreter'
}

{ #category : #accessing }
WollokLangNumber class >> wollokClassName [

	^ 'wollok.lang.Number'
]

{ #category : #'native methdos' }
WollokLangNumber >> add: aWollokObject with: aWollokObject2 [ 
	
	^ interpreter asWollokNumber: (aWollokObject asNumber + aWollokObject2 asNumber)
]

{ #category : #'native methods' }
WollokLangNumber >> division: aWollokInmediate with: aWollokInmediate2 [ 
	
	^ interpreter asWollokNumber: aWollokInmediate asNumber / aWollokInmediate2 asNumber
]

{ #category : #'native methods' }
WollokLangNumber >> doubleEquals: aWollokObject with: aWollokObject2 [ 

	aWollokObject wollokClass = aWollokObject2 wollokClass
		ifFalse: [ ^ interpreter falseObject ].
		
	^ interpreter asWollokBoolean: (aWollokObject asNumber = aWollokObject2 asNumber)

]

{ #category : #'native methods' }
WollokLangNumber >> greaterThan: aWollokObject with: aWollokObject2 [ 
	
	^ interpreter asWollokBoolean: (aWollokObject asNumber > aWollokObject2 asNumber)
]

{ #category : #'native methods' }
WollokLangNumber >> invert: aWollokNumber [ 
	
	^ interpreter asWollokNumber: aWollokNumber asNumber negated
]

{ #category : #'native methods' }
WollokLangNumber >> lowerThan: aWollokObject with: aWollokObject2 [ 

	^ interpreter asWollokBoolean: (aWollokObject asNumber < aWollokObject2 asNumber)
]

{ #category : #'native method' }
WollokLangNumber >> minus: aReceiver with: anotherObject [ 

	^ interpreter asWollokNumber: aReceiver asNumber - anotherObject asNumber
]

{ #category : #'native methods' }
WollokLangNumber >> multiply: aReceiver with: otherWollokNumber [

	^ interpreter asWollokNumber: aReceiver asNumber * otherWollokNumber asNumber
]

{ #category : #'native methods' }
WollokLangNumber >> raiseTo: aReceiver with: anotherObject [ 
	
	^ interpreter asWollokNumber: aReceiver asNumber ** anotherObject asNumber
]

{ #category : #'native methods' }
WollokLangNumber >> roundUp: aReceiver with: aWollokNumber [

	| aFloat rounding desiredDecimals parts aReceiverNumber |

	desiredDecimals := aWollokNumber asNumber.
	aReceiverNumber := aReceiver asNumber asFloat.

	"Lets check if the rounding is already done"
	parts := aReceiverNumber printString splitOn: $. .
	parts size = 1 ifTrue: [ ^ aReceiver ].
	(parts at:2) size <= desiredDecimals ifTrue: [ ^ aReceiver ].

	rounding := desiredDecimals = 1 
							ifTrue: [ 0.1 ] 
							ifFalse: [ 10 ** desiredDecimals negated ].

	aFloat := (aReceiverNumber roundUpTo: rounding) asFloat.

	^ interpreter asWollokNumber: aFloat 
]

{ #category : #'native methods' }
WollokLangNumber >> truncate: aReceiver with: aPrecision [ 

	| aFloat rounding desiredDecimals parts aReceiverNumber |

	desiredDecimals := aPrecision asNumber.
	aReceiverNumber := aReceiver asNumber asFloat.

	"Lets check if the rounding is already done"
	parts := aReceiverNumber printString splitOn: $. .
	parts size = 1 ifTrue: [ ^ aReceiver ].
	(parts at:2) size <= desiredDecimals ifTrue: [ ^ aReceiver ].

	rounding := desiredDecimals = 1 
							ifTrue: [ 0.1 ] 
							ifFalse: [ 10 ** desiredDecimals negated ].

	aFloat := (aReceiverNumber truncateTo: rounding) asFloat.

	^ interpreter asWollokNumber: aFloat 
]
