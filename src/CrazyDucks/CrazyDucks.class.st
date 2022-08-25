Class {
	#name : #CrazyDucks,
	#superclass : #PjFileBasedWebApp,
	#category : #CrazyDucks
}

{ #category : #initialize }
CrazyDucks >> bindKey: aKey to: aString cancelEvent: aBoolean [

	self input
		js_bindKey: aKey
		to: aString
		cancelEvent: aBoolean
		override: true
]

{ #category : #accessing }
CrazyDucks >> device [

	^ window melon js_at: #device
]

{ #category : #initialize }
CrazyDucks >> displayApp [

	self initVideo.
	self setBackgroundColor.
	self loader js_at: #crossOrigin put: 'anonymous'.
	
	self loader preload: { { 
			                   (#name -> 'duck').
			                   (#type -> 'image').
			                   (#src -> 'https://cdn131.picsart.com/274037682011211.png?to=crop&type=webp&r=70x100&q=85')  } asJsObject } onLoad: [ self displayImage ] switchToLoadState: false.
]

{ #category : #initialize }
CrazyDucks >> displayImage [

	| image body |
	image := (self melon js_at: 'Entity') new: 600 with: 110 with: { 
			         (#image -> 'duck').
			         (#width -> 60).
			         (#height -> 90) } asJsObject.
	body := image js_at: 'body'.
	body setMaxVelocity: 8 and: 10.
	body setFriction: 1 and: 0.
	self bindKey: (self keyNamed: 'LEFT') to: 'left' cancelEvent: false.
	self bindKey: (self keyNamed: 'RIGHT') to: 'right' cancelEvent: false.
	self bindKey: (self keyNamed: 'UP') to: 'jump' cancelEvent: true.
	self timer
		setInterval: [ :sp | 
			| force |
			force := (sp js_at: 'body') js_at: 'force'.


			(self isKeyPressed: 'left')
				ifTrue: [ force js_at: 'x' put: -8 ]
				ifFalse: [ 
					(self isKeyPressed: 'right')
						ifTrue: [ force js_at: 'x' put: 8 ]
						ifFalse: [ force js_at: 'x' put: 0 ] ].
			(self isKeyPressed: 'jump')
				ifTrue: [ force js_at: 'y' put: -10 ]
				ifFalse: [ force js_at: 'y' put: 0 ] ]
		ms: 50
		pause: false
		arg: image.
	image js_at: 'alwaysUpdate' put: true.
	self world addChild: image
]

{ #category : #accessing }
CrazyDucks >> game [

	^ self melon js_at: 'game'
]

{ #category : #initialize }
CrazyDucks >> initVideo [

	"!melon.video.init(1218, 562, {parent : ""screen"", scale : ""auto""})"

	| canvasSupported video |
	video := self melon js_at: 'video'.
	canvasSupported := video js_init: 1200 height: 600 options: { 
			                   (#parent -> 'screen').
			                   (#scale -> 'auto') } asJsObject.

	canvasSupported ifFalse: [ 
		window alert: 'Your browser does not support HTML5 canvas.' ]
]

{ #category : #initialize }
CrazyDucks >> initialize [

	super initialize.
	self onReadyDo: [ self displayApp ]
]

{ #category : #accessing }
CrazyDucks >> input [

	^ self melon js_at: 'input'
]

{ #category : #initialize }
CrazyDucks >> isKeyPressed: aString [

	^ self input js_isKeyPressed: aString
]

{ #category : #initialize }
CrazyDucks >> keyNamed: aString [

	^ (self input js_at: 'KEY') js_at: aString
]

{ #category : #accessing }
CrazyDucks >> loader [

	^ self melon js_at: 'loader'
]

{ #category : #accessing }
CrazyDucks >> melon [

	^ window js_at: 'melon'
]

{ #category : #initialize }
CrazyDucks >> onReadyDo: aBlock [

	self device onReady: aBlock
]

{ #category : #initialize }
CrazyDucks >> setBackgroundColor [

	| child colorLayerClass |
	colorLayerClass := self melon js_at: 'ColorLayer'.

	child := colorLayerClass new: 'background' with: '#202020'.
	self world addChild: child
]

{ #category : #accessing }
CrazyDucks >> timer [

	^ self melon js_at: 'timer'
]

{ #category : #accessing }
CrazyDucks >> world [

	^ self game js_at: 'world'
]
