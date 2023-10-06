Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF9F7BC182
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 23:46:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vo565lnS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2MSH5Wl9z3vbT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 08:46:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vo565lnS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2MRR3WgKz3bws
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 08:45:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49D3A619E4;
	Fri,  6 Oct 2023 21:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEB4C433C8;
	Fri,  6 Oct 2023 21:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696628721;
	bh=i+PAI5tS9dQFHq2UMHdhk9RfN5pkw2PWAlQmRe31xno=;
	h=From:To:Cc:Subject:Date:From;
	b=Vo565lnSLZ2W3SIoc47sdQoPbrIHs2BdRkW2RJdfXI5ijLO4KPy069jJH4ezPmAW3
	 V815SJZ08RdABhfA4NuEXVWyYKjXEZZG+Ztpk9zcmI0H0P8l7x3u0AX5f2C5v+olqJ
	 v0kMx1q58+WOxorH6l/5iby1Om0tmcVwsZc72MjEhN0+Nu+2vI5pWdDA9cEv7bB7fn
	 b4tMJst71tkSu2c+vZ9f6afbA8B3PipHNsYNW/zbJZFwOWgww8mxyTp6eaIRu79w3Q
	 iQXWlhQURfMbq4H7FYj3HtvfWlJMg4ZLOjNumE2jwRZlAANkD9DRsivzE3BnRduGch
	 zO8W9upmtgjwA==
Received: (nullmailer pid 340666 invoked by uid 1000);
	Fri, 06 Oct 2023 21:45:19 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: fsl_msi: Use device_get_match_data()
Date: Fri,  6 Oct 2023 16:45:16 -0500
Message-Id: <20231006214516.340589-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use preferred device_get_match_data() instead of of_match_device() to
get the driver match data. With this, adjust the includes to explicitly
include the correct headers.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/sysdev/fsl_msi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index 57978a44d55b..558ec68d768e 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -11,9 +11,11 @@
 #include <linux/msi.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/interrupt.h>
 #include <linux/irqdomain.h>
 #include <linux/seq_file.h>
@@ -392,7 +394,6 @@ static int fsl_msi_setup_hwirq(struct fsl_msi *msi, struct platform_device *dev,
 static const struct of_device_id fsl_of_msi_ids[];
 static int fsl_of_msi_probe(struct platform_device *dev)
 {
-	const struct of_device_id *match;
 	struct fsl_msi *msi;
 	struct resource res, msiir;
 	int err, i, j, irq_index, count;
@@ -402,10 +403,7 @@ static int fsl_of_msi_probe(struct platform_device *dev)
 	u32 offset;
 	struct pci_controller *phb;
 
-	match = of_match_device(fsl_of_msi_ids, &dev->dev);
-	if (!match)
-		return -EINVAL;
-	features = match->data;
+	features = device_get_match_data(&dev->dev);
 
 	printk(KERN_DEBUG "Setting up Freescale MSI support\n");
 
-- 
2.40.1

