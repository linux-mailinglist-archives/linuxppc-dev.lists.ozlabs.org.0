Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 291CE85E1A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 16:43:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg0tB0pdkz3w15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 02:43:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg0q70vxgz3cV5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 02:40:51 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcoi6-0003mO-6r; Wed, 21 Feb 2024 16:40:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcoi4-0024B2-2k; Wed, 21 Feb 2024 16:40:36 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcoi3-008uv0-3B;
	Wed, 21 Feb 2024 16:40:35 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/6] powerpc: opal-prd: Convert to platform remove callback returning void
Date: Wed, 21 Feb 2024 16:40:17 +0100
Message-ID: <28dd12b7cbde4b278b8b1d0ae4382dbd8ce9c9c5.1708529736.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708529736.git.u.kleine-koenig@pengutronix.de>
References: <cover.1708529736.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1844; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=MSsmSnrW/8/S/sLQ5oFN5q//Y6NN5SnseZ+c6QBW7lk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl1hliut4XA0BB4cW5WZAqoaUvPVWcJwZoQtdXw Qeyo808d06JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdYZYgAKCRCPgPtYfRL+ Tq1yCACbJqn/w3SAO+zpxXW/uKhVHj0W95uGab4h1GqfjIcGMPuG2sNQl3Z+kMpak5EVLP5ORGZ pil6/5gs52ESauw4T+NdbE8PIMJ2/LHcjoEwumXu6bcvFUXj+Vn0gkA4/BAwYolFsG5NQNykOtM pLUfDI6jtk6d9Lp6qetaz5OOzg3J1JAu22xGSb7fXiEP6vDOFDZJVtmpjFBgiB0N/j6iG6v0gmB 8cZ3giRJPDzvfV7wxkAxFLkXYdm5kKXKjbof9ljPmhE70azsvV5mq7Na/U8yEMJ+ieHC1RQeses kpLL+O4MP8/TKDWYljW42ZlBYjsCGtQhONemhBlohiigsLzO
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
Cc: Haoran Liu <liuhaoran14@163.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
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
 arch/powerpc/platforms/powernv/opal-prd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
index b66b06efcef1..24f04f20d3e8 100644
--- a/arch/powerpc/platforms/powernv/opal-prd.c
+++ b/arch/powerpc/platforms/powernv/opal-prd.c
@@ -425,12 +425,11 @@ static int opal_prd_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int opal_prd_remove(struct platform_device *pdev)
+static void opal_prd_remove(struct platform_device *pdev)
 {
 	misc_deregister(&opal_prd_dev);
 	opal_message_notifier_unregister(OPAL_MSG_PRD, &opal_prd_event_nb);
 	opal_message_notifier_unregister(OPAL_MSG_PRD2, &opal_prd_event_nb2);
-	return 0;
 }
 
 static const struct of_device_id opal_prd_match[] = {
@@ -444,7 +443,7 @@ static struct platform_driver opal_prd_driver = {
 		.of_match_table	= opal_prd_match,
 	},
 	.probe	= opal_prd_probe,
-	.remove	= opal_prd_remove,
+	.remove_new = opal_prd_remove,
 };
 
 module_platform_driver(opal_prd_driver);
-- 
2.43.0

