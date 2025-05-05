Return-Path: <linuxppc-dev+bounces-8301-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A01D2AA9B16
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 19:53:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zrpzg0BzWz2yjV;
	Tue,  6 May 2025 03:53:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.174
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746467614;
	cv=none; b=AcJ/ihAavd4JiVQQOnip5u9nc1wvvnerNM7gI1tf4lmrve2VMTKE4cCBPBZntWKT2J/fkLtmDEYZxVxYjc8tkN9RVj0/qZcXRHigakuRmuuui5sfd2+R7lreRe9v/P+xMGRXTjGh/akgRI3LxH4fggFaIr7mxJcufZRqsmLv/oRTTlUrQbqtE+RjfHBSuNdlK+Wxms27ASFJbisRda2doPRk/L/pgDbmzzQXdbOYkMlTbMOskvkPE66fatL65xISdDtQwnLdL4oOA7a4aqRqyjrE1fcprxCyRUi5SxyVZVwzqrhaCz8uTHb8ysGXfZcoRZNxBHPxBCJRkHhWAHOSIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746467614; c=relaxed/relaxed;
	bh=H/0FfEoCrhgrnSzEOABRQlXhzxjXZ3dagdn6M3qI7iM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B3H0iVQlL9W8V0TELQhpx9jjqh1t6Q6rdbRxo6Cet5ni2CI1VG8BZif+EYxS5v+x7HALhFE7X21iiCVQvbzlF+MrSQ/ZfG4tk1GSDGLcb3M63vMI9MnjGwUFak1EWbwqL/UsxTXlF4jF/wdAEAI6T2sL7mZigxh6PR7bxb5j0kZoalNAopRMPYCscPImQ0ocv77FplUuu90lwQZLdZDGJCnlwROou8p9bLScgN4NbytdJLngnXI7jNXa4HVOxE1MAH50klVx60Eo5WGKG9FqVnbdrnHpr999NcJJQAU0tmQh/GE36BJvGCYHBDcoXxOdoLinCLME6/8mpFa1XmDx1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass (client-ip=91.218.175.174; helo=out-174.mta0.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.174; helo=out-174.mta0.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org)
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zrpzd5vlSz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 03:53:31 +1000 (AEST)
Date: Mon, 5 May 2025 13:53:07 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ben Collins <bcollins@kernel.org>
To: dmaengine@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Vinod Koul <vkoul@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] fsldma: Set correct dma_mask based on hw capability
Message-ID: <2025050513-complex-crane-2babb6@boujee-and-buff>
Mail-Followup-To: dmaengine@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Vinod Koul <vkoul@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The driver currently hardcodes DMA_BIT_MASK to 36-bits, which is only
correct on eloplus:

elo3		supports 40-bits
eloplus		supports 36-bits
elo		supports 32-bits

This is based on 0x08 cdar register documention in the respective
reference manuals. Set the dma mask accordingly.

Feedback from Arnd Bergmann:

- Use match data to set address bit mask

Signed-off-by: Ben Collins <bcollins@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/dma/fsldma.c | 20 ++++++++++++++++----
 drivers/dma/fsldma.h |  1 +
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index b5e7d18b97669..566db5a1b0bab 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1226,6 +1226,8 @@ static int fsldma_of_probe(struct platform_device *op)
 
 	fdev->dev = &op->dev;
 	INIT_LIST_HEAD(&fdev->common.channels);
+	/* The DMA address bits supported for this device. */
+	fdev->addr_bits = (long)device_get_match_data(fdev->dev);
 
 	/* ioremap the registers for use */
 	fdev->regs = of_iomap(op->dev.of_node, 0);
@@ -1254,7 +1256,7 @@ static int fsldma_of_probe(struct platform_device *op)
 	fdev->common.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
 	fdev->common.residue_granularity = DMA_RESIDUE_GRANULARITY_DESCRIPTOR;
 
-	dma_set_mask(&(op->dev), DMA_BIT_MASK(36));
+	dma_set_mask(&(op->dev), DMA_BIT_MASK(fdev->addr_bits));
 
 	platform_set_drvdata(op, fdev);
 
@@ -1387,10 +1389,20 @@ static const struct dev_pm_ops fsldma_pm_ops = {
 };
 #endif
 
+/* The .data field is used for dma-bit-mask. */
 static const struct of_device_id fsldma_of_ids[] = {
-	{ .compatible = "fsl,elo3-dma", },
-	{ .compatible = "fsl,eloplus-dma", },
-	{ .compatible = "fsl,elo-dma", },
+	{
+		.compatible = "fsl,elo3-dma",
+		.data = (void *)40,
+	},
+	{
+		.compatible = "fsl,eloplus-dma",
+		.data = (void *)36,
+	},
+	{
+		.compatible = "fsl,elo-dma",
+		.data = (void *)32,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsldma_of_ids);
diff --git a/drivers/dma/fsldma.h b/drivers/dma/fsldma.h
index 308bed0a560ac..2ea57df9b7f7d 100644
--- a/drivers/dma/fsldma.h
+++ b/drivers/dma/fsldma.h
@@ -124,6 +124,7 @@ struct fsldma_device {
 	struct fsldma_chan *chan[FSL_DMA_MAX_CHANS_PER_DEVICE];
 	u32 feature;		/* The same as DMA channels */
 	int irq;		/* Channel IRQ */
+	int addr_bits;		/* DMA addressing bits supported */
 };
 
 /* Define macros for fsldma_chan->feature property */
-- 
2.49.0


-- 
 Ben Collins
 https://libjwt.io
 https://github.com/benmcollins
 --
 3EC9 7598 1672 961A 1139  173A 5D5A 57C7 242B 22CF

