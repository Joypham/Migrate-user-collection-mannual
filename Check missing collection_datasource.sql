SELECT
	collections.UUID as collection_UUID,
	users.UUId as user_UUID,
	collection_video.VideoId,
	collection_video.CollectionId,
	videos.Filename,
	videos_youtubeurl.YOUTUBEID,
	videos_youtubeurl.youtubeurl
-- 	datasources.Id
FROM
	collections
join users on users.id = collections.UserId and users.Valid > 0
JOIN collection_video on collections.id = collection_video.CollectionId	
join videos on videos.id = collection_video.VideoId
LEFT JOIN videos_youtubeurl on collection_video.VideoId = videos_youtubeurl.VideoId
-- LEFT JOIN datasources on datasources.FileName = videos.FileName and datasources.Valid > 0
LEFT JOIN collection_datasource on (collection_datasource.CollectionId = collections.UUID AND collection_datasource.SourceURI = videos_youtubeurl.youtubeurl)
where 
users.id = '720498966428823'
and
collections.valid = 1
and
collection_datasource.DatasourceId is NULL
-- 1B23F17BE1E04A879889A308586F9E8C
-- CE410D48CD084C0593F378B7948B48F0
