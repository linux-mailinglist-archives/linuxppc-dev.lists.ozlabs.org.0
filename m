Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5157CCE90
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 22:48:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S95fT3q2wz3vc2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 07:48:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S95dL4ylxz3c54
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 07:47:16 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsqy0-0001nh-VN; Tue, 17 Oct 2023 22:47:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsqxz-002Ol4-ED; Tue, 17 Oct 2023 22:47:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsqxz-000U0X-5D; Tue, 17 Oct 2023 22:47:03 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/6] usb: gadget: fsl-udc: Convert to use module_platform_driver()
Date: Tue, 17 Oct 2023 22:44:45 +0200
Message-ID: <20231017204442.1625925-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017204442.1625925-8-u.kleine-koenig@pengutronix.de>
References: <20231017204442.1625925-8-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1448; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=bqTWPGwzIMLwkfNPce7loB5RVG7gQl51fgVj1tD+3GU=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlS9Tw6Xult+sGp52F06+OYI//cHC7cqHLm1R9XZ85Dfy eYj+/kndjIaszAwcjHIiimy2DeuybSqkovsXPvvMswgViaQKQxcnAIwkQo39t+s9cGXU9m++YjH /zRz/b8u1WzK5D0mnjrcKScXbdM38WVacSqxgq1jglaeb9t6Jgv7EDu1n1u0TQUFL78Nu+2wT9L g8smtLPm1QsLFSuunbVHyOX5O0KjWPq6X71eWVASvgmtQ1g6fxz+/CB07FG+cpWMrW5Qlc8bqp+ 5Mjh3t4tULGjoXPFbX71/zI1jYfuanji8+z1fsTbnU1NER3VvRGHf48yztRwutVac1xV5P4nB7n /Z9+xRPJqlFjte4/8ns7hNqyhCo9AhVvvn2wiaNgFNqj7nDeHbaXZk201OKvSTr/MlfWxcrV0ed Cqk1+Oh6klWTYfGirT3HmNe9vlet4Llc8/biEO72S7vtAA==
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linux-usb@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

module_platform_driver_probe() has the advantage that the .probe() and
.remove() calls can live in .init.text and .exit.text respectively and
so some memory is saved. The downside is that dynamic bind and unbind
are impossible. As the driver doesn't benefit from the advantages (both
.probe and .remove are defined in plain .text), stop suffering from the
downsides and use module_platform_driver() instead of
module_platform_driver_probe().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/gadget/udc/fsl_udc_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index ee5705d336e3..2693a10eb0c7 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -2666,6 +2666,7 @@ static const struct platform_device_id fsl_udc_devtype[] = {
 };
 MODULE_DEVICE_TABLE(platform, fsl_udc_devtype);
 static struct platform_driver udc_driver = {
+	.probe		= fsl_udc_probe,
 	.remove		= fsl_udc_remove,
 	.id_table	= fsl_udc_devtype,
 	/* these suspend and resume are not usb suspend and resume */
@@ -2679,7 +2680,7 @@ static struct platform_driver udc_driver = {
 	},
 };
 
-module_platform_driver_probe(udc_driver, fsl_udc_probe);
+module_platform_driver(udc_driver);
 
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_AUTHOR(DRIVER_AUTHOR);
-- 
2.42.0

