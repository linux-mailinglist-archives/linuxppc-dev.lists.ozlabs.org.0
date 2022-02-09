Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD524AF6D8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 17:36:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jv59x4qqTz3dgh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 03:36:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=SIaIv/ur;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=2a01:4f8:151:8464::1:2;
 helo=ssl.serverraum.org; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=SIaIv/ur; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jv5636TXmz2ywt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 03:33:15 +1100 (AEDT)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id D29DB2241C;
 Wed,  9 Feb 2022 17:33:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1644424388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+5nnbdOPpETNIr5p6dezuRxgMxXvvVq1MMIlzKxyUqM=;
 b=SIaIv/ur79bx1MUjMrs9fs0EsIUaBlcBf7HG6aj72FJGZbS+9p5rFhI34Qhx5qo+ddCtfl
 fIlgBt9vD++zo99rYCTBea3M2I9RGN34yGe1IEz03AqMqL9zOBZVMJ18B/A2+ofE6p3Q0h
 cGI3ESKo3dtSsOeedxNykwBM7SJSVZc=
From: Michael Walle <michael@walle.cc>
To: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] soc: fsl: guts: add serial_number support
Date: Wed,  9 Feb 2022 17:32:42 +0100
Message-Id: <20220209163242.430265-8-michael@walle.cc>
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

Most layerscapes provide a security fuse processor where the vendor
will store a unique id per part. Unfortunately, we cannot use the
corresponding efuse driver because this driver needs to be ready
early during the boot phase. To get the unique identifier, we just
need to access two registers. Thus we just search the device tree
for the corresponding device, map its memory to read the id and then
unmap it again.

Because it is likely that the offset within the fuses is dependent
on the SoC, we need a per SoC data. Also, the compatible string is
different among the SoCs. For now, this add support for the LS1028A
SoC.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/soc/fsl/guts.c | 48 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 370be923aa0f..27035de062f8 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -20,6 +20,11 @@ struct fsl_soc_die_attr {
 	u32	mask;
 };
 
+struct fsl_soc_data {
+	const char *sfp_compat;
+	u32 uid_offset;
+};
+
 /* SoC die attribute definition for QorIQ platform */
 static const struct fsl_soc_die_attr fsl_soc_die[] = {
 	/*
@@ -110,6 +115,33 @@ static const struct fsl_soc_die_attr *fsl_soc_die_match(
 	return NULL;
 }
 
+static u64 fsl_guts_get_soc_uid(const char *compat, unsigned int offset)
+{
+	struct device_node *np;
+	void __iomem *sfp_base;
+	u64 uid;
+
+	np = of_find_compatible_node(NULL, NULL, compat);
+	if (!np)
+		return 0;
+
+	sfp_base = of_iomap(np, 0);
+
+	uid = ioread32(sfp_base + offset);
+	uid <<= 32;
+	uid |= ioread32(sfp_base + offset + 4);
+
+	iounmap(sfp_base);
+	of_node_put(np);
+
+	return uid;
+}
+
+static const struct fsl_soc_data ls1028a_data = {
+	.sfp_compat = "fsl,ls1028a-sfp",
+	.uid_offset = 0x21c,
+};
+
 /*
  * Table for matching compatible strings, for device tree
  * guts node, for Freescale QorIQ SOCs.
@@ -138,7 +170,7 @@ static const struct of_device_id fsl_guts_of_match[] = {
 	{ .compatible = "fsl,ls1012a-dcfg", },
 	{ .compatible = "fsl,ls1046a-dcfg", },
 	{ .compatible = "fsl,lx2160a-dcfg", },
-	{ .compatible = "fsl,ls1028a-dcfg", },
+	{ .compatible = "fsl,ls1028a-dcfg", .data = &ls1028a_data},
 	{}
 };
 
@@ -147,16 +179,20 @@ static int __init fsl_guts_init(void)
 	struct soc_device_attribute *soc_dev_attr;
 	static struct soc_device *soc_dev;
 	const struct fsl_soc_die_attr *soc_die;
+	const struct fsl_soc_data *soc_data;
+	const struct of_device_id *match;
 	struct ccsr_guts __iomem *regs;
 	const char *machine = NULL;
 	struct device_node *np;
 	bool little_endian;
+	u64 soc_uid = 0;
 	u32 svr;
 	int ret;
 
-	np = of_find_matching_node_and_match(NULL, fsl_guts_of_match, NULL);
+	np = of_find_matching_node_and_match(NULL, fsl_guts_of_match, &match);
 	if (!np)
 		return 0;
+	soc_data = match->data;
 
 	regs = of_iomap(np, 0);
 	if (IS_ERR(regs)) {
@@ -204,6 +240,13 @@ static int __init fsl_guts_init(void)
 	if (!soc_dev_attr->revision)
 		goto err_nomem;
 
+	if (soc_data)
+		soc_uid = fsl_guts_get_soc_uid(soc_data->sfp_compat,
+					       soc_data->uid_offset);
+	if (soc_uid)
+		soc_dev_attr->serial_number = kasprintf(GFP_KERNEL, "%016llX",
+							soc_uid);
+
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev)) {
 		ret = PTR_ERR(soc_dev);
@@ -224,6 +267,7 @@ static int __init fsl_guts_init(void)
 	kfree(soc_dev_attr->family);
 	kfree(soc_dev_attr->soc_id);
 	kfree(soc_dev_attr->revision);
+	kfree(soc_dev_attr->serial_number);
 	kfree(soc_dev_attr);
 
 	return ret;
-- 
2.30.2

