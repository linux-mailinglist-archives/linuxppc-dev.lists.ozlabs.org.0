Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA88053D31B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 23:09:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LFFqf2c98z3cBP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jun 2022 07:09:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LFFqB2DhZz2xn8
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jun 2022 07:08:35 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWg-0003qq-Pj; Fri, 03 Jun 2022 23:08:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWc-006Hq3-Ia; Fri, 03 Jun 2022 23:08:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWZ-00E1HE-PC; Fri, 03 Jun 2022 23:08:03 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 03/14] mtd: powernv_flash: Warn about failure to unregister mtd device
Date: Fri,  3 Jun 2022 23:07:47 +0200
Message-Id: <20220603210758.148493-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=uwe@kleine-koenig.org; h=from:subject; bh=BqRV/9hKw8b2WjPNF+2ddr2O2osZm5bSPlugKTkUS+o=; b=owGbwMvMwMV48I9IxdpTbzgZT6slMSTNKj83X/71MqWvlX+PpngtPls+x7t2+yHHLRO4bLjNQjdm GlendzIaszAwcjHIiimy1BVpiU2QWPPfrmQJN8wgViaQKQxcnAIwkZfu7P89Xv+V9tKQP/JmkdaCM6 w6N5RZVnOY6HhXhgbuWDJZI1VWebUR/8vfFUct5quf3Nn01VukSlc6ZNrKnN8Wz0Iy/q7tiVk2vVm1 r+jqS9fsUBEBA7dfUjYyvf0MS+/kqC7lXqLMf2O5QpHfTCUplU1ebVx9SaKBpdoHxbtTiphOfla35z ta67x6g48YV7b+tf2/TezOMos8nmy1ePW7BV5psp2O1U5b+1Xu5lrMEXZkLg/9sMz8yaHlKh1V/A9D fk04s89cSLS1167RZ5v5pM4+7lMp5saldXv39YpO1g3e1DPVvrrhWev3vxcb007ueuG/Iuxvzk3Ti1 cY07q5A/9NC2cXYn6Z6O51faI3AA==
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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
Cc: linux-mtd@lists.infradead.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mtd_device_unregister() shouldn't fail. Wail loudly if it does anyhow.

This matches how other drivers (e.g. nand/raw/nandsim.c) use
mtd_device_unregister().

By returning 0 in the platform remove callback a generic error message
by the device core is suppressed, nothing else changes.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/devices/powernv_flash.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 6950a8764815..36e060386e59 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -270,7 +270,9 @@ static int powernv_flash_release(struct platform_device *pdev)
 	struct powernv_flash *data = dev_get_drvdata(&(pdev->dev));
 
 	/* All resources should be freed automatically */
-	return mtd_device_unregister(&(data->mtd));
+	WARN_ON(mtd_device_unregister(&data->mtd));
+
+	return 0;
 }
 
 static const struct of_device_id powernv_flash_match[] = {
-- 
2.36.1

