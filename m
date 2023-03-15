Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A03D16BB735
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 16:12:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcDR446v9z3frr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 02:12:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcDL05vSJz3cXf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 02:08:24 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSje-0007km-IP; Wed, 15 Mar 2023 16:08:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjc-004KZ2-Q9; Wed, 15 Mar 2023 16:08:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjb-0057gF-SU; Wed, 15 Mar 2023 16:08:11 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 069/173] ASoC: fsl: fsl_esai: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:06:01 +0100
Message-Id: <20230315150745.67084-70-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=4KrXWTDf4zwf+OYLklG7MbvlDBPMg5fJsMKLrEZj0lU=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd3+oDckhhmheTXcok/jAk62jWM2ZXXO7d8QA tG/OVpBLS6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHd/gAKCRDB/BR4rcrs CU2KCACAOqylsnwSZ46KWtSGC7JjDOHDFfeXRAFNcL814Xzz5MyjfAM39UPjtT/96fpaEmZPW8y IvPI9lCpy9w08Z8o2W8Y8Yz/zg8bp/A3HYN/2hSvLZAP95ugLif7JNf9zBjk1aHuxXyJ3PF1RlH lSSIjkLosYa5X+v2yHcazKhYRmhUIn9OOt/L4Va1SdSNOqgCB7WzPk6BXgwF+nba22022d7JSrj wrdU7t8gXG2aw2VjQgazyYTssn1Jse/OsTPgwSDWOz6yDdiFqFMgIwbrFvQJK4qj4omTbOpvDvQ EuKtkfYzkpM8zKn3f8w9iMLByF++VRCMm5Mte6MZ0wvEdGaS
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
 sound/soc/fsl/fsl_esai.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 17fefd27ec90..936f0cd4b06d 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -1101,7 +1101,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fsl_esai_remove(struct platform_device *pdev)
+static void fsl_esai_remove(struct platform_device *pdev)
 {
 	struct fsl_esai *esai_priv = platform_get_drvdata(pdev);
 
@@ -1110,8 +1110,6 @@ static int fsl_esai_remove(struct platform_device *pdev)
 		fsl_esai_runtime_suspend(&pdev->dev);
 
 	cancel_work_sync(&esai_priv->work);
-
-	return 0;
 }
 
 static const struct of_device_id fsl_esai_dt_ids[] = {
@@ -1200,7 +1198,7 @@ static const struct dev_pm_ops fsl_esai_pm_ops = {
 
 static struct platform_driver fsl_esai_driver = {
 	.probe = fsl_esai_probe,
-	.remove = fsl_esai_remove,
+	.remove_new = fsl_esai_remove,
 	.driver = {
 		.name = "fsl-esai-dai",
 		.pm = &fsl_esai_pm_ops,
-- 
2.39.2

