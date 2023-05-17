Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5439707602
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 01:03:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QM7v55NJdz3fFk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 09:03:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QM7tZ6M7Xz3cj8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 09:03:00 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAU-0007xI-Tf; Thu, 18 May 2023 01:02:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAS-000wpo-Uc; Thu, 18 May 2023 01:02:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAS-005UX6-08; Thu, 18 May 2023 01:02:48 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Li Yang <leoyang.li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 30/97] usb: gadget/fsl_qe_udc: Convert to platform remove callback returning void
Date: Thu, 18 May 2023 01:01:32 +0200
Message-Id: <20230517230239.187727-31-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1939; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=En3KNUJ/RA3U3pMVZQZ/9cfHAOUWZwuPGVw0CK6AIno=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVwXunVuPOl3Y4CmP3Wu1ME3ZEWWeCmAkWTKp NG1QVf+ysuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcFwAKCRCPgPtYfRL+ TlXAB/4rVpLK0r2J4aiduOJ8JWUMGjwhO3kHxXTLF1NNQ8wBBg9YHetvuVr9rtxWS1BwJjHX8hK ARATuw55h2gO/poc7k5+KNAiEePT9PUrVcaR5t0Yf+XSi0vXANy+i/klgwghWVy15yMPfgQLFXW CHD8930JrfbuoR4zgvLIKYynchHmDxPqxQfIXMRiPe+1Zrjxk0gmrMdP6CmTTUDxW3H58U4lbd3 itYG8Ab7oIzB6oQvwPP+9i0ftJclDuhSLEUDzweiD4sEht8uLyYIV11FVU8bqgjE5s0wXgfFmd8 wT7XpKwWoDIjhblwq++dJhDv/UHcJmRGIGXJTvLYvbp9v8SJ
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
returning an error code. However the value returned is ignored (apart from
emitting a warning) and this typically results in resource leaks. To improve
here there is a quest to make the remove callback return void. In the first
step of this quest all drivers are converted to .remove_new() which already
returns void. Eventually after all drivers are converted, .remove_new() is
renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/gadget/udc/fsl_qe_udc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
index 3b1cc8fa30c8..9c5dc1c1a68e 100644
--- a/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -2628,7 +2628,7 @@ static int qe_udc_resume(struct platform_device *dev)
 }
 #endif
 
-static int qe_udc_remove(struct platform_device *ofdev)
+static void qe_udc_remove(struct platform_device *ofdev)
 {
 	struct qe_udc *udc = platform_get_drvdata(ofdev);
 	struct qe_ep *ep;
@@ -2679,8 +2679,6 @@ static int qe_udc_remove(struct platform_device *ofdev)
 
 	/* wait for release() of gadget.dev to free udc */
 	wait_for_completion(&done);
-
-	return 0;
 }
 
 /*-------------------------------------------------------------------------*/
@@ -2708,7 +2706,7 @@ static struct platform_driver udc_driver = {
 		.of_match_table = qe_udc_match,
 	},
 	.probe          = qe_udc_probe,
-	.remove         = qe_udc_remove,
+	.remove_new     = qe_udc_remove,
 #ifdef CONFIG_PM
 	.suspend        = qe_udc_suspend,
 	.resume         = qe_udc_resume,
-- 
2.39.2

