Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E10569A4C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 08:16:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdmQF4TMDz3dqt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 16:16:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdmNw6Wf0z3btl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 16:15:26 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1o9Kn5-0005KC-8s; Thu, 07 Jul 2022 08:15:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o9Kmu-004u7B-Tt; Thu, 07 Jul 2022 08:15:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o9Kmx-003Vh2-NK; Thu, 07 Jul 2022 08:14:59 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/3] powerpc/platforms/83xx/suspend: Reorder to get rid of a forward declaration
Date: Thu,  7 Jul 2022 08:14:39 +0200
Message-Id: <20220707061441.193869-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728; h=from:subject; bh=HMffZNI4XQPXeJaGgzoz2/GNi3XCTP3KJXHFqUGCfCQ=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBixnnGM3zx4xFctkRxBs6fL9m6HE4cl8Gmgkn2RMSj aFx0I9qJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYsZ5xgAKCRDB/BR4rcrsCc5lB/ 4+5yatNEHw7V45EjN7p3F7geZNj4gcBvVDKPemndR54DnRJRqnbUI8zgKx2u1uBZU/8bHcnJR1pgnM KBDq5yQ1DyPYMKw6wntayr/fNoqBLPU+Aoc5FYY8Uu7qaF9vnHSLRFIWqjEbheW9sew5pkIhNw+B1m dmwZOGNXfq/knVkrjTweqAwSBRnAs37VLqtE+qLM0zNc1bxbPiYyRoRMSK3Gc+NqwKnVQSSlWKMeUr w1foklGXrI9nXZXmrPDYrYBoD7zfSjdCfuUy/e6nk/wZUwHNW9lamea8/tQl+RRfRqJc+KbCNe33fP c8dCjBt7bsiwxu0ZFHwuIBI4532+pv
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
Cc: kernel@pengturonix.de, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

By moving up pmc_types and pmc_match, the forward declaration for pmc_match
can be dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/powerpc/platforms/83xx/suspend.c | 43 +++++++++++++--------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/suspend.c b/arch/powerpc/platforms/83xx/suspend.c
index 6d47a5b81485..30b7700a2c98 100644
--- a/arch/powerpc/platforms/83xx/suspend.c
+++ b/arch/powerpc/platforms/83xx/suspend.c
@@ -319,7 +319,27 @@ static const struct platform_suspend_ops mpc83xx_suspend_ops = {
 	.end = mpc83xx_suspend_end,
 };
 
-static const struct of_device_id pmc_match[];
+static struct pmc_type pmc_types[] = {
+	{
+		.has_deep_sleep = 1,
+	},
+	{
+		.has_deep_sleep = 0,
+	}
+};
+
+static const struct of_device_id pmc_match[] = {
+	{
+		.compatible = "fsl,mpc8313-pmc",
+		.data = &pmc_types[0],
+	},
+	{
+		.compatible = "fsl,mpc8349-pmc",
+		.data = &pmc_types[1],
+	},
+	{}
+};
+
 static int pmc_probe(struct platform_device *ofdev)
 {
 	struct device_node *np = ofdev->dev.of_node;
@@ -406,27 +426,6 @@ static int pmc_remove(struct platform_device *ofdev)
 	return -EPERM;
 };
 
-static struct pmc_type pmc_types[] = {
-	{
-		.has_deep_sleep = 1,
-	},
-	{
-		.has_deep_sleep = 0,
-	}
-};
-
-static const struct of_device_id pmc_match[] = {
-	{
-		.compatible = "fsl,mpc8313-pmc",
-		.data = &pmc_types[0],
-	},
-	{
-		.compatible = "fsl,mpc8349-pmc",
-		.data = &pmc_types[1],
-	},
-	{}
-};
-
 static struct platform_driver pmc_driver = {
 	.driver = {
 		.name = "mpc83xx-pmc",

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

