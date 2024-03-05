Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 541FC872448
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 17:28:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq1GC15BSz3vkQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 03:28:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq1FV3w62z3vhw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 03:27:58 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhXdc-0003TG-PY; Tue, 05 Mar 2024 17:27:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhXdb-004aQC-L8; Tue, 05 Mar 2024 17:27:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhXdb-000BLb-1o;
	Tue, 05 Mar 2024 17:27:31 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Corey Minyard <minyard@acm.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/6] ipmi: ipmi_powernv: Convert to platform remove callback returning void
Date: Tue,  5 Mar 2024 17:26:59 +0100
Message-ID: <22375be2dd616d8ccc2959586a08e49a5ad9e47b.1709655755.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1709655755.git.u.kleine-koenig@pengutronix.de>
References: <cover.1709655755.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1784; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=c+JLhSDxkhY7w+LNSmgp+zHARDE2cqnx9VEPDNYMgQ4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl50fUAnYGsrZ2HJWCgt9xxz9Xjr2GCv8q5rfPC ZxtNRO+SeKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZedH1AAKCRCPgPtYfRL+ Tl6/CACp8/Fir0X126Y/o6U8/KCvw0LNLwO8QbNSR4Hl7f47vzPBLyqYoJ/hL7GDEuzt+Td8WDY CpG7WOamLVP44W8G1FxDZaAXkoxyjcCD04HJAkPbn2czr83r/OScSgSdnkkpA+Ymwt4dzc9nnN4 DKbwu9h7sKrfCoG7jgCEjayRG2oOIYL/XA6L2Bwi5O6YWYAqHF5A40Oq0qelcJzqOEI54jvW7zj li92X29CVA15C14UEoBOJ212c2VokyfkvIR56sesSnf+lNP4yLTdhcHZdVTSCOOywdEJQgu13L0 ZEEOqzF++Vg08B3f5jgG9veGSHocezL2VIlLGApIevIw6YOG
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, openipmi-developer@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org
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
 drivers/char/ipmi/ipmi_powernv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_powernv.c b/drivers/char/ipmi/ipmi_powernv.c
index da22a8cbe68e..c59a86eb58c7 100644
--- a/drivers/char/ipmi/ipmi_powernv.c
+++ b/drivers/char/ipmi/ipmi_powernv.c
@@ -281,15 +281,13 @@ static int ipmi_powernv_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int ipmi_powernv_remove(struct platform_device *pdev)
+static void ipmi_powernv_remove(struct platform_device *pdev)
 {
 	struct ipmi_smi_powernv *smi = dev_get_drvdata(&pdev->dev);
 
 	ipmi_unregister_smi(smi->intf);
 	free_irq(smi->irq, smi);
 	irq_dispose_mapping(smi->irq);
-
-	return 0;
 }
 
 static const struct of_device_id ipmi_powernv_match[] = {
@@ -304,7 +302,7 @@ static struct platform_driver powernv_ipmi_driver = {
 		.of_match_table	= ipmi_powernv_match,
 	},
 	.probe	= ipmi_powernv_probe,
-	.remove	= ipmi_powernv_remove,
+	.remove_new = ipmi_powernv_remove,
 };
 
 
-- 
2.43.0

