Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E476FB8FD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 22:55:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFYTS6shgz3fZJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 06:55:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFYRL4mNwz3ckZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 06:53:34 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7rK-0003gu-L6; Mon, 08 May 2023 22:53:26 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7rJ-0024su-0g; Mon, 08 May 2023 22:53:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7rI-002YXt-6x; Mon, 08 May 2023 22:53:24 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 49/89] i2c: opal: Convert to platform remove callback returning void
Date: Mon,  8 May 2023 22:52:26 +0200
Message-Id: <20230508205306.1474415-50-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1626; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ncthjFi6ksRiTZBfKM1IMNSBV5gAP6yfZJdoYoXEqrE=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTIhDf7tJrOC+/SLlnYv/Rdlu7iVZMvPuM3zkw46f9lx Uy2t7zWnYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBMZJscB8NsB9+ZzIe/C926 o9zgJuDP/KPmxeKF2plOSXtWPG9wubJd65TJbnfBxw9NAiQtFCK9Zl+UiioxmnCFJ99o3+17rc0 /T1l/5m3YvbWJbfsEeXu/W3nS3gJqVR4MLe9Dpd60ailP0eoIYuVxUw86br5rmuUrhQVlsvn1Hn 9rGKwsW/7XrDH6GSOjGXRYwlI5YsaDcLm2kOms1XLMPyedapimt4CxTTdEIrk2+8msZ5kCMomWs 6pErb+J/BBLFzi97v+uhClnX/RKZh7/oNTQV3V9f7jbInvF0ncTdaMsTltsklXn5dOymmU75bNF 2+4v/kc6Hl04du6L4L7JExoK8uKiI59MUfq+zbSr//9/AA==
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
Cc: kernel@pengutronix.de, "open list:LINUX FOR POWERPC" <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>, linux-i2c@vger.kernel.org
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
 drivers/i2c/busses/i2c-opal.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-opal.c b/drivers/i2c/busses/i2c-opal.c
index 9f773b4f5ed8..17ef87d50f7c 100644
--- a/drivers/i2c/busses/i2c-opal.c
+++ b/drivers/i2c/busses/i2c-opal.c
@@ -232,13 +232,11 @@ static int i2c_opal_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int i2c_opal_remove(struct platform_device *pdev)
+static void i2c_opal_remove(struct platform_device *pdev)
 {
 	struct i2c_adapter *adapter = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(adapter);
-
-	return 0;
 }
 
 static const struct of_device_id i2c_opal_of_match[] = {
@@ -251,7 +249,7 @@ MODULE_DEVICE_TABLE(of, i2c_opal_of_match);
 
 static struct platform_driver i2c_opal_driver = {
 	.probe	= i2c_opal_probe,
-	.remove	= i2c_opal_remove,
+	.remove_new = i2c_opal_remove,
 	.driver	= {
 		.name		= "i2c-opal",
 		.of_match_table	= i2c_opal_of_match,
-- 
2.39.2

