Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A664AF6CD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 17:33:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jv56c5zYnz3bZR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 03:33:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=YHUChgd1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org;
 envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=YHUChgd1; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jv5601wFrz3Wtt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 03:33:10 +1100 (AEDT)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 769BF223EF;
 Wed,  9 Feb 2022 17:33:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1644424387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HN25io342QOR5mmEV6tf4MRIjAJRxY2Op5Ab+a0YmEg=;
 b=YHUChgd1d04ILxJbetmIN3AGxbhcgCDNGi8TMJX6336yOh3eVZNhmEIUAp3pH2A2hAQC5S
 w5VHLIr2tkAPcvc28BhIM2StcUdwJPI5tduTj2DrwlTxfGc2n8C5Tu7zc3J/zI1fN621P2
 xQUgE60xvbpSwNsqKDb/D57h5LHoe50=
From: Michael Walle <michael@walle.cc>
To: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] soc: fsl: guts: embed fsl_guts_get_svr() in probe()
Date: Wed,  9 Feb 2022 17:32:38 +0100
Message-Id: <20220209163242.430265-4-michael@walle.cc>
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

Move the reading of the SVR into the probe function as
fsl_guts_get_svr() is the only user of the static guts variable and this
lets us drop that as well as the malloc() for this variable. Also, we
can unmap the memory region after we accessed it, which will simplify
error handling later.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/soc/fsl/guts.c | 42 +++++++++++-------------------------------
 1 file changed, 11 insertions(+), 31 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 0bea43770d51..4e5675ab5f73 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -14,18 +14,12 @@
 #include <linux/platform_device.h>
 #include <linux/fsl/guts.h>
 
-struct guts {
-	struct ccsr_guts __iomem *regs;
-	bool little_endian;
-};
-
 struct fsl_soc_die_attr {
 	char	*die;
 	u32	svr;
 	u32	mask;
 };
 
-static struct guts *guts;
 static struct soc_device_attribute soc_dev_attr;
 
 
@@ -119,40 +113,27 @@ static const struct fsl_soc_die_attr *fsl_soc_die_match(
 	return NULL;
 }
 
-static u32 fsl_guts_get_svr(void)
-{
-	u32 svr = 0;
-
-	if (!guts || !guts->regs)
-		return svr;
-
-	if (guts->little_endian)
-		svr = ioread32(&guts->regs->svr);
-	else
-		svr = ioread32be(&guts->regs->svr);
-
-	return svr;
-}
-
 static int fsl_guts_probe(struct platform_device *pdev)
 {
 	struct device_node *root, *np = pdev->dev.of_node;
 	static struct soc_device *soc_dev;
 	struct device *dev = &pdev->dev;
 	const struct fsl_soc_die_attr *soc_die;
+	struct ccsr_guts __iomem *regs;
 	const char *machine = NULL;
+	bool little_endian;
 	u32 svr;
 
-	/* Initialize guts */
-	guts = devm_kzalloc(dev, sizeof(*guts), GFP_KERNEL);
-	if (!guts)
-		return -ENOMEM;
-
-	guts->little_endian = of_property_read_bool(np, "little-endian");
+	regs = of_iomap(np, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
-	guts->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(guts->regs))
-		return PTR_ERR(guts->regs);
+	little_endian = of_property_read_bool(np, "little-endian");
+	if (little_endian)
+		svr = ioread32(&regs->svr);
+	else
+		svr = ioread32be(&regs->svr);
+	iounmap(regs);
 
 	/* Register soc device */
 	root = of_find_node_by_path("/");
@@ -167,7 +148,6 @@ static int fsl_guts_probe(struct platform_device *pdev)
 	}
 	of_node_put(root);
 
-	svr = fsl_guts_get_svr();
 	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
 	if (soc_die) {
 		soc_dev_attr.family = devm_kasprintf(dev, GFP_KERNEL,
-- 
2.30.2

