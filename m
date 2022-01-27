Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FAC49E7FE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 17:50:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl65Q4YFcz3bZL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 03:50:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=j2CFrtte;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=2a01:4f8:151:8464::1:2;
 helo=ssl.serverraum.org; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=j2CFrtte; 
 dkim-atps=neutral
X-Greylist: delayed 359 seconds by postgrey-1.36 at boromir;
 Fri, 28 Jan 2022 03:47:47 AEDT
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl62q2vv6z3bPJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 03:47:47 +1100 (AEDT)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id EF3F7223EF;
 Thu, 27 Jan 2022 17:41:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643301700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dQTEDWQ6RIfy9o8kck9NRnhKASlbYsvOAuvfyda4Dbk=;
 b=j2CFrtteb7RlK1NVCouApJ3i42knoDyzSgub6t4Rf+8bnIDvlrm5EC1PiHr+As3PeNR6/U
 fjs6yXq9WlFlEYlcaTpqsy+pqXce1RJ6Cw27+FbLuOYjzBrr+84kfWow4gTat0dm3DG1/x
 fObvanLb2C4B+ZC7369DmTzO+oH16kw=
From: Michael Walle <michael@walle.cc>
To: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/7] soc: fsl: guts: embed fsl_guts_get_svr() in probe()
Date: Thu, 27 Jan 2022 17:41:21 +0100
Message-Id: <20220127164125.3651285-4-michael@walle.cc>
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

Move the reading of the SVR into the probe function as
fsl_guts_get_svr() is the only user of the static guts variable and this
lets us drop that as well as the malloc() for this variable. Also, we
can unmap the memory region after we accessed it, which will simplify
error handling later.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/soc/fsl/guts.c | 41 +++++++++++------------------------------
 1 file changed, 11 insertions(+), 30 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 0bea43770d51..536377988fb4 100644
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
 
 
@@ -119,40 +113,28 @@ static const struct fsl_soc_die_attr *fsl_soc_die_match(
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
+	little_endian = of_property_read_bool(np, "little-endian");
 
-	guts->little_endian = of_property_read_bool(np, "little-endian");
+	regs = of_iomap(np, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
-	guts->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(guts->regs))
-		return PTR_ERR(guts->regs);
+	if (little_endian)
+		svr = ioread32(&regs->svr);
+	else
+		svr = ioread32be(&regs->svr);
+	iounmap(regs);
 
 	/* Register soc device */
 	root = of_find_node_by_path("/");
@@ -167,7 +149,6 @@ static int fsl_guts_probe(struct platform_device *pdev)
 	}
 	of_node_put(root);
 
-	svr = fsl_guts_get_svr();
 	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
 	if (soc_die) {
 		soc_dev_attr.family = devm_kasprintf(dev, GFP_KERNEL,
-- 
2.30.2

