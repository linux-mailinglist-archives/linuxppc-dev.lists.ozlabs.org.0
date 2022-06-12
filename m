Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8127547C81
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jun 2022 23:35:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LLnzV33Nvz3ch4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 07:35:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LLnz20ry9z3bm7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 07:34:35 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1o0VDq-0007Pl-1K; Sun, 12 Jun 2022 23:34:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o0VDj-000AuT-3g; Sun, 12 Jun 2022 23:34:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o0VDh-00FuUl-Rp; Sun, 12 Jun 2022 23:34:05 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Anatolij Gustschin <agust@denx.de>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/52xx: Mark gpt driver as not removable
Date: Sun, 12 Jun 2022 23:34:00 +0200
Message-Id: <20220612213400.159257-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608; h=from:subject; bh=Hh648+gLAqK/mB1nufVXQVV3QN/Ix3v7rjvdmjuOOME=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiplu+v888DLJBwL+hApWQurNwIl0i9W+bQXyekIHe wiNUfDWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYqZbvgAKCRDB/BR4rcrsCWUUB/ wON2CQHL15u3l4dG78DDc1nHxI7aSDZp7mzIFN7wYzjBc0ckEEz9afK//KJfJvVGrw7wEOv0ZaBWYD IEQV1Umglnn7DRA4EAbWyhIpHpOnyhYGL2v1/JdomzxK4BR74+qZnmNlCT4IuNcTKhkaqxn2VLalTb xSuXzvWHeWMUcLG2YQ1nlwkV5LRh4ZjnQ4yRbO4dWaTknCCelPOigeDXRRDfo6Z5nZvChn2BNq8OFj NOGlz9LrJ0/R/bngneyfpg8sUVaqw2qyH6Vc3IXa9L13CVUZPR6yKq0QH6go5rpe+AFoK6AAbzEgt6 G/DpMaL7OBDH0IljUAA2/3M5W9PZ6k
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Returning an error code (here -EBUSY) from a remove callback doesn't
prevent the driver from being unloaded. The only effect is that an error
message is emitted and the driver is removed anyhow.

So instead drop the remove function (which is equivalent to returning zero)
and set the suppress_bind_attrs property to make it impossible to unload
the driver via sysfs.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index 968f5b727273..b2c24cab4b1e 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -755,11 +755,6 @@ static int mpc52xx_gpt_probe(struct platform_device *ofdev)
 	return 0;
 }
 
-static int mpc52xx_gpt_remove(struct platform_device *ofdev)
-{
-	return -EBUSY;
-}
-
 static const struct of_device_id mpc52xx_gpt_match[] = {
 	{ .compatible = "fsl,mpc5200-gpt", },
 
@@ -772,10 +767,10 @@ static const struct of_device_id mpc52xx_gpt_match[] = {
 static struct platform_driver mpc52xx_gpt_driver = {
 	.driver = {
 		.name = "mpc52xx-gpt",
+		.suppress_bind_attrs = true,
 		.of_match_table = mpc52xx_gpt_match,
 	},
 	.probe = mpc52xx_gpt_probe,
-	.remove = mpc52xx_gpt_remove,
 };
 
 static int __init mpc52xx_gpt_init(void)

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

