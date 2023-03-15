Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3D86BB74B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 16:14:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcDTP40z3z3fTC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 02:14:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcDL208blz3ccg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 02:08:26 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjf-0007ov-PW; Wed, 15 Mar 2023 16:08:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjd-004KZK-Kl; Wed, 15 Mar 2023 16:08:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjd-0057gb-35; Wed, 15 Mar 2023 16:08:13 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 074/173] ASoC: fsl: fsl_ssi: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:06:06 +0100
Message-Id: <20230315150745.67084-75-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=lzER8ngZs/WYY6pUSzDfleqHc+/c2ZIHZ4U1i4Rx9PE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd4M8Yqw4jJ6QAV9A+zyKfTN2KWgqLGZwp9DD PRnMffi9suJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeDAAKCRDB/BR4rcrs CUB/CACVKjX4L/z6ettvWGUCLZLr44rN2PJVfK8cbMZYSkTiqsg8TEDGOvQd0AfpAAfnXVXN4kl LbxBH9spuorzBFruAcDKnQhchOGXbFHcIddmpZrUekZAUcqf4AZ+oaHAEG2SM4sDJ39gy4aw9hF +Ncd2dhbvDZtDH5lFhFufWcUu61bG88RwaQVEKrn/iRoVz5fdqCk+bdeU2nPdvKwkrwJc2mhewH zEzRHg/RcgRaCHb72GSYKMz1Y4BHPlkzOaJUPiU96tN5usn+2FiImojkZYQh89o5UxShtMnLwNx v198IlyDJXQsrrQW8S0vVJ90vEkCMZGWDWohyTpiFd7Qw/Qn
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
 sound/soc/fsl/fsl_ssi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 46a53551b955..f9097268589c 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1671,7 +1671,7 @@ static int fsl_ssi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fsl_ssi_remove(struct platform_device *pdev)
+static void fsl_ssi_remove(struct platform_device *pdev)
 {
 	struct fsl_ssi *ssi = dev_get_drvdata(&pdev->dev);
 
@@ -1690,8 +1690,6 @@ static int fsl_ssi_remove(struct platform_device *pdev)
 		snd_soc_set_ac97_ops(NULL);
 		mutex_destroy(&ssi->ac97_reg_lock);
 	}
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1737,7 +1735,7 @@ static struct platform_driver fsl_ssi_driver = {
 		.pm = &fsl_ssi_pm,
 	},
 	.probe = fsl_ssi_probe,
-	.remove = fsl_ssi_remove,
+	.remove_new = fsl_ssi_remove,
 };
 
 module_platform_driver(fsl_ssi_driver);
-- 
2.39.2

