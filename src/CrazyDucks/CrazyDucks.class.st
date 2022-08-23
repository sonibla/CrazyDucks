Class {
	#name : #CrazyDucks,
	#superclass : #PjFileBasedWebApp,
	#category : #CrazyDucks
}

{ #category : #description }
CrazyDucks class >> appJsSubFolder [
	<pharoJsSkip>
	^#js
]

{ #category : #initialize }
CrazyDucks >> initialize [
	super initialize.
	((window js_at: 'melon') js_at: 'device' ) onReady: [window alert: 'Hello world'].
]

{ #category : #accessing }
CrazyDucks >> melonJsRoot [
	^ window melon
]
