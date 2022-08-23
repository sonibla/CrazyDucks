Class {
	#name : #CrazyDucks,
	#superclass : #PjFileBasedWebApp,
	#category : #CrazyDucks
}

{ #category : #initialize }
CrazyDucks >> initialize [
	super initialize.
	((window js_at: 'melon') js_at: 'device' ) onReady: [window alert: 'Hello world'].
]

{ #category : #accessing }
CrazyDucks >> melonJsRoot [
	^ window melon
]
