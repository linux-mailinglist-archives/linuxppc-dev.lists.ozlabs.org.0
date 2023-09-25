Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C43357AD50A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 11:57:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvJFL4fPZz3dgh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 19:57:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvJCj6wt0z3c47
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 19:55:44 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJV-0007mB-E6; Mon, 25 Sep 2023 11:55:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJV-008pyt-0t; Mon, 25 Sep 2023 11:55:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJU-004dkk-Lk; Mon, 25 Sep 2023 11:55:36 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 06/40] soc/fsl: cpm: qmc: Convert to platform remove callback returning void
Date: Mon, 25 Sep 2023 11:54:57 +0200
Message-Id: <20230925095532.1984344-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=11DQKKRaNDdVL2EcVHpkaIt5mYrztBDOwN8kCrOQm8Q=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlEVhGc2+gPB6a3s2QMDqTEzqCX24U4XbprVyH1 bE9BNGO3EOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRFYRgAKCRCPgPtYfRL+ TsVQB/9KNrlJrk+9C1jwZeKKfZySz7G1XxaOfdMa0Zdmd16IolajvJE+RoS5Ew46sGjDAabeZRj yQE7GNW0BobiHKsUBxhtTsgAwUSP9bJ1z99lsuzD/rueJj/NCwUOPoqxDC9JK7kho4aUUjqQc9t l5gpeiN5whQMovv1gyxlQ3deWI8raxUjD7X34FXBUIbEbH5vs3IwZa4Ta1lm6OTVGHa9GRAS0Ux TgRYfmMsUaC3rHO7pLUlt+VSHOBRLAoOyS5wUEhe/cgOtzdEV59jP+LzfAtQLdxF29QtcYYVaUk VICh+6//ntJNENkfoHbLFdJT02LShKrS4z1+U0ILO5lLUfg4
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
Cc: kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/soc/fsl/qe/qmc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index b3c292c9a14e..92ec76c03965 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1415,7 +1415,7 @@ static int qmc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int qmc_remove(struct platform_device *pdev)
+static void qmc_remove(struct platform_device *pdev)
 {
 	struct qmc *qmc = platform_get_drvdata(pdev);
 
@@ -1427,8 +1427,6 @@ static int qmc_remove(struct platform_device *pdev)
 
 	/* Disconnect the serial from TSA */
 	tsa_serial_disconnect(qmc->tsa_serial);
-
-	return 0;
 }
 
 static const struct of_device_id qmc_id_table[] = {
@@ -1443,7 +1441,7 @@ static struct platform_driver qmc_driver = {
 		.of_match_table = of_match_ptr(qmc_id_table),
 	},
 	.probe = qmc_probe,
-	.remove = qmc_remove,
+	.remove_new = qmc_remove,
 };
 module_platform_driver(qmc_driver);
 
-- 
2.40.1

