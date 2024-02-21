Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E37385E19F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 16:43:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg0sl06W1z3vcn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 02:43:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg0q653Pcz3cV5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 02:40:50 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcoi4-0003mL-Ny; Wed, 21 Feb 2024 16:40:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcoi3-0024Aw-RG; Wed, 21 Feb 2024 16:40:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcoi3-008uus-2Q;
	Wed, 21 Feb 2024 16:40:35 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/6] powerpc: sgy_cts1000: Convert to platform remove callback returning void
Date: Wed, 21 Feb 2024 16:40:15 +0100
Message-ID: <1e8396078942d9e46e56d70ed2f749a76391c381.1708529736.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708529736.git.u.kleine-koenig@pengutronix.de>
References: <cover.1708529736.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=ogUyxjiDfEiP42rq1BDVf2g5yBwdXqNCsAbwY0nNDZg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl1hlgEvbF7sjgqALRfi3QYixIitKh08tptrynG MekMZoc1EuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdYZYAAKCRCPgPtYfRL+ Tn5LCACZohnsc5DkwRcRV1Ipa/AYMWcJuxNSHfrkSXfZrcroE39D+aX4QRuKoKo03arAuevxZ/z tkjQ+BHhcEFVl5Qnj4aLj3gRoxcNH7VQb9HFc4DbO1sJ4WIMK4G9zq1PAdZ5AZa2+oYxgwi7aeD l8j66tI2t6Et/Or/gU/pA/aKHGjyOehgCfRrQzd5jjDAdnXpy1hiwDUbhrCHRZtMpbzU0BTwJU4 OgDFwOtK8prUa0kD/oxiIgiuTlOilLPhqbJsGznd4wxzmOoZBMRbNCXmllNaIlmVQK+3XWBLhPR RSO+xC7rRg6ciJ/z5kHhYJPY9KFBhDuKHSygcNAYX9Dfnsq1
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
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
 arch/powerpc/platforms/85xx/sgy_cts1000.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/sgy_cts1000.c b/arch/powerpc/platforms/85xx/sgy_cts1000.c
index 751395cbf022..34ce21f42623 100644
--- a/arch/powerpc/platforms/85xx/sgy_cts1000.c
+++ b/arch/powerpc/platforms/85xx/sgy_cts1000.c
@@ -114,7 +114,7 @@ static int gpio_halt_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int gpio_halt_remove(struct platform_device *pdev)
+static void gpio_halt_remove(struct platform_device *pdev)
 {
 	free_irq(halt_irq, pdev);
 	cancel_work_sync(&gpio_halt_wq);
@@ -124,8 +124,6 @@ static int gpio_halt_remove(struct platform_device *pdev)
 
 	gpiod_put(halt_gpio);
 	halt_gpio = NULL;
-
-	return 0;
 }
 
 static const struct of_device_id gpio_halt_match[] = {
@@ -145,7 +143,7 @@ static struct platform_driver gpio_halt_driver = {
 		.of_match_table = gpio_halt_match,
 	},
 	.probe		= gpio_halt_probe,
-	.remove		= gpio_halt_remove,
+	.remove_new	= gpio_halt_remove,
 };
 
 module_platform_driver(gpio_halt_driver);
-- 
2.43.0

