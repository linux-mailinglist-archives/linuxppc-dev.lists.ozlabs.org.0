Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4265B7AD4ED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 11:56:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvJDH1VMVz3dFk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 19:56:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvJCj6rq6z3c3r
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 19:55:44 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJV-0007mR-LL; Mon, 25 Sep 2023 11:55:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJV-008pyw-7U; Mon, 25 Sep 2023 11:55:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJU-004dko-UR; Mon, 25 Sep 2023 11:55:36 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 07/40] soc/fsl: cpm: tsa: Convert to platform remove callback returning void
Date: Mon, 25 Sep 2023 11:54:58 +0200
Message-Id: <20230925095532.1984344-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=eIuwBQKxvMu1FI84lx/swtTa9hFNjHXOr6M8QJPy0WA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlEVhH9CZ2hQKgImN9WjTkQ3iRo1V+LMO8M+F0y jbaF1GCabqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRFYRwAKCRCPgPtYfRL+ Th7AB/4+hD7+cFdG8f9bqHr0Vm21pZY/sJ0j6fNfFD+lJSk6zY4N5qfSlbuMRHcKpUsD8+Pbjrg EK6RebOZM8bsEubYcfLNJSH9ZHwIisw7EntAnsNpjHuDc2IXXUJTd5kA6doq6IhzkgDQ7xTD6Q1 bx5dnriRfZz8B2ZERpkD9YqqVRK4V3Jpe54sSPt3TtDNVKk3+wbqQDcBjlmHjST4dSJy21/UDiT 5y4g8tcKSv4ECxtMASk8gIuMXjNCWK+YHcrwEATMaRXz73ipCx0Qbvrx8mUAwlEHV4eqQBvhyeL GtBfvB6Ahq6pCei4odfB4YG5gVmNZ5TxvKTrneUQJiZ/ftQy
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
 drivers/soc/fsl/qe/tsa.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index 3646153117b3..3f9981335590 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -706,7 +706,7 @@ static int tsa_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tsa_remove(struct platform_device *pdev)
+static void tsa_remove(struct platform_device *pdev)
 {
 	struct tsa *tsa = platform_get_drvdata(pdev);
 	int i;
@@ -729,7 +729,6 @@ static int tsa_remove(struct platform_device *pdev)
 			clk_put(tsa->tdm[i].l1rclk_clk);
 		}
 	}
-	return 0;
 }
 
 static const struct of_device_id tsa_id_table[] = {
@@ -744,7 +743,7 @@ static struct platform_driver tsa_driver = {
 		.of_match_table = of_match_ptr(tsa_id_table),
 	},
 	.probe = tsa_probe,
-	.remove = tsa_remove,
+	.remove_new = tsa_remove,
 };
 module_platform_driver(tsa_driver);
 
-- 
2.40.1

