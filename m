Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 682E5762F6A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 10:15:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9mt22f5Kz3cHH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 18:15:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9msV4mRqz2ygx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 18:14:53 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qOZfV-0000Zj-JB; Wed, 26 Jul 2023 10:14:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qOZfR-002C2Y-Jo; Wed, 26 Jul 2023 10:14:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qOZfQ-007stT-W4; Wed, 26 Jul 2023 10:14:45 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/ep8248e: Mark driver as non removable
Date: Wed, 26 Jul 2023 10:14:42 +0200
Message-Id: <20230726081442.461026-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1347; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=PDWs5JAlrNOGIjp5YqlSuu43p8NmbNVpVUAxrqR3Q1w=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkwNXxr7pTKKEQaiTWvalMjlgR6MTU8tm47sshP /TUSK8LvCyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMDV8QAKCRCPgPtYfRL+ Tv2UB/9bK+LJ4j/S50aD1SeweG0pS+RatV/XvCSYazitR+YuNPY+Dl9kfktM23ppZDRMQzpCPo4 18CplkiiE04FQKv9Jyl5eCzjuS3OcRgiyfeH7q909PZbckZi2GU8xxwATCbGGlOxPHPyVo7ktwH kw7tA6xyDu1cDZ+wN8+pfnj9XNw3/m0RflIMXblV6GZBf9PUMPpA7A2ZqCFFr2MsjdYCqE6NMf2 q6UyJoq3apVVkMScidQw6/M7L4ZSMZAvCYfSKFz0aPX37QiXIhVuU4uKFzajorrEYLV9GNWgGmw LIGA7cpbwdY4zYWN1T24HQSzq11cGSRtIKrHSVJwP1PfCAkC
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
Cc: kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of resorting to BUG() ensure that the driver isn't unbound by
suppressing its bind and unbind sysfs attributes. As the driver is
built-in there is no way to remove a device once bound.

As a nice side effect this allows to drop the remove function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/powerpc/platforms/82xx/ep8248e.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/82xx/ep8248e.c b/arch/powerpc/platforms/82xx/ep8248e.c
index 8f1856ba692e..3409cf04b630 100644
--- a/arch/powerpc/platforms/82xx/ep8248e.c
+++ b/arch/powerpc/platforms/82xx/ep8248e.c
@@ -140,12 +140,6 @@ static int ep8248e_mdio_probe(struct platform_device *ofdev)
 	return ret;
 }
 
-static int ep8248e_mdio_remove(struct platform_device *ofdev)
-{
-	BUG();
-	return 0;
-}
-
 static const struct of_device_id ep8248e_mdio_match[] = {
 	{
 		.compatible = "fsl,ep8248e-mdio-bitbang",
@@ -157,9 +151,9 @@ static struct platform_driver ep8248e_mdio_driver = {
 	.driver = {
 		.name = "ep8248e-mdio-bitbang",
 		.of_match_table = ep8248e_mdio_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = ep8248e_mdio_probe,
-	.remove = ep8248e_mdio_remove,
 };
 
 struct cpm_pin {

base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
-- 
2.39.2

