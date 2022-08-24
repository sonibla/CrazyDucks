Class {
	#name : #CrazyDucks,
	#superclass : #PjFileBasedWebApp,
	#category : #CrazyDucks
}

{ #category : #initialize }
CrazyDucks >> displayApp [

	self initVideo.
	self setBackgroundColor.
	self displayText
]

{ #category : #initialize }
CrazyDucks >> displayText [

	(((window js_at: 'melon') js_at: 'game') js_at: 'world') addChild:
		(((window js_at: 'melon') js_at: 'Text') new: 609 with: 281 with: { 
				 (#font -> 'Arial').
				 (#size -> 160).
				 (#fillStyle -> '#FFFFFF').
				 (#textBaseline -> 'middle').
				 (#textAlign -> 'center').
				 (#text -> 'Hello World !') } asJsObject)
]

{ #category : #initialize }
CrazyDucks >> initVideo [

	"!melon.video.init(1218, 562, {parent : ""screen"", scale : ""auto""})"

	| canvasSupported video |
	video := (window js_at: 'melon') js_at: 'video'.
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
CrazyDucks >> melonJsRoot [
	^ window melon
]

{ #category : #initialize }
CrazyDucks >> onReadyDo: aBlock [

	(window melon js_at: #device) onReady: aBlock
]

{ #category : #initialize }
CrazyDucks >> setBackgroundColor [

	| child colorLayerClass |
	colorLayerClass := (window js_at: 'melon') js_at: 'ColorLayer'.

	child := colorLayerClass new: 'background' with: '#202020'.

	(((window js_at: 'melon') js_at: 'game') js_at: 'world') addChild:
		child
]
