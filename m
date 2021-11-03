Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9AA444955
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 21:08:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkyWW48RHz2yYS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 07:08:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=wanadoo.fr
 (client-ip=80.12.242.125; helo=smtp.smtpout.orange.fr;
 envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
 [80.12.242.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkyW21B9Vz2xDm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 07:07:56 +1100 (AEDT)
Received: from pop-os.home ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id iMQlmtl2MUGqliMQlmsAS1; Wed, 03 Nov 2021 21:00:21 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Wed, 03 Nov 2021 21:00:21 +0100
X-ME-IP: 86.243.171.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: leoyang.li@nxp.com,
	tyreld@linux.ibm.com
Subject: [PATCH 1/2] soc: fsl: guts: Revert commit 3c0d64e867ed
Date: Wed,  3 Nov 2021 21:00:17 +0100
Message-Id: <1063e5a4738d897adcaffce2ab8e4e45f07998ff.1635969326.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit 3c0d64e867ed
("soc: fsl: guts: reuse machine name from device tree").

A following patch will fix the missing memory allocation failure check
instead.

Suggested-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This is a follow-up of discussion in:
https://lore.kernel.org/kernel-janitors/b12e8c5c5d6ab3061d9504de8fbaefcad6bbc385.1629321668.git.christophe.jaillet@wanadoo.fr/
---
 drivers/soc/fsl/guts.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 072473a16f4d..af7741eafc57 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -28,7 +28,6 @@ struct fsl_soc_die_attr {
 static struct guts *guts;
 static struct soc_device_attribute soc_dev_attr;
 static struct soc_device *soc_dev;
-static struct device_node *root;
 
 
 /* SoC die attribute definition for QorIQ platform */
@@ -138,7 +137,7 @@ static u32 fsl_guts_get_svr(void)
 
 static int fsl_guts_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *root, *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 	const struct fsl_soc_die_attr *soc_die;
 	const char *machine;
@@ -159,8 +158,9 @@ static int fsl_guts_probe(struct platform_device *pdev)
 	root = of_find_node_by_path("/");
 	if (of_property_read_string(root, "model", &machine))
 		of_property_read_string_index(root, "compatible", 0, &machine);
+	of_node_put(root);
 	if (machine)
-		soc_dev_attr.machine = machine;
+		soc_dev_attr.machine = devm_kstrdup(dev, machine, GFP_KERNEL);
 
 	svr = fsl_guts_get_svr();
 	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
@@ -195,7 +195,6 @@ static int fsl_guts_probe(struct platform_device *pdev)
 static int fsl_guts_remove(struct platform_device *dev)
 {
 	soc_device_unregister(soc_dev);
-	of_node_put(root);
 	return 0;
 }
 
-- 
2.30.2

