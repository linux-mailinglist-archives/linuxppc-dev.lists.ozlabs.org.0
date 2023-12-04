Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF882803D1B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 19:32:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkXMn1PpJz3dLS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 05:32:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkXLl70n9z3cTh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 05:31:42 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rADj3-0003BD-OL; Mon, 04 Dec 2023 19:31:25 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rADj3-00DZmh-80; Mon, 04 Dec 2023 19:31:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rADj2-00EE7W-V8; Mon, 04 Dec 2023 19:31:24 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 5/9] net: wan/fsl_ucc_hdlc: Convert to platform remove callback returning void
Date: Mon,  4 Dec 2023 19:30:45 +0100
Message-ID: <8c9ffca75ea24810f9ba05a514d5ad59847cc4fe.1701713943.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1959; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=BXCJ5RBs9n3Xi3nRuucIGJWxYyOhe3q5AcmI4Pk19QA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlbhreCWyIvQi2zzhLN39R3snoWndXP7tWACp/a BNFVuU6oJaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZW4a3gAKCRCPgPtYfRL+ TuoxB/wMOkST4NGR4hCW1u/Upa0K59hrPLOb5NckuHsuoHLXnqo1xvywmr7V23q5MsJTDuWxob1 2m2dsZkEepK/DhPiQmk7UqEBGt4B6qRZZNU0hdrhoz5C1lhYdvh3q/dwvTunHkWDy0uRnWJPUIb B9KT2KpaKViU06zwdgNo2Sz8bJvlt0ZIFmueD2pmp/VZnOPCMAlcNPRwPNOL+riC8/EurbdGZm9 rtxGTKSFi+vTTdft3kuzua2KfVvNHo7etZ9MWhmzzh7RsYPaRs8v4QZS/TzJC2x9eO9qaHzTawR lEzzcO1THqnxLB85xtQdQC3iWI2AORUgIyT5lpyJ4ApL8/Io
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de, Zhao Qiang <qiang.zhao@nxp.com>
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

Link: https://lore.kernel.org/r/20231117095922.876489-7-u.kleine-koenig@pengutronix.de
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/net/wan/fsl_ucc_hdlc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
index fd50bb313b92..605e70f7baac 100644
--- a/drivers/net/wan/fsl_ucc_hdlc.c
+++ b/drivers/net/wan/fsl_ucc_hdlc.c
@@ -1259,7 +1259,7 @@ static int ucc_hdlc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int ucc_hdlc_remove(struct platform_device *pdev)
+static void ucc_hdlc_remove(struct platform_device *pdev)
 {
 	struct ucc_hdlc_private *priv = dev_get_drvdata(&pdev->dev);
 
@@ -1277,8 +1277,6 @@ static int ucc_hdlc_remove(struct platform_device *pdev)
 	kfree(priv);
 
 	dev_info(&pdev->dev, "UCC based hdlc module removed\n");
-
-	return 0;
 }
 
 static const struct of_device_id fsl_ucc_hdlc_of_match[] = {
@@ -1292,7 +1290,7 @@ MODULE_DEVICE_TABLE(of, fsl_ucc_hdlc_of_match);
 
 static struct platform_driver ucc_hdlc_driver = {
 	.probe	= ucc_hdlc_probe,
-	.remove	= ucc_hdlc_remove,
+	.remove_new = ucc_hdlc_remove,
 	.driver	= {
 		.name		= DRV_NAME,
 		.pm		= HDLC_PM_OPS,
-- 
2.42.0

