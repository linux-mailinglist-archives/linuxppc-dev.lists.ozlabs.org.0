Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5702749E7FD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 17:49:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl64l21RHz3cTl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 03:49:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=B8c6IRQO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org;
 envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=B8c6IRQO; 
 dkim-atps=neutral
X-Greylist: delayed 363 seconds by postgrey-1.36 at boromir;
 Fri, 28 Jan 2022 03:47:46 AEDT
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl62p4jqJz30Nx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 03:47:46 +1100 (AEDT)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4B9B6223F0;
 Thu, 27 Jan 2022 17:41:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643301702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1LihC01snsz2jvGOnd10qw1QpXW5+8EkOXvBdUPwZNg=;
 b=B8c6IRQOCX9H308G07Q1+3M4mhhAkQFmCE+d1jyryGET+1xW8CFT/DYIb57c2ZUMJ7YZOt
 D2mEi2j7/wRW7bqFFblhKJung1+aEzMTARc6zZTFDQb2VJzKxW4kxeoNKLNkD4GfllpIRz
 ZnitdI8mblVQp4kkWu7a6cJOhaVJ9wI=
From: Michael Walle <michael@walle.cc>
To: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/7] soc: fsl: guts: allocate soc_dev_attr on the heap
Date: Thu, 27 Jan 2022 17:41:22 +0100
Message-Id: <20220127164125.3651285-5-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127164125.3651285-1-michael@walle.cc>
References: <20220127164125.3651285-1-michael@walle.cc>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Sudeep Holla <Sudeep.Holla@arm.com>,
 Michael Walle <michael@walle.cc>, Arnd Bergmann <arnd@arndb.de>,
 Li Yang <leoyang.li@nxp.com>
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
index 536377988fb4..383b35a4ed58 100644
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
@@ -124,6 +122,10 @@ static int fsl_guts_probe(struct platform_device *pdev)
 	bool little_endian;
 	u32 svr;
 
+	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
+	if (!soc_dev_attr)
+		return -ENOMEM;
+
 	little_endian = of_property_read_bool(np, "little-endian");
 
 	regs = of_iomap(np, 0);
@@ -141,8 +143,8 @@ static int fsl_guts_probe(struct platform_device *pdev)
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
@@ -151,30 +153,30 @@ static int fsl_guts_probe(struct platform_device *pdev)
 
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

