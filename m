Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FDD89D26A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 08:28:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=n3qLjVAj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDGHZ1MQ7z3vcr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 16:28:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=n3qLjVAj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tkos.co.il (client-ip=84.110.109.230; helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=lists.ozlabs.org)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDGDN2x3Sz30fh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 16:25:40 +1000 (AEST)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 3F5CC4402AC;
	Tue,  9 Apr 2024 09:17:43 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1712643463;
	bh=EIw24HYGCi1y+d787B1Nwod7ac/kZ5Ydc0E1Leu5myU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n3qLjVAj+4pF4UYTEPUfy6hDZc7RQUJl12cdtSQ67feuraSJIcxEnkhhz7svNCZev
	 WiFYZlsATBak209c0SBVa1hf/ggF4S1N16dWH1g9juf38FTb5MKzO5N4stpAdIfAna
	 XycYLYvSezvjE/+xRKgPwwodUZL59zZpOmzpRgcA8BeKfxbYcgVXPCzwMXLGQnMVtk
	 DlpOc9jsgwHZKnFO4YYjqd/gi7etpfY1VBFuqgqhNIsBfzzBbuDvzQy9zRlq1zfL6E
	 VmsQN9vAyrAP78oOAToGaJR2hb+bhccZVs3Bzit89jiGKrOwxaHmKOAsR2I+1vBZUA
	 1zf1LjaNsJl3Q==
From: Baruch Siach <baruch@tkos.co.il>
To: Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH RFC v2 2/5] of: get dma area lower limit
Date: Tue,  9 Apr 2024 09:17:55 +0300
Message-ID: <230ea13ef8e9f576df849e1b03406184ca890ba8.1712642324.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712642324.git.baruch@tkos.co.il>
References: <cover.1712642324.git.baruch@tkos.co.il>
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
Cc: devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Ramon Fried <ramon@neureality.ai>, linux-s390@vger.kernel.org, =?UTF-8?q?Petr=20Tesa=C5=99=C3=ADk?= <petr@tesarici.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_dma_get_max_cpu_address() returns the highest CPU address that
devices can use for DMA. The implicit assumption is that all CPU
addresses below that limit are suitable for DMA. However the
'dma-ranges' property this code uses also encodes a lower limit for DMA
that is potentially non zero.

Rename to of_dma_get_cpu_limits(), and extend to retrieve also the lower
limit for the same 'dma-ranges' property describing the high limit.

Update callers of of_dma_get_max_cpu_address(). No functional change
intended.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 arch/arm64/mm/init.c  |  2 +-
 drivers/of/address.c  | 38 +++++++++++++++++++++++++++-----------
 drivers/of/unittest.c |  8 ++++----
 include/linux/of.h    | 11 ++++++++---
 4 files changed, 40 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 00508c69ca9e..77e942ca578b 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -128,7 +128,7 @@ static void __init zone_sizes_init(void)
 
 #ifdef CONFIG_ZONE_DMA
 	acpi_zone_dma_limit = acpi_iort_dma_get_max_cpu_address();
-	dt_zone_dma_limit = of_dma_get_max_cpu_address(NULL);
+	of_dma_get_cpu_limits(NULL, &dt_zone_dma_limit, NULL);
 	zone_dma_limit = min(dt_zone_dma_limit, acpi_zone_dma_limit);
 	arm64_dma_phys_limit = max_zone_phys(zone_dma_limit);
 	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
diff --git a/drivers/of/address.c b/drivers/of/address.c
index ae46a3605904..ac009b3bb63b 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -964,21 +964,25 @@ int of_dma_get_range(struct device_node *np, const struct bus_dma_region **map)
 #endif /* CONFIG_HAS_DMA */
 
 /**
- * of_dma_get_max_cpu_address - Gets highest CPU address suitable for DMA
+ * of_dma_get_cpu_limits - Gets highest CPU address suitable for DMA
  * @np: The node to start searching from or NULL to start from the root
+ * @max: Pointer to high address limit or NULL if not needed
+ * @min: Pointer to low address limit or NULL if not needed
  *
  * Gets the highest CPU physical address that is addressable by all DMA masters
- * in the sub-tree pointed by np, or the whole tree if NULL is passed. If no
- * DMA constrained device is found, it returns PHYS_ADDR_MAX.
+ * in the sub-tree pointed by np, or the whole tree if @np in NULL. If no
+ * DMA constrained device is found, @*max is PHYS_ADDR_MAX, and @*low is 0.
  */
-phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
+void __init of_dma_get_cpu_limits(struct device_node *np,
+		phys_addr_t *max, phys_addr_t *min)
 {
 	phys_addr_t max_cpu_addr = PHYS_ADDR_MAX;
 	struct of_range_parser parser;
-	phys_addr_t subtree_max_addr;
+	phys_addr_t min_cpu_addr = 0;
 	struct device_node *child;
 	struct of_range range;
 	const __be32 *ranges;
+	u64 cpu_start = 0;
 	u64 cpu_end = 0;
 	int len;
 
@@ -988,21 +992,33 @@ phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
 	ranges = of_get_property(np, "dma-ranges", &len);
 	if (ranges && len) {
 		of_dma_range_parser_init(&parser, np);
-		for_each_of_range(&parser, &range)
-			if (range.cpu_addr + range.size > cpu_end)
+		for_each_of_range(&parser, &range) {
+			if (range.cpu_addr + range.size > cpu_end) {
 				cpu_end = range.cpu_addr + range.size - 1;
+				cpu_start = range.cpu_addr;
+			}
+		}
 
-		if (max_cpu_addr > cpu_end)
+		if (max_cpu_addr > cpu_end) {
 			max_cpu_addr = cpu_end;
+			min_cpu_addr = cpu_start;
+		}
 	}
 
 	for_each_available_child_of_node(np, child) {
-		subtree_max_addr = of_dma_get_max_cpu_address(child);
-		if (max_cpu_addr > subtree_max_addr)
+		phys_addr_t subtree_max_addr, subtree_min_addr;
+
+		of_dma_get_cpu_limits(child, &subtree_max_addr, &subtree_min_addr);
+		if (max_cpu_addr > subtree_max_addr) {
 			max_cpu_addr = subtree_max_addr;
+			min_cpu_addr = subtree_min_addr;
+		}
 	}
 
-	return max_cpu_addr;
+	if (max)
+		*max = max_cpu_addr;
+	if (min)
+		*min = min_cpu_addr;
 }
 
 /**
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 6b5c36b6a758..2d632d4ec5b1 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -921,7 +921,7 @@ static void __init of_unittest_changeset(void)
 #endif
 }
 
-static void __init of_unittest_dma_get_max_cpu_address(void)
+static void __init of_unittest_dma_get_cpu_limits(void)
 {
 	struct device_node *np;
 	phys_addr_t cpu_addr;
@@ -935,9 +935,9 @@ static void __init of_unittest_dma_get_max_cpu_address(void)
 		return;
 	}
 
-	cpu_addr = of_dma_get_max_cpu_address(np);
+	of_dma_get_cpu_limits(np, &cpu_addr, NULL);
 	unittest(cpu_addr == 0x4fffffff,
-		 "of_dma_get_max_cpu_address: wrong CPU addr %pad (expecting %x)\n",
+		 "of_dma_get_cpu_limits: wrong CPU addr %pad (expecting %x)\n",
 		 &cpu_addr, 0x4fffffff);
 }
 
@@ -4109,7 +4109,7 @@ static int __init of_unittest(void)
 	of_unittest_changeset();
 	of_unittest_parse_interrupts();
 	of_unittest_parse_interrupts_extended();
-	of_unittest_dma_get_max_cpu_address();
+	of_unittest_dma_get_cpu_limits();
 	of_unittest_parse_dma_ranges();
 	of_unittest_pci_dma_ranges();
 	of_unittest_bus_ranges();
diff --git a/include/linux/of.h b/include/linux/of.h
index a0bedd038a05..7756441d3ce0 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -454,7 +454,8 @@ int of_map_id(struct device_node *np, u32 id,
 	       const char *map_name, const char *map_mask_name,
 	       struct device_node **target, u32 *id_out);
 
-phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
+void of_dma_get_cpu_limits(struct device_node *np, phys_addr_t *max,
+		phys_addr_t *min);
 
 struct kimage;
 void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
@@ -880,9 +881,13 @@ static inline int of_map_id(struct device_node *np, u32 id,
 	return -EINVAL;
 }
 
-static inline phys_addr_t of_dma_get_max_cpu_address(struct device_node *np)
+static inline void of_dma_get_cpu_limits(struct device_node *np,
+		phys_addr_t *max, phys_addr_t *min)
 {
-	return PHYS_ADDR_MAX;
+	if (max)
+		*max = PHYS_ADDR_MAX;
+	if (min)
+		*min = 0;
 }
 
 static inline const void *of_device_get_match_data(const struct device *dev)
-- 
2.43.0

