Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7B64AF6D2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 17:35:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jv58b5N1lz3cSN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 03:35:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=O+SpsGrR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org;
 envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=O+SpsGrR; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jv5601XVnz2ywt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 03:33:10 +1100 (AEDT)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id EC0A9223F0;
 Wed,  9 Feb 2022 17:33:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1644424388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gq99bFkcrEikiih4d3fvkzvS2Vsk7Jsn46I5OX6vVJ0=;
 b=O+SpsGrRpogNX69h5g8D7lKsEcmnLspbjNdlBji7ORx6z8L7v+V9B+JH42trKA5wL9fJwo
 CgIY1hiA1/fnU5AW/mAOb5K9yunxs/e5E/vWyuEM5KrBVXQzQSToZaG1usP14ga2A8iVgd
 DQHk42FclwwYvxY8zL4dn2yMgiiQjtg=
From: Michael Walle <michael@walle.cc>
To: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] soc: fsl: guts: allocate soc_dev_attr on the heap
Date: Wed,  9 Feb 2022 17:32:39 +0100
Message-Id: <20220209163242.430265-5-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209163242.430265-1-michael@walle.cc>
References: <20220209163242.430265-1-michael@walle.cc>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Li Yang <leoyang.li@nxp.com>, Michael Walle <michael@walle.cc>,
 Sudeep Holla <Sudeep.Holla@arm.com>, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the last global static variable. Drop it and allocate the memory
on the heap instead.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/soc/fsl/guts.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 4e5675ab5f73..f992064a7f58 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -20,9 +20,6 @@ struct fsl_soc_die_attr {
 	u32	mask;
 };
 
-static struct soc_device_attribute soc_dev_attr;
-
-
 /* SoC die attribute definition for QorIQ platform */
 static const struct fsl_soc_die_attr fsl_soc_die[] = {
 	/*
@@ -116,6 +113,7 @@ static const struct fsl_soc_die_attr *fsl_soc_die_match(
 static int fsl_guts_probe(struct platform_device *pdev)
 {
 	struct device_node *root, *np = pdev->dev.of_node;
+	struct soc_device_attribute *soc_dev_attr;
 	static struct soc_device *soc_dev;
 	struct device *dev = &pdev->dev;
 	const struct fsl_soc_die_attr *soc_die;
@@ -136,12 +134,16 @@ static int fsl_guts_probe(struct platform_device *pdev)
 	iounmap(regs);
 
 	/* Register soc device */
+	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
+	if (!soc_dev_attr)
+		return -ENOMEM;
+
 	root = of_find_node_by_path("/");
 	if (of_property_read_string(root, "model", &machine))
 		of_property_read_string_index(root, "compatible", 0, &machine);
 	if (machine) {
-		soc_dev_attr.machine = devm_kstrdup(dev, machine, GFP_KERNEL);
-		if (!soc_dev_attr.machine) {
+		soc_dev_attr->machine = devm_kstrdup(dev, machine, GFP_KERNEL);
+		if (!soc_dev_attr->machine) {
 			of_node_put(root);
 			return -ENOMEM;
 		}
@@ -150,30 +152,30 @@ static int fsl_guts_probe(struct platform_device *pdev)
 
 	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
 	if (soc_die) {
-		soc_dev_attr.family = devm_kasprintf(dev, GFP_KERNEL,
-						     "QorIQ %s", soc_die->die);
+		soc_dev_attr->family = devm_kasprintf(dev, GFP_KERNEL,
+						      "QorIQ %s", soc_die->die);
 	} else {
-		soc_dev_attr.family = devm_kasprintf(dev, GFP_KERNEL, "QorIQ");
+		soc_dev_attr->family = devm_kasprintf(dev, GFP_KERNEL, "QorIQ");
 	}
-	if (!soc_dev_attr.family)
+	if (!soc_dev_attr->family)
 		return -ENOMEM;
-	soc_dev_attr.soc_id = devm_kasprintf(dev, GFP_KERNEL,
+	soc_dev_attr->soc_id = devm_kasprintf(dev, GFP_KERNEL,
 					     "svr:0x%08x", svr);
-	if (!soc_dev_attr.soc_id)
+	if (!soc_dev_attr->soc_id)
 		return -ENOMEM;
-	soc_dev_attr.revision = devm_kasprintf(dev, GFP_KERNEL, "%d.%d",
+	soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "%d.%d",
 					       (svr >>  4) & 0xf, svr & 0xf);
-	if (!soc_dev_attr.revision)
+	if (!soc_dev_attr->revision)
 		return -ENOMEM;
 
-	soc_dev = soc_device_register(&soc_dev_attr);
+	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
-	pr_info("Machine: %s\n", soc_dev_attr.machine);
-	pr_info("SoC family: %s\n", soc_dev_attr.family);
+	pr_info("Machine: %s\n", soc_dev_attr->machine);
+	pr_info("SoC family: %s\n", soc_dev_attr->family);
 	pr_info("SoC ID: %s, Revision: %s\n",
-		soc_dev_attr.soc_id, soc_dev_attr.revision);
+		soc_dev_attr->soc_id, soc_dev_attr->revision);
 	return 0;
 }
 
-- 
2.30.2

