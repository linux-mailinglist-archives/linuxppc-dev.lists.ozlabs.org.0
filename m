Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2297F6C0050
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Mar 2023 10:25:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PfXXF0h16z3f7r
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Mar 2023 20:25:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PfXWd4DwWz2xHQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Mar 2023 20:24:43 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdpHH-0003Oa-FU; Sun, 19 Mar 2023 10:24:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdpHF-005C7n-ON; Sun, 19 Mar 2023 10:24:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdpHE-0066P6-VH; Sun, 19 Mar 2023 10:24:32 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Ran Wang <ran.wang_1@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 03/11] usb: phy: fsl: Convert to platform remove callback returning void
Date: Sun, 19 Mar 2023 10:24:20 +0100
Message-Id: <20230319092428.283054-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
References: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=FznivNj01CkvJ0Tfq79ZXPvIH2iBmPqYvrjxDu3JqL4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFtS+Gx9MU/uPvG0E2e38YSGb+CT/REIMrTgOT kVLUaiOS+KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBbUvgAKCRCPgPtYfRL+ TgLpB/9D68sZE38fxGiX60CbSnNMFrBnHdzgJJ5YMEPSKquUKjOw4adeZvN9qaI4rqkQgbKYGBf xlzMPPD22gaGYsbiEkFOCfeL23CdrGvg2CDvd92s35ciqZFhz9d1o14i/EFW8Q9/AKS2HHXTpRU B3Jhrd16fsFuyc7+xxKhuuekdn4mOSl7mjaEe3kV1If3IpFmNnhCWq46am3ujDKcU3H27dsQ94z wtAOqAfteskKlHiOproDJzC6P6uTX25SSFfTo2LpFZeU+RMLr/nxLmMjgkxvkfzb3Kb2MHrEiBM fsGxFkPJTF00/+/E121qiG55AGfEIbHTc8DsFL3p6NlFc7Em
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
Cc: linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de
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
 drivers/usb/phy/phy-fsl-usb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index 972704262b02..79617bb0a70e 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -983,7 +983,7 @@ static int fsl_otg_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fsl_otg_remove(struct platform_device *pdev)
+static void fsl_otg_remove(struct platform_device *pdev)
 {
 	struct fsl_usb2_platform_data *pdata = dev_get_platdata(&pdev->dev);
 
@@ -998,13 +998,11 @@ static int fsl_otg_remove(struct platform_device *pdev)
 
 	if (pdata->exit)
 		pdata->exit(pdev);
-
-	return 0;
 }
 
 struct platform_driver fsl_otg_driver = {
 	.probe = fsl_otg_probe,
-	.remove = fsl_otg_remove,
+	.remove_new = fsl_otg_remove,
 	.driver = {
 		.name = driver_name,
 		.owner = THIS_MODULE,
-- 
2.39.2

