Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7A16BB745
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 16:14:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcDSq0q87z3g2g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 02:14:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcDL16BYfz3cgq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 02:08:25 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjg-0007qq-Ar; Wed, 15 Mar 2023 16:08:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjd-004KZP-Ux; Wed, 15 Mar 2023 16:08:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjd-0057gf-97; Wed, 15 Mar 2023 16:08:13 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 075/173] ASoC: fsl: fsl_xcvr: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:06:07 +0100
Message-Id: <20230315150745.67084-76-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ygayRBhrJGWkRKJxPwr2o7DgtTmFVHTcMDhPGXeoQcc=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd4QhTUgiNTMI8YTKdqGt6kA2Zu6czVsU9CxQ 8mahDTff6iJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeEAAKCRDB/BR4rcrs CXOlB/9PO05PjCrzxTd3qMfWhJAJM9qx1+CaJxwTL8nhe7QRB10wWGi2hTvyxn5PV0UHXLrYDvn 397K4J/VID/YlJa3D4HY720ArE1gBfGEXzTLf35PkQC8jj+Z3A0i3adoHl8e6ICy5uchryLb1g3 o4h/IgWbpM5wjP5QwqYvoWkge6uXHlH27xBnqEjSx8QaObGhKLtnFWJid7Ls7BYKvrUqElId6QG CtONunjrpHqNEgK2+G11PS0/b1Cyj3ULiCZlKBeDfHXC4BBFR0EOQUQMndHVtQ5fC5fO2T62qzG GhKxHxwvehpm8qG76CXeFijhN77WOtLTvy53xJhnuQ1TKb50
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/fsl/fsl_xcvr.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 2a78243df752..318fe77683f5 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1339,10 +1339,9 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fsl_xcvr_remove(struct platform_device *pdev)
+static void fsl_xcvr_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 static __maybe_unused int fsl_xcvr_runtime_suspend(struct device *dev)
@@ -1478,7 +1477,7 @@ static struct platform_driver fsl_xcvr_driver = {
 		.pm = &fsl_xcvr_pm_ops,
 		.of_match_table = fsl_xcvr_dt_ids,
 	},
-	.remove = fsl_xcvr_remove,
+	.remove_new = fsl_xcvr_remove,
 };
 module_platform_driver(fsl_xcvr_driver);
 
-- 
2.39.2

