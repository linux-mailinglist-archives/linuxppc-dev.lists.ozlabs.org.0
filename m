Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1D372A25C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 20:34:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qd8qd5KYgz3g3B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 04:34:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.176; helo=mail-il1-f176.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qd8pF03h7z3fjl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 04:32:52 +1000 (AEST)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-33b4b70693eso9067295ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 11:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686335570; x=1688927570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDsI6y+39w6RrJxOoiKJblVUr+xr5BV/zYozHnP9juw=;
        b=ctz6fbmnMEjqkofUMGu9ysN7mWQhSvdYKpaaQLZTAzG5k1Nxok5re9SYI73O9ytSI2
         PxfoJY5frIAavW6s5LXRJMtHJGrtVT8MKYpAQpheHuuXY35v8Jqv/aWuf4sDIaopR2e9
         yXg84RbRjOZX/FFVq79cZsT0YnzwA0K5OMIxtQ1HM4qwXghXSOyqez5vrayPLvBhAcz7
         ayfqd6bUMzRXq7IR2Z59UKJulv29DOx2rkZ4rVzr2nPZzwio0Le/CZoK6nHl2bnXPokA
         IAk+ZkH33SO2EvvUYL3xygeN6/SOc2ooPYdFXyXCQTU21Pb+mwYTu89ggTMLXZt+WkOz
         4Rlw==
X-Gm-Message-State: AC+VfDwX3m2MVVy8sXd17sWCu0VeLrSQRW416pYe7TSwNJmIUEDXvl7P
	K8VrGooQ+puv48UvBiQeAw==
X-Google-Smtp-Source: ACHHUZ6DEagZP+w3SELSpPxmJK661d/nGvdwb8QCFGy6mM1D9jVKQqt37IfcnNZh71b3U4xaaQlZTg==
X-Received: by 2002:a92:c743:0:b0:331:a2f5:b50d with SMTP id y3-20020a92c743000000b00331a2f5b50dmr2068590ilp.30.1686335570552;
        Fri, 09 Jun 2023 11:32:50 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id p7-20020a056e0206c700b0033b2a123254sm1199546ils.61.2023.06.09.11.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 11:32:49 -0700 (PDT)
Received: (nullmailer pid 1767422 invoked by uid 1000);
	Fri, 09 Jun 2023 18:32:48 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: fsl_rio: Use of_range_to_resource() for "ranges" parsing
Date: Fri,  9 Jun 2023 12:32:44 -0600
Message-Id: <20230609183244.1767325-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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

"ranges" is a standard property with common parsing functions. Users
shouldn't be implementing their own parsing of it. Refactor the FSL RapidIO
"ranges" parsing to use of_range_to_resource() instead.

One change is the original code would look for "#size-cells" and
"#address-cells" in the parent node if not found in the port child
nodes. That is non-standard behavior and not necessary AFAICT. In 2011
in commit 54986964c13c ("powerpc/85xx: Update SRIO device tree nodes")
there was an ABI break. The upstream .dts files have been correct since
at least that point.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/sysdev/fsl_rio.c | 34 ++++++++--------------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
index f8e492ee54cc..18176d0df612 100644
--- a/arch/powerpc/sysdev/fsl_rio.c
+++ b/arch/powerpc/sysdev/fsl_rio.c
@@ -453,8 +453,8 @@ int fsl_rio_setup(struct platform_device *dev)
 	struct device_node *np, *rmu_node;
 	int rlen;
 	u32 ccsr;
-	u64 range_start, range_size;
-	int paw, aw, sw;
+	u64 range_start;
+	int aw;
 	u32 i;
 	static int tmp;
 	struct device_node *rmu_np[MAX_MSG_UNIT_NUM] = {NULL};
@@ -569,6 +569,8 @@ int fsl_rio_setup(struct platform_device *dev)
 
 	/*set up ports node*/
 	for_each_child_of_node(dev->dev.of_node, np) {
+		struct resource res;
+
 		port_index = of_get_property(np, "cell-index", NULL);
 		if (!port_index) {
 			dev_err(&dev->dev, "Can't get %pOF property 'cell-index'\n",
@@ -576,32 +578,14 @@ int fsl_rio_setup(struct platform_device *dev)
 			continue;
 		}
 
-		dt_range = of_get_property(np, "ranges", &rlen);
-		if (!dt_range) {
+		if (of_range_to_resource(np, 0, &res)) {
 			dev_err(&dev->dev, "Can't get %pOF property 'ranges'\n",
 					np);
 			continue;
 		}
 
-		/* Get node address wide */
-		cell = of_get_property(np, "#address-cells", NULL);
-		if (cell)
-			aw = *cell;
-		else
-			aw = of_n_addr_cells(np);
-		/* Get node size wide */
-		cell = of_get_property(np, "#size-cells", NULL);
-		if (cell)
-			sw = *cell;
-		else
-			sw = of_n_size_cells(np);
-		/* Get parent address wide wide */
-		paw = of_n_addr_cells(np);
-		range_start = of_read_number(dt_range + aw, paw);
-		range_size = of_read_number(dt_range + aw + paw, sw);
-
-		dev_info(&dev->dev, "%pOF: LAW start 0x%016llx, size 0x%016llx.\n",
-				np, range_start, range_size);
+		dev_info(&dev->dev, "%pOF: LAW %pR\n",
+				np, &res);
 
 		port = kzalloc(sizeof(struct rio_mport), GFP_KERNEL);
 		if (!port)
@@ -624,9 +608,7 @@ int fsl_rio_setup(struct platform_device *dev)
 		}
 
 		INIT_LIST_HEAD(&port->dbells);
-		port->iores.start = range_start;
-		port->iores.end = port->iores.start + range_size - 1;
-		port->iores.flags = IORESOURCE_MEM;
+		port->iores = res;	/* struct copy */
 		port->iores.name = "rio_io_win";
 
 		if (request_resource(&iomem_resource, &port->iores) < 0) {
-- 
2.39.2

