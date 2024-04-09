Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0537089D52A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 11:12:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDKx45dRrz3vZn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 19:12:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDKwh65R1z30Np
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 19:12:20 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ru7WS-00047E-W0; Tue, 09 Apr 2024 11:12:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ru7WQ-00BH1V-Sl; Tue, 09 Apr 2024 11:12:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ru7WQ-00GqYs-2Z;
	Tue, 09 Apr 2024 11:12:06 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH net-next] net: wan: fsl_qmc_hdlc: Convert to platform remove callback returning void
Date: Tue,  9 Apr 2024 11:12:04 +0200
Message-ID: <20240409091203.39062-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2240; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=S3Lq+GiaWb2mL82KHngXon5KStQinTLItPD02AlUWRg=; b=owGbwMvMwMXY3/A7olbonx/jabUkhjRRtpSpTpd7z1jUKnEc678iu0QgwSp34mv7V+KKyYu/h M0x5u/vZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiXofY//AF79mZn8F6NGfO 5vYJ9x3FFoenukxTZM93vm7UrC3J+G96ttZD6V73zK7jbN5n5ou8PBF++4DW6eyaBb6zNTJeOHD OPvQv56fokqoXZ1eyzOCXXMy3rCvJc47Fs98/FYQbc2qmOXC8W3dVdKW3yM3ix7tOKHp27bHKvL Swr9u0Zf7u1jfbn65d//NY7pmzLx00rritEo6oY2TyOWi3JMzs012WJJed65wdFpje+/gkltszP PdIcGRWpku43SufFs3Zgi4qhleFRCod0noM1JNVxRVaul6WHROcKN/2Tvhd0T6NyZkBf3e53Vtp uDfwC//zPwIqkzb4WNRYqOl9KXkexu9kkrBg4ck/F/zNAQ==
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>, kernel@pengutronix.de, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
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
Hello,

the drivers below of drivers/net were already converted to struct
platform_driver::remove_new during the v6.9-rc1 development cycle. This
driver was added for v6.9-rc1 and so missed during my conversion.

There are still more drivers to be converted, so there is from my side
no need to get this into v6.9, but the next merge window would be nice.

Best regards
Uwe

 drivers/net/wan/fsl_qmc_hdlc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wan/fsl_qmc_hdlc.c b/drivers/net/wan/fsl_qmc_hdlc.c
index f69b1f579a0c..c5e7ca793c43 100644
--- a/drivers/net/wan/fsl_qmc_hdlc.c
+++ b/drivers/net/wan/fsl_qmc_hdlc.c
@@ -765,15 +765,13 @@ static int qmc_hdlc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int qmc_hdlc_remove(struct platform_device *pdev)
+static void qmc_hdlc_remove(struct platform_device *pdev)
 {
 	struct qmc_hdlc *qmc_hdlc = platform_get_drvdata(pdev);
 
 	unregister_hdlc_device(qmc_hdlc->netdev);
 	free_netdev(qmc_hdlc->netdev);
 	qmc_hdlc_framer_exit(qmc_hdlc);
-
-	return 0;
 }
 
 static const struct of_device_id qmc_hdlc_id_table[] = {
@@ -788,7 +786,7 @@ static struct platform_driver qmc_hdlc_driver = {
 		.of_match_table = qmc_hdlc_id_table,
 	},
 	.probe = qmc_hdlc_probe,
-	.remove = qmc_hdlc_remove,
+	.remove_new = qmc_hdlc_remove,
 };
 module_platform_driver(qmc_hdlc_driver);
 
base-commit: 11cb68ad52ac78c81e33b806b531f097e68edfa2
-- 
2.43.0

