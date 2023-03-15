Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE4F6BB71E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 16:10:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcDNB1Ddwz3fbV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 02:10:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcDKy6bPmz2xKS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 02:08:22 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSje-0007hB-1i; Wed, 15 Mar 2023 16:08:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjc-004KYo-8q; Wed, 15 Mar 2023 16:08:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjb-0057gB-Lk; Wed, 15 Mar 2023 16:08:11 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 068/173] ASoC: fsl: fsl_easrc: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:06:00 +0100
Message-Id: <20230315150745.67084-69-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1568; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ND/qfEK/K2yQMWNbGuK9dn2/B7iBBl8P2AgxRnz+K/U=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd37/BxjPnlV5VAPElq4vSSy0N90dTuQ8/VkK TUwywSQSPaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHd+wAKCRDB/BR4rcrs Ce4nB/9YjctLamI+NS6NLpoMnvCnOnU9ZRFDJiXHZavIJtFothyEpVyV4tePP4TAvem9U2IEbOC ogzOVYRQDyl74qDKdmoWD9k3Ct2loRXOs3W/acL2k5BeLNOpeAUleGzfH/nqYN33iQM7Smx0flH U1+MakbCW3mDsuLdW6ZVgovuVO7GQO/3uDD2vQ+rQUJnYW8JxLs15KQt+FOMOIkEnN955ZoJPW9 fODaq0Fqv/JDPYEqP3XWAHY6+37obS7I5IqawPcgyYwelMtoBq8g9MBwYNTQqO0ZAR2I7enGb1s sgthKVaRkZ16Ib8phQ6i6QEuhdOLTVfvvZF+57dPCiNuftXr
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
 sound/soc/fsl/fsl_easrc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 3153d19136b2..670cbdb361b6 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1979,11 +1979,9 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int fsl_easrc_remove(struct platform_device *pdev)
+static void fsl_easrc_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static __maybe_unused int fsl_easrc_runtime_suspend(struct device *dev)
@@ -2093,7 +2091,7 @@ static const struct dev_pm_ops fsl_easrc_pm_ops = {
 
 static struct platform_driver fsl_easrc_driver = {
 	.probe = fsl_easrc_probe,
-	.remove = fsl_easrc_remove,
+	.remove_new = fsl_easrc_remove,
 	.driver = {
 		.name = "fsl-easrc",
 		.pm = &fsl_easrc_pm_ops,
-- 
2.39.2

