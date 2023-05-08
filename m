Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 033026FB90A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 22:56:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFYVW4dyvz3fgc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 06:56:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFYRY1zW9z3fJb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 06:53:45 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7rL-0003j9-EX; Mon, 08 May 2023 22:53:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7rJ-0024sy-Dq; Mon, 08 May 2023 22:53:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pw7rI-002YXz-DS; Mon, 08 May 2023 22:53:24 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 50/89] i2c: pasemi-platform: Convert to platform remove callback returning void
Date: Mon,  8 May 2023 22:52:27 +0200
Message-Id: <20230508205306.1474415-51-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1779; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=2g9yoEqKcX1X+3bMnRkdbIFFr/3mb5kycddtX0do9WQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDt06/aJyPJ7w1qMFqgybbieneo8p+eq3ZSZ yioD/fvqh2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg7QAKCRCPgPtYfRL+ TmR2B/9sZk2CXh0JtZGUzTaARFgkBdQjawgYBXSDgk/vvHXB1pWeZqEDKukqXR8yu2IlSUF6Un9 d0jFNAAjGCOSVUrteyazN1M6OxXbEV6gx3SrFRW3wupm4iKCnwlKfYITE/yJTrnI4snYjNoWau3 xck6pGrrI5U/oshOnxXTUS6L5aDIZZEMvUKVRroOf2zD86HaNm99Hj3BUIMXM9BhNX7AKyeaRhZ mMM134qC4U7HGRIqplWoxW4sRqBIn2ZmPX0/ZHAZvSGsOOnsZr2HtyjRvyAkjp9D6moPqDJEuZw AkI0LlkQJnDYzxvqz+TsKmImcZrh6pkDrU9oeZw1p2A+6t/6
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
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-i2c@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, "open list:LINUX FOR POWERPC" <linuxppc-dev@lists.ozlabs.org>, linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev
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
 drivers/i2c/busses/i2c-pasemi-platform.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-platform.c b/drivers/i2c/busses/i2c-pasemi-platform.c
index e35945a91dbe..0a44f64897c7 100644
--- a/drivers/i2c/busses/i2c-pasemi-platform.c
+++ b/drivers/i2c/busses/i2c-pasemi-platform.c
@@ -98,12 +98,11 @@ static int pasemi_platform_i2c_probe(struct platform_device *pdev)
 	return error;
 }
 
-static int pasemi_platform_i2c_remove(struct platform_device *pdev)
+static void pasemi_platform_i2c_remove(struct platform_device *pdev)
 {
 	struct pasemi_platform_i2c_data *data = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(data->clk_ref);
-	return 0;
 }
 
 static const struct of_device_id pasemi_platform_i2c_of_match[] = {
@@ -119,7 +118,7 @@ static struct platform_driver pasemi_platform_i2c_driver = {
 		.of_match_table		= pasemi_platform_i2c_of_match,
 	},
 	.probe	= pasemi_platform_i2c_probe,
-	.remove	= pasemi_platform_i2c_remove,
+	.remove_new = pasemi_platform_i2c_remove,
 };
 module_platform_driver(pasemi_platform_i2c_driver);
 
-- 
2.39.2

