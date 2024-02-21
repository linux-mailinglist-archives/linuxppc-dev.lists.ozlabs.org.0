Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4B885D4AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 10:55:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfs8H0x6Qz3dT4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 20:55:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfs7Q1jCLz30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 20:54:24 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcjIp-0007GV-Kv; Wed, 21 Feb 2024 10:54:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcjIo-0020pO-Go; Wed, 21 Feb 2024 10:54:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rcjIo-008mZ9-1N;
	Wed, 21 Feb 2024 10:54:10 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 02/11] cxl: Convert to platform remove callback returning void
Date: Wed, 21 Feb 2024 10:53:46 +0100
Message-ID: <add08320eef9ea20ceca78648370590a4bd447b0.1708508896.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708508896.git.u.kleine-koenig@pengutronix.de>
References: <cover.1708508896.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=ceIfAJGD21yqrCu3pRBnl7qS6woYhZWPmCbj1WktHEw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl1cgt8CRj7FyjoliavbQtoyeJoVa/eIfWpBiD0 I22MkayPfCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdXILQAKCRCPgPtYfRL+ TnmxCACPUIWrtGTTucmi+16fEgSXVpRrmtRZyFotM2Ky/2rMpHxG8L4jWkle7RHMSm/JWMEfQnt EzSNutI6wb4kZP9bn1ibHhzzlybBmqXY40SYB3BMmzIL9WxTe5egQdEHO2zbIdAiLkhLwmu3+zn moPHodSmLV/tgalWnDiuSvzXnGlDFLRB2vvlhE7LetAFQ55i1v4HDxEJdInctDklrzdk83aHfuY qq8v0u7lTym/HSHvuUSvE4UyR0PIdYBO3kcMaykO4H8AoYAVJl7eA3STIiq8HeY8v73Wf/nA4e2 G3Db7C6soCl7+vZAQXisdhDfNfd7MIRdO6gGSw0T54bnDAxR
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>, kernel@pengutronix.de, linux-kernel@vger.kernel.org
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
 drivers/misc/cxl/of.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/cxl/of.c b/drivers/misc/cxl/of.c
index 25ce725035e7..bcc005dff1c0 100644
--- a/drivers/misc/cxl/of.c
+++ b/drivers/misc/cxl/of.c
@@ -431,7 +431,7 @@ int cxl_of_read_adapter_properties(struct cxl *adapter, struct device_node *np)
 	return 0;
 }
 
-static int cxl_of_remove(struct platform_device *pdev)
+static void cxl_of_remove(struct platform_device *pdev)
 {
 	struct cxl *adapter;
 	int afu;
@@ -441,7 +441,6 @@ static int cxl_of_remove(struct platform_device *pdev)
 		cxl_guest_remove_afu(adapter->afu[afu]);
 
 	cxl_guest_remove_adapter(adapter);
-	return 0;
 }
 
 static void cxl_of_shutdown(struct platform_device *pdev)
@@ -501,6 +500,6 @@ struct platform_driver cxl_of_driver = {
 		.owner = THIS_MODULE
 	},
 	.probe = cxl_of_probe,
-	.remove = cxl_of_remove,
+	.remove_new = cxl_of_remove,
 	.shutdown = cxl_of_shutdown,
 };
-- 
2.43.0

