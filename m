Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B62EB7A65EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 15:57:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rqjs54BPhz3cR1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 23:57:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rqjrc0XMPz2yWD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 23:56:48 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiapq-0004gh-E9; Tue, 19 Sep 2023 15:32:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiapp-007T3c-Uh; Tue, 19 Sep 2023 15:32:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiapp-0030eS-LR; Tue, 19 Sep 2023 15:32:13 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 15/59] dma: fsldma: Convert to platform remove callback returning void
Date: Tue, 19 Sep 2023 15:31:23 +0200
Message-Id: <20230919133207.1400430-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
References: <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1707; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=lH2QKyTRMosTUBamQ8ap+SHPRBpiN3LLvYfnazK5ypI=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlTOhfvdfOtrIzfVP8kqMm7kTXnOtUOS3+aZMOtktuhPe e0Xv7d1MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCRAAP2/wGutwOmb0g1PS2w VTSEX7DLruP55Wm/Zx+ZkPfpcbPilVyOxXfNtouIs3814GQvf169Jr9xt9Eml3M3OPeFZe9+ILh F6PwaNtdFmb03vx3n8youkLc9w2+idfrNB/eIlr2spUwrxdvcQ2587Ko/0HhSyWQ7X9wW6+I+Y0 /PT7svJy/rT8iv9XtQu+l175O9AZMW18nz+UbLtAt0+b/2++s869WSVex7bvCnWHq8vbPrZ3BNh b3r87NfvK8f4raQ+JIk1hi6sVvKWZwtKaBt8//4WRcYrm45nlnhuos96L23TmOL7uMVy34bNyz+ bjtRYJ6V1D0OQyUeiXK2+FUfbBhOvJo4g0s9XzRXc28kAA==
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
Cc: dmaengine@vger.kernel.org, Zhang Wei <zw@zh-kernel.org>, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de, Li Yang <leoyang.li@nxp.com>
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
 drivers/dma/fsldma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index ddcf736d283d..18a6c4bf6275 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1306,7 +1306,7 @@ static int fsldma_of_probe(struct platform_device *op)
 	return err;
 }
 
-static int fsldma_of_remove(struct platform_device *op)
+static void fsldma_of_remove(struct platform_device *op)
 {
 	struct fsldma_device *fdev;
 	unsigned int i;
@@ -1324,8 +1324,6 @@ static int fsldma_of_remove(struct platform_device *op)
 
 	iounmap(fdev->regs);
 	kfree(fdev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -1406,7 +1404,7 @@ static struct platform_driver fsldma_of_driver = {
 #endif
 	},
 	.probe = fsldma_of_probe,
-	.remove = fsldma_of_remove,
+	.remove_new = fsldma_of_remove,
 };
 
 /*----------------------------------------------------------------------------*/
-- 
2.40.1

