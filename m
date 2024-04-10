Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6B089F2AC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 14:48:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF2g46LL6z3vbc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 22:48:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF2fg296Zz3bmN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 22:47:37 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruXM8-0007UF-IX; Wed, 10 Apr 2024 14:47:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruXM5-00BUu2-Pi; Wed, 10 Apr 2024 14:47:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruXM5-00HZDk-2G;
	Wed, 10 Apr 2024 14:47:09 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] powerpc/powernv: Convert to platform remove callback returning void
Date: Wed, 10 Apr 2024 14:47:07 +0200
Message-ID: <20240410124707.194228-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1746; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=8gaWZjb3WEG7QfdqDQayW8ZSbu8b3UJ3SN5RYVB/JHw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmFopLYYVieLlF6+hbh0Sy7uIWqEwOwEOogFj6n 4Vkg0dBBEWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZhaKSwAKCRCPgPtYfRL+ TrcjB/4+dbhykK4jgahZ8XsADoUeJ2LRR1gfb4QldiipHsAwTNQNsGnCDdjXTouUYRazhtDSyWL myX5gMaU1zCz/H2fRY8r6WF2iJo6vuTtilY2P8pGhNT4tpwTkMG7SMynN+QuGO963/esIkqAW6d Iybzi0vs1BlLBIWgrG2S1h4N6m3Y0ARH0G6mc9sc7vLxwu7RahJwmYPEyu3HA4Ivyt1ooWWmRmn I/uLpbd8TNcImINTYcI66oK4fxjmaltx/8Y1dQzqytNa0WTzjRyXWq+LA5ShkiEcaWmY8cvaqdi rIaBabqRTemp3WWrXQsJ8DYOH08doR4ihC+ve1g1CnKb69fN
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
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

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/char/powernv-op-panel.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/char/powernv-op-panel.c b/drivers/char/powernv-op-panel.c
index 3c99696b145e..f2cff1a6fed5 100644
--- a/drivers/char/powernv-op-panel.c
+++ b/drivers/char/powernv-op-panel.c
@@ -195,12 +195,11 @@ static int oppanel_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int oppanel_remove(struct platform_device *pdev)
+static void oppanel_remove(struct platform_device *pdev)
 {
 	misc_deregister(&oppanel_dev);
 	kfree(oppanel_lines);
 	kfree(oppanel_data);
-	return 0;
 }
 
 static const struct of_device_id oppanel_match[] = {
@@ -214,7 +213,7 @@ static struct platform_driver oppanel_driver = {
 		.of_match_table	= oppanel_match,
 	},
 	.probe	= oppanel_probe,
-	.remove	= oppanel_remove,
+	.remove_new = oppanel_remove,
 };
 
 module_platform_driver(oppanel_driver);

base-commit: 6ebf211bb11dfc004a2ff73a9de5386fa309c430
-- 
2.43.0

