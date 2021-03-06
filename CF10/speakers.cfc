<cfcomponent restPath="/speakers">

	<!---
		NOTE: YOU MAY NOT USE APPLICATION-SPECIFIC MAPPINGS IN CF10 REST CFC'S!
	--->

	<cfset variables.speakerModel = createObject("component", "presentations.getting_rest._model.speakers") />

	<!---
		COLLECTION
	--->

	<cffunction name="getAllSpeakers"
				returntype="array"
				access="remote"
				produces="application/json"
				httpMethod="GET">

		<cfset local.speakers = variables.speakerModel.getAllSpeakersWithSessions( "http://localhost/rest/getting_rest_preso" ) />
		<cfreturn local.speakers />

	</cffunction>

	<!---
		MEMBER
	--->

	<cffunction name="getSingleSpeaker"
				returntype="any"
				access="remote"
				produces="application/json"
				httpMethod="GET"
				restPath="/{speakerSlug}"> <!--- implies /speakers/{speakerSlug} --->

		<cfargument name="speakerSlug" restArgSource="path" />

		<cfset local.speaker = variables.speakerModel.getSpeaker(arguments.speakerSlug, "http://localhost/rest/getting_rest_preso") />
		<cfreturn local.speaker />

	</cffunction>

</cfcomponent>
