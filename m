Return-Path: <linuxppc-dev+bounces-2941-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FAA9BF878
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 22:27:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkJDx6sX7z2yKD;
	Thu,  7 Nov 2024 08:26:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730928417;
	cv=none; b=Oq5DJhh6/3Vopm+qnM3MmcJfmJPfHjhMj8YohepgiuB589fK5AAO6Eu4+ybubijsAPt357879fwPsyIrgwzr50AmfnFYEfVrmF/ms+AQDwbX2eUkG+z60/JyjkPz1f1HDyJJg2qc2Nx5L4veFwpYE6vr2NhIvg1wd5/FMR40Bw7N+XPZtbDid2M/6+1cyUqKIMLwtFwMlNJbOZWY9hOQLcgoXZYlPgyl97mxelT1egyoGH3rJQM5CBpaZWZ64+JTgt1XfzoJtZd4AxRShoLv6bfFFWECgPxHcIgf00V666qxi1nHZF8uza2x59Zez3EZQadMKUB0BGS7IpuvnYow8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730928417; c=relaxed/relaxed;
	bh=F8eRgNWrNr7HLGadjnBEU6xuLP+Vgz1AkN4VqCx3kW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJfxBqX0NONqBuMvn+JcBeu9Bk3zjf5UIP3sTO74xf2l50gKAiBr632xc5bHuG/jNiwnuzhV7ZDJTF9UU3LMYQfek+XTgr/Ovzg0GKQJNbj3Es/8hVpLZuyz63XgHyP/nHESEN331+jfBWtqtq5Gf+oTJTn/kCMAiPJ7Y7r32ZxO9iOkAeygSqAd+uuYvpSiVYoqPmj43hrLHS9gx4ri7WhUkdM+BA3dWvFqpZnczn/Ao0plgg5Lxx6pJ+OPaBUm0Bs5WvftaP5LWZoGDIjbVx8eQtMsYWf88h7/u2bSFW0K9Rno/BLR1a+F+bgcqR5E+Ez9cdoK8gD9Yt90HkB21A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f8mqV7ur; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f8mqV7ur;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkJDx0SSXz2y8F
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 08:26:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2EE81A444C4;
	Wed,  6 Nov 2024 21:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89974C4CEC6;
	Wed,  6 Nov 2024 21:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730928413;
	bh=hiA2YZ1vGHtJnoyVlnCwmx+UZjZfmGxI/JLLYuDClGY=;
	h=From:To:Cc:Subject:Date:From;
	b=f8mqV7urJNd6E2NJ6F1Q//xrKBhNdMS5JBULN/RiaUEgmF7IT70A+l2rOIq6eAuU4
	 0bzESHpWqfeYw/M0ZRm7JYVXrErrhky4NrtrOSh4HhYM1FNG5yn1yegjbYXYAvAPlO
	 kmuv1k1tRhB1TaoxGeA7E+JUUrDxW6w+QB61xZ0GEGPk69t0hVFKj19fr5bz6P/4+q
	 kwZAkyKZXy/H82jsjUlW3QMR0VnhpHtJZx1t/rHh6rMtU7iA32YgClxaYqPlD+nW1m
	 6TScWI1kurcrmtvDcvD5cZC83lmMUKGFUUJdZjgpwWMMDvZe6ANHrKEJThIpJtf3JY
	 DLNU2Xctw5pzg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: cell: Use for_each_of_range() iterator
Date: Wed,  6 Nov 2024 15:26:46 -0600
Message-ID: <20241106212647.341857-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Simplify the cell_iommu_get_fixed_address() dma-ranges parsing to use the
for_each_of_range() iterator.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/powerpc/platforms/cell/iommu.c | 49 ++++++++++-------------------
 1 file changed, 16 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms/cell/iommu.c
index 4cd9c0de22c2..62c9679b8ca3 100644
--- a/arch/powerpc/platforms/cell/iommu.c
+++ b/arch/powerpc/platforms/cell/iommu.c
@@ -779,58 +779,41 @@ static int __init cell_iommu_init_disabled(void)
 
 static u64 cell_iommu_get_fixed_address(struct device *dev)
 {
-	u64 cpu_addr, size, best_size, dev_addr = OF_BAD_ADDR;
+	u64 best_size, dev_addr = OF_BAD_ADDR;
 	struct device_node *np;
-	const u32 *ranges = NULL;
-	int i, len, best, naddr, nsize, pna, range_size;
+	struct of_range_parser parser;
+	struct of_range range;
 
 	/* We can be called for platform devices that have no of_node */
 	np = of_node_get(dev->of_node);
 	if (!np)
 		goto out;
 
-	while (1) {
-		naddr = of_n_addr_cells(np);
-		nsize = of_n_size_cells(np);
-		np = of_get_next_parent(np);
-		if (!np)
-			break;
-
-		ranges = of_get_property(np, "dma-ranges", &len);
+	while ((np = of_get_next_parent(np))) {
+		if (of_pci_dma_range_parser_init(&parser, np))
+			continue;
 
-		/* Ignore empty ranges, they imply no translation required */
-		if (ranges && len > 0)
+		if (of_range_count(&parser))
 			break;
 	}
 
-	if (!ranges) {
+	if (!np) {
 		dev_dbg(dev, "iommu: no dma-ranges found\n");
 		goto out;
 	}
 
-	len /= sizeof(u32);
-
-	pna = of_n_addr_cells(np);
-	range_size = naddr + nsize + pna;
-
-	/* dma-ranges format:
-	 * child addr	: naddr cells
-	 * parent addr	: pna cells
-	 * size		: nsize cells
-	 */
-	for (i = 0, best = -1, best_size = 0; i < len; i += range_size) {
-		cpu_addr = of_translate_dma_address(np, ranges + i + naddr);
-		size = of_read_number(ranges + i + naddr + pna, nsize);
+	best_size = 0;
+	for_each_of_range(&parser, &range) {
+		if (!range.cpu_addr)
+			continue;
 
-		if (cpu_addr == 0 && size > best_size) {
-			best = i;
-			best_size = size;
+		if (range.size > best_size) {
+			best_size = range.size;
+			dev_addr = range.bus_addr;
 		}
 	}
 
-	if (best >= 0) {
-		dev_addr = of_read_number(ranges + best, naddr);
-	} else
+	if (!best_size)
 		dev_dbg(dev, "iommu: no suitable range found!\n");
 
 out:
-- 
2.45.2


