Class {
	#name : #CrazyDucks,
	#superclass : #PjFileBasedWebApp,
	#category : #CrazyDucks
}

{ #category : #accessing }
CrazyDucks >> device [

	^ window melon js_at: #device
]

{ #category : #initialize }
CrazyDucks >> displayApp [

	self initVideo.
	self setBackgroundColor.
	self displayText
]

{ #category : #initialize }
CrazyDucks >> displayText [

	self world addChild:
		((self melon js_at: 'Text') new: 609 with: 281 with: { 
				 (#font -> 'Arial').
				 (#size -> 160).
				 (#fillStyle -> '#FFFFFF').
				 (#textBaseline -> 'middle').
				 (#textAlign -> 'center').
				 (#text -> 'Hello World !') } asJsObject)
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
	canvasSupported := video js_init: 1218 height: 562 options: { 
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
CrazyDucks >> world [

	^ self game js_at: 'world'
]
