Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AD985E197
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 16:42:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg0rR3nrwz3vhZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 02:41:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg0q40y1qz3cV5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 02:40:46 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcoi4-0003mM-OB; Wed, 21 Feb 2024 16:40:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcoi3-0024Az-Uy; Wed, 21 Feb 2024 16:40:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcoi3-008uuw-2n;
	Wed, 21 Feb 2024 16:40:35 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/6] powerpc: gpio_mdio: Convert to platform remove callback returning void
Date: Wed, 21 Feb 2024 16:40:16 +0100
Message-ID: <8a5ac8044578694879e919322dbd46f140b64950.1708529736.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708529736.git.u.kleine-koenig@pengutronix.de>
References: <cover.1708529736.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1900; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=fZzoOB05XGeO0KCP+O/Tn10GbDvDtjzSxbOUBJ8CCTc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl1hlhQGX895Z71ctedQCA+hCDo+5GGeJ5x/NbY OINUglXohmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdYZYQAKCRCPgPtYfRL+ Ts/aCACnPm7whxOGIwbh7I64OFs0T9JEBT4cjYNc0tNJ7h+EmVUhhTHDSOLvCpDjM+JkI3Kl0Pl lQomSO/r7A44X2kgVH+66YEs4VBrEgTD4m2oVlWYPnrzhaOPrSWS9z54A5/dtNorWifb2bUsXU9 yjmuB7WBMiv0IVdGm5Mw2zq/hBWPXqIhpn4hjNvdxqDTeYy38vCQ/JNFZAGrK/0aUQvPZKRUpW4 pk/5PHpmsIwE7sy3o75600f/PKKOjKKsoojl98g3w31ykY8DJpTdMq6joxOn8bYhR3Zb5GKixz+ jfUtoFSUL5EAUe+OapK2ihJtGR5xwyxyuQhq6CE/Mx+WRrur
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
Cc: Rob Herring <robh@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
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
 arch/powerpc/platforms/pasemi/gpio_mdio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pasemi/gpio_mdio.c b/arch/powerpc/platforms/pasemi/gpio_mdio.c
index fd130fe7a65a..4e983af32949 100644
--- a/arch/powerpc/platforms/pasemi/gpio_mdio.c
+++ b/arch/powerpc/platforms/pasemi/gpio_mdio.c
@@ -260,7 +260,7 @@ static int gpio_mdio_probe(struct platform_device *ofdev)
 }
 
 
-static int gpio_mdio_remove(struct platform_device *dev)
+static void gpio_mdio_remove(struct platform_device *dev)
 {
 	struct mii_bus *bus = dev_get_drvdata(&dev->dev);
 
@@ -271,8 +271,6 @@ static int gpio_mdio_remove(struct platform_device *dev)
 	kfree(bus->priv);
 	bus->priv = NULL;
 	mdiobus_free(bus);
-
-	return 0;
 }
 
 static const struct of_device_id gpio_mdio_match[] =
@@ -287,7 +285,7 @@ MODULE_DEVICE_TABLE(of, gpio_mdio_match);
 static struct platform_driver gpio_mdio_driver =
 {
 	.probe		= gpio_mdio_probe,
-	.remove		= gpio_mdio_remove,
+	.remove_new	= gpio_mdio_remove,
 	.driver = {
 		.name = "gpio-mdio-bitbang",
 		.of_match_table = gpio_mdio_match,
-- 
2.43.0

