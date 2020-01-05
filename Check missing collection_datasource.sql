-- SELECT * from (

SELECT
	collections.UUID as collection_UUID,
	users.UUId as user_UUID,
	collection_video.VideoId,
	videos_youtubeurl.YOUTUBEID,
	videos_youtubeurl.youtubeurl,
	collection_datasource.DatasourceId
FROM
	collections
join users on users.id = collections.UserId and users.Valid > 0
JOIN collection_video on collections.id = collection_video.CollectionId	
Join videos_youtubeurl on collection_video.VideoId = videos_youtubeurl.VideoId
LEFT JOIN collection_datasource on (collection_datasource.CollectionId = collections.UUID AND collection_datasource.SourceURI = videos_youtubeurl.youtubeurl)
where 
users.id = '648821807774829'
and
collections.valid = 1
and
collection_datasource.DatasourceId is NULL

