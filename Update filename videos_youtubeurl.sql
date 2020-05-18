-- Chi update videoid với các videoid chưa có trong bảng videos_youtubeurl

-- TRUNCATE TABLE videos_youtubeurl ;

INSERT INTO videos_youtubeurl (VideoID,SourceId,YoutubeID,filename_reformat)

SELECT 

ID as VideoID,
videos.SourceId,
if(LEFT(right(filename,LENGTH(filename)-8),3)='___',
SUBSTRING_INDEX(right(filename,LENGTH(filename)-8),"___",2)
,
SUBSTRING_INDEX(right(filename,LENGTH(filename)-8),"___",1) 
) as YoutubeID,
filename || '.mp4' as filename_reformat
from videos
LEFT JOIN videos_youtubeurl on videos.id = videos_youtubeurl.VideoId
WHERE 
videos.SourceId in ('717340540353713','779815522042770')
and
videos.Valid =1
AND
videos_youtubeurl.VideoId is null
