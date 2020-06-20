﻿CREATE PROCEDURE [dbo].[uspGetNotificationsLocalAuthorityStatsInCluster]
(
	@ClusterId VARCHAR(200)
)
AS
BEGIN
	WITH notificationsInCluster AS
	(
		SELECT 
			LocalAuthority,
			LocalAuthorityCode
		FROM dbo.ReusableNotification n WITH (NOLOCK)
		LEFT JOIN NotificationClusterMatch cluster ON cluster.NotificationId = n.NotificationId
		WHERE ClusterId = @ClusterId
	)

	SELECT
		LocalAuthority,
		MAX(LocalAuthorityCode) AS LocalAuthorityCode,
		COUNT(LocalAuthority) AS LocalAuthorityCount
	FROM notificationsInCluster
	WHERE LocalAuthority IS NOT NULL
	GROUP BY LocalAuthority
	ORDER BY LocalAuthorityCount DESC
END