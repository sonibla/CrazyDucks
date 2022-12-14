Class {
	#name : #BaselineOfCrazyDucks,
	#superclass : #BaselineOf,
	#category : #BaselineOfCrazyDucks
}

{ #category : #baselines }
BaselineOfCrazyDucks >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'PharoJS'
			with: [ spec repository: 'github://PharoJS/PharoJS:pharo9' ];
			package: 'CrazyDucks' ]
]
