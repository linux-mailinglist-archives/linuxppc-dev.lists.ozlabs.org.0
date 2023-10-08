Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2267BCFF6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 22:02:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3Y4860xMz3fQH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 07:02:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3Y3c5jfyz2ykV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 07:02:19 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyP-0001V1-F3; Sun, 08 Oct 2023 22:01:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyN-000EzT-2t; Sun, 08 Oct 2023 22:01:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyM-00Bf0J-Pw; Sun, 08 Oct 2023 22:01:54 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 06/20] mtd: powernv_flash: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:29 +0200
Message-Id: <20231008200143.196369-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=SNxKBQN3w7wXtWV2/V/mud+9ty25OkXgeLAIa2U5Vkg=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlRlrmaVvTdZQ4QWv02eoLmfX/9QfcGSzOzGTQxljTYd0 5tUWZI6GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZhI8XT2//EVEjLSThUiW+dF 1Crlf3DUPLlz4uwmM4FFypEBmpapnvdvif4RV9eQYjze/r1e5cXfpzw8bxOu/5Qt/vnGry7Zy/K O+MXeR6FSSzr/lb1LO1v+sPH7i1KbXgujbxxLPxlM+Nb28fy5UMb7q8W41TeqJHqdLndS6VveGf G01//MdNErsQmnI2vvhRaLLH9vmvBTL8ndQmij9e7v2YIafeLdDK9tVyYumL/Zxevwq8ptGQ1vp VXmc1288c05K21N7FH3o7INGz5qzHbT29n8MzFz5pGkrYEvNoncPn9hxSKug2pP4p/V5T8/fMQk 2m5doZ6AulRqNPOrTLOvayeLHdTwb38/Wetm6GZ93vvKAA==
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
Cc: linux-mtd@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org
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
 drivers/mtd/devices/powernv_flash.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 36e060386e59..66044f4f5bad 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -265,14 +265,12 @@ static int powernv_flash_probe(struct platform_device *pdev)
  *
  * Returns 0
  */
-static int powernv_flash_release(struct platform_device *pdev)
+static void powernv_flash_release(struct platform_device *pdev)
 {
 	struct powernv_flash *data = dev_get_drvdata(&(pdev->dev));
 
 	/* All resources should be freed automatically */
 	WARN_ON(mtd_device_unregister(&data->mtd));
-
-	return 0;
 }
 
 static const struct of_device_id powernv_flash_match[] = {
@@ -285,7 +283,7 @@ static struct platform_driver powernv_flash_driver = {
 		.name		= "powernv_flash",
 		.of_match_table	= powernv_flash_match,
 	},
-	.remove		= powernv_flash_release,
+	.remove_new	= powernv_flash_release,
 	.probe		= powernv_flash_probe,
 };
 
-- 
2.40.1

