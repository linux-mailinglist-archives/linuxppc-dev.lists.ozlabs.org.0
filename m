Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4034C7F1FE2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 23:00:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZ1dx1gPGz3dJp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 09:00:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZ1dR3Y7Nz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 08:59:53 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ4-0003rW-8k; Mon, 20 Nov 2023 22:59:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ3-00ARFB-JM; Mon, 20 Nov 2023 22:59:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ3-004fD1-AJ; Mon, 20 Nov 2023 22:59:49 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/5] usb: gadget: fsl_udc: Convert to platform remove callback returning void
Date: Mon, 20 Nov 2023 22:58:33 +0100
Message-ID: <20231120215830.71071-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231120215830.71071-1-u.kleine-koenig@pengutronix.de>
References: <20231120215830.71071-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=CSs6fYvx2qfxAgOBeqdlj/Xryxuk9uWte3xLS8fBXr8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlW9aIWot7Ph0MnMhqpNWSAyrZOVYfxXa3crLAC XK4BGba8sCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVvWiAAKCRCPgPtYfRL+ TjfCCAC4Xb8co7ZtHlno/6oh+VEwm7O1DjqKFOsIm7MIbT2v46NTLquuadC5uHGEv88VwUX9ptK cX9NoWER62BGNNJphOwYa0FgdTrqdj9op4/cc3zBhEq535QAxZreuqoB/fxOc9tIm172ia+5NXs e6Fcrw94NhOTkOPeMVdCKydCCcOlKMZWTR++XrUQz6atIV/eNaB3Zw+PF5AVcT5Wgp6WUbiM7wh pM7kUZ31MClWyfrONIjCHYUMUMLwTtQAm3upGtcPgdRBAhGWunBR0BDVZUgI93q5qXfFMsR5C8c NDMgOYzlz/P8R87hJGAsL0LSnpfpyUhTr7PZFdfv/NJwrhF4
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
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
Cc: linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de, Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

In the error path emit an error message replacing the (less useful)
message by the core. Apart from the improved error message there is no
change in behaviour.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/gadget/udc/fsl_udc_core.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index 2693a10eb0c7..535b6e79a198 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -2532,15 +2532,18 @@ static int fsl_udc_probe(struct platform_device *pdev)
 /* Driver removal function
  * Free resources and finish pending transactions
  */
-static int fsl_udc_remove(struct platform_device *pdev)
+static void fsl_udc_remove(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	struct fsl_usb2_platform_data *pdata = dev_get_platdata(&pdev->dev);
 
 	DECLARE_COMPLETION_ONSTACK(done);
 
-	if (!udc_controller)
-		return -ENODEV;
+	if (!udc_controller) {
+		dev_err(&pdev->dev,
+			"Driver still in use but removing anyhow\n");
+		return;
+	}
 
 	udc_controller->done = &done;
 	usb_del_gadget_udc(&udc_controller->gadget);
@@ -2568,8 +2571,6 @@ static int fsl_udc_remove(struct platform_device *pdev)
 	 */
 	if (pdata->exit)
 		pdata->exit(pdev);
-
-	return 0;
 }
 
 /*-----------------------------------------------------------------
@@ -2667,7 +2668,7 @@ static const struct platform_device_id fsl_udc_devtype[] = {
 MODULE_DEVICE_TABLE(platform, fsl_udc_devtype);
 static struct platform_driver udc_driver = {
 	.probe		= fsl_udc_probe,
-	.remove		= fsl_udc_remove,
+	.remove_new	= fsl_udc_remove,
 	.id_table	= fsl_udc_devtype,
 	/* these suspend and resume are not usb suspend and resume */
 	.suspend	= fsl_udc_suspend,
-- 
2.42.0

