Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAA6724917
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 18:29:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbGC64TYcz3fF1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 02:29:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbGBb2ZyTz3ch8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 02:28:53 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q6ZXw-00057L-BZ; Tue, 06 Jun 2023 18:28:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q6ZXv-005Y5w-IU; Tue, 06 Jun 2023 18:28:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q6ZXu-00Bl0j-Lw; Tue, 06 Jun 2023 18:28:34 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Li Yang <leoyang.li@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 8/8] net: ucc_geth: Convert to platform remove callback returning void
Date: Tue,  6 Jun 2023 18:28:29 +0200
Message-Id: <20230606162829.166226-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230606162829.166226-1-u.kleine-koenig@pengutronix.de>
References: <20230606162829.166226-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=gq+6rF927IzufgheVcUUzZnngMBPRltTHkIBQrXYRMc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkf16qP357vq8227AGcEe5Qy+63shMi26ywf58Z dpb3jwNyluJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZH9eqgAKCRCPgPtYfRL+ TqDCB/9i5ikPgzdUcrlvN+8IP/itbXjuR+MqdGNCmbejaE6rR4WNODrNtamvr8q2oIuBBvbTf2s 4XebkDyyKAZi/i+nOvjMGctzqSDFpsVwoBQlY3F4yrfaQRuEpaGffsJcY7FewzxFlwB6TnxhAa8 7+z1BY5Z/+hRVNjhMvxl8WdfCnqDFAjt+uT+vjp/9/nAv09Ak6+xJxL9ry9ntuyg8IGIy2fB8Pc M09FcUquF7ZtwAtBFWMuox36MynJHXmVZQ9tas92S6Wa/Ezh1IE0+nAe22pY1ADQiMesRFjJhJW 8GRG/uruKGr+WJJlgxLKa4N4pULiIJwbzwZktvoATxe64fM0
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
Cc: netdev@vger.kernel.org, Michal Kubiak <michal.kubiak@intel.com>, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de
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

Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/net/ethernet/freescale/ucc_geth.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 7a4cb4f07c32..2b3a15f24e7c 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -3753,7 +3753,7 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	return err;
 }
 
-static int ucc_geth_remove(struct platform_device* ofdev)
+static void ucc_geth_remove(struct platform_device* ofdev)
 {
 	struct net_device *dev = platform_get_drvdata(ofdev);
 	struct ucc_geth_private *ugeth = netdev_priv(dev);
@@ -3767,8 +3767,6 @@ static int ucc_geth_remove(struct platform_device* ofdev)
 	of_node_put(ugeth->ug_info->phy_node);
 	kfree(ugeth->ug_info);
 	free_netdev(dev);
-
-	return 0;
 }
 
 static const struct of_device_id ucc_geth_match[] = {
@@ -3787,7 +3785,7 @@ static struct platform_driver ucc_geth_driver = {
 		.of_match_table = ucc_geth_match,
 	},
 	.probe		= ucc_geth_probe,
-	.remove		= ucc_geth_remove,
+	.remove_new	= ucc_geth_remove,
 	.suspend	= ucc_geth_suspend,
 	.resume		= ucc_geth_resume,
 };
-- 
2.39.2

