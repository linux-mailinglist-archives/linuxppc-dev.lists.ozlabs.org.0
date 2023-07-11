Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FBC74F003
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 15:19:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0hKr68D5z3bqC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 23:19:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0hKJ33Vcz3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 23:18:57 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJDGG-0006S3-3q; Tue, 11 Jul 2023 15:18:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJDGD-00DfEx-5A; Tue, 11 Jul 2023 15:18:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJDGC-00439l-2I; Tue, 11 Jul 2023 15:18:32 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Anatolij Gustschin <agust@denx.de>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/512x: lpbfifo: Convert to platform remove callback returning void
Date: Tue, 11 Jul 2023 15:17:26 +0200
Message-Id: <20230711131726.1108522-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2109; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=UgMNK/ckkj641Yk347C/OF1uZnbFc8ry0/zlVfrQx+8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrVZkt/je1xOGAPYegrSyiFdQawzmVNpA9ORgk iwiFpeefI+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK1WZAAKCRCPgPtYfRL+ TvziB/wOI0HDlce+ZtaziYRIA3qFiXGgsf7GmWlmRIWzF6WMxiMPJL5XxhdcSw7ftvANOPFZIEm yC76N53ueUvvSzzmg4XjXz9K30A/tKQgxVSxE/+I24pGFhRGDkYNVrVRDD0p2YluMAzWk4t01IR cPdgZlu1grt17bXu1XlymkZVXOqNpIJf+k+3jDkBtG3r1Je4YgO1knk5w9EOwEb6T15CrvCz721 ud1/YSWiwe9LrxAq6ohLcxiZE8V69SUUUZaziSX3XyUP3MWX5lodeoGmULEfPTcKq9Z6xI14GeI yvKQiaxP4sKmxOp8L3x8VA08veZYLOmg2pr7k85KQmifimHd
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
Cc: kernel@pengutronix.de, Rob Herring <robh@kernel.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/powerpc/platforms/512x/mpc512x_lpbfifo.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
index 1bfb29574caa..dbe722f7b855 100644
--- a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
+++ b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
@@ -477,7 +477,7 @@ static int mpc512x_lpbfifo_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mpc512x_lpbfifo_remove(struct platform_device *pdev)
+static void pc512x_lpbfifo_remove(struct platform_device *pdev)
 {
 	unsigned long flags;
 	struct dma_device *dma_dev = lpbfifo.chan->device;
@@ -494,8 +494,6 @@ static int mpc512x_lpbfifo_remove(struct platform_device *pdev)
 	free_irq(lpbfifo.irq, &pdev->dev);
 	irq_dispose_mapping(lpbfifo.irq);
 	dma_release_channel(lpbfifo.chan);
-
-	return 0;
 }
 
 static const struct of_device_id mpc512x_lpbfifo_match[] = {
@@ -506,7 +504,7 @@ MODULE_DEVICE_TABLE(of, mpc512x_lpbfifo_match);
 
 static struct platform_driver mpc512x_lpbfifo_driver = {
 	.probe = mpc512x_lpbfifo_probe,
-	.remove = mpc512x_lpbfifo_remove,
+	.remove_new = mpc512x_lpbfifo_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = mpc512x_lpbfifo_match,

base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
-- 
2.39.2

