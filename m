Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E60326FB8C7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 22:53:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFYRm6TVmz3fNk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 06:53:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFYRH5X6gz3cBL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 06:53:29 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7r9-000354-NL; Mon, 08 May 2023 22:53:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7r8-0024q9-91; Mon, 08 May 2023 22:53:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7r6-002YVd-VI; Mon, 08 May 2023 22:53:12 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jochen Friedrich <jochen@scram.de>,
	Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 14/89] i2c: cpm: Convert to platform remove callback returning void
Date: Mon,  8 May 2023 22:51:51 +0200
Message-Id: <20230508205306.1474415-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1697; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=aiFfqAEoQbzn7DqF9GL4x0JbrPG+G1Z5lhkt+Kn7JFc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWBfe6Liupj7MQchW2fxSljTwh9tJZgLaLK+D 1nSrvG/ZxiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgXwAKCRCPgPtYfRL+ ToDmB/9XIjk2OSpBBOd+PQClMTqOd2ZI8ivxVS05CnLVJqMA8yeORPYjRAMWeB6vG4bKM+iSV23 H3+qEBXn92hfp8EYDgu/6HvzjH6rFQ3vBIHOm0iYCmeD/yj49fq108/VTZnoux3KUGStpx88koD nrk+iFSc5CpxguJg7RewuIXHaghcY2nLwlcqQTfjHK9emVNun2EEsxzH4349JFxEBebvyEsL21X Fy466W97X2HK7VFlTRtjIjTg75kqv39+ojL8Ny5KrUSgR7Ra2olrJ5AvbWxjCKwGAXoLLEVAqCX R1T8EWZVjowi+CEi4mZlrHsUls1uW58IWINV1/G9+f55lBDn
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, kernel@pengutronix.de
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
 drivers/i2c/busses/i2c-cpm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
index 24d584a1c9a7..732daf6a932b 100644
--- a/drivers/i2c/busses/i2c-cpm.c
+++ b/drivers/i2c/busses/i2c-cpm.c
@@ -676,7 +676,7 @@ static int cpm_i2c_probe(struct platform_device *ofdev)
 	return result;
 }
 
-static int cpm_i2c_remove(struct platform_device *ofdev)
+static void cpm_i2c_remove(struct platform_device *ofdev)
 {
 	struct cpm_i2c *cpm = platform_get_drvdata(ofdev);
 
@@ -685,8 +685,6 @@ static int cpm_i2c_remove(struct platform_device *ofdev)
 	cpm_i2c_shutdown(cpm);
 
 	kfree(cpm);
-
-	return 0;
 }
 
 static const struct of_device_id cpm_i2c_match[] = {
@@ -703,7 +701,7 @@ MODULE_DEVICE_TABLE(of, cpm_i2c_match);
 
 static struct platform_driver cpm_i2c_driver = {
 	.probe		= cpm_i2c_probe,
-	.remove		= cpm_i2c_remove,
+	.remove_new	= cpm_i2c_remove,
 	.driver = {
 		.name = "fsl-i2c-cpm",
 		.of_match_table = cpm_i2c_match,
-- 
2.39.2

