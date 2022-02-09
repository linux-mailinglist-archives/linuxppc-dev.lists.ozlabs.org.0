Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 699BB4AF6D0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 17:34:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jv57J18T1z3cHW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 03:34:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=miePmVQ/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org;
 envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=miePmVQ/; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jv5601sgVz30RT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 03:33:10 +1100 (AEDT)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3BECC223ED;
 Wed,  9 Feb 2022 17:33:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1644424387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JP6sEk8Ye9HSeLSodsUhxvuoScwCGtEWcY67WHVPIzw=;
 b=miePmVQ/1DdQbb6LxDr08xDl2eTqmNKTKv8vg+YXL/XIs/ZuIPJ4TeLT/BC2euibbnNFFj
 c+57hSU3d+ADUP6sPmKBwbXsXaI8P/ce+actiNXLio0Q3jkse33Hn2CIGHidIap2OrhOtH
 G2/8srJAysOt9tBm2WFQQboceihTHHs=
From: Michael Walle <michael@walle.cc>
To: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] soc: fsl: guts: remove module_exit() and
 fsl_guts_remove()
Date: Wed,  9 Feb 2022 17:32:37 +0100
Message-Id: <20220209163242.430265-3-michael@walle.cc>
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

This driver will never be unloaded. Firstly, it is not available as a
module, but more importantly, other drivers will depend on this one to
apply possible chip errata.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/soc/fsl/guts.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index be18d46c7b0f..0bea43770d51 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -27,7 +27,6 @@ struct fsl_soc_die_attr {
 
 static struct guts *guts;
 static struct soc_device_attribute soc_dev_attr;
-static struct soc_device *soc_dev;
 
 
 /* SoC die attribute definition for QorIQ platform */
@@ -138,6 +137,7 @@ static u32 fsl_guts_get_svr(void)
 static int fsl_guts_probe(struct platform_device *pdev)
 {
 	struct device_node *root, *np = pdev->dev.of_node;
+	static struct soc_device *soc_dev;
 	struct device *dev = &pdev->dev;
 	const struct fsl_soc_die_attr *soc_die;
 	const char *machine = NULL;
@@ -197,12 +197,6 @@ static int fsl_guts_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int fsl_guts_remove(struct platform_device *dev)
-{
-	soc_device_unregister(soc_dev);
-	return 0;
-}
-
 /*
  * Table for matching compatible strings, for device tree
  * guts node, for Freescale QorIQ SOCs.
@@ -242,7 +236,6 @@ static struct platform_driver fsl_guts_driver = {
 		.of_match_table = fsl_guts_of_match,
 	},
 	.probe = fsl_guts_probe,
-	.remove = fsl_guts_remove,
 };
 
 static int __init fsl_guts_init(void)
@@ -250,9 +243,3 @@ static int __init fsl_guts_init(void)
 	return platform_driver_register(&fsl_guts_driver);
 }
 core_initcall(fsl_guts_init);
-
-static void __exit fsl_guts_exit(void)
-{
-	platform_driver_unregister(&fsl_guts_driver);
-}
-module_exit(fsl_guts_exit);
-- 
2.30.2

