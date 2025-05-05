Return-Path: <linuxppc-dev+bounces-8310-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE580AAA07B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 00:35:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrxDf31tZz2xqG;
	Tue,  6 May 2025 08:35:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746484514;
	cv=none; b=m5bsur+Zrx2mmipkxCi88vG6fq11XMkDtwYSX4WnfZEPoNuKeMG+jKEpXexHxjb/2za0sTXfAFEq1QE/tgo2DJ39YOB82e4/kOUOiDRxWx5SrmgcR411wOEFFEtA5dpc+h/o/Y81BwcjJX1YmU6q1Oa+dBwrlLXztj1HMK1FfESVlMDBJqqKScZ421DK69wgXxV3Ouxvz4xfy2Ae27Aaa0ydSeXoDXY1l2epEysagyqw9WND45P740HBiQQ5byx007Dz90s4dbvAZteL3L1SG1Z1jjzvsgIlPUTm3yIsjDj+DL64yLogFAtyKPCmJfKQyoZI6T1WaqDJfCSpVaTjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746484514; c=relaxed/relaxed;
	bh=V4F6iXD1KLyVG9YDn9i2wQEDn+DKFLsEDFNmAKe/d1U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MifCujJl0qMt8ykCP+oHoLJowkQhre1bGFuJCgX1EJZE8YKoPxa8+k3d7OyAvyZTJaFZ68IlgC4hoVb49gzwmDgaS3dLVu3iUcXgXmqci4JUSbejUIigODra0nQEKQiQaYjp1sOO/49Ad5OdSyYmRg7hz11QbOLPVnyv/QuTtAm7gYTJ+br1kkqfgzTDjjmKGpcITLevE96xhVkp/H2CWMGqD1dU7bo4xtQBRuyOdFTDkwqtqm5bnIasrwPoywMUmD+X92KFLuawySHgmuq7fx0vqQKkRfuEWAAc9dYMwc8Zju5SbFfeURSuTXgFrXRr04BaW6jnvBsdfPgEDyCzNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SXzCRcth; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SXzCRcth;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrxDd2vHKz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 08:35:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B180FA4CC01;
	Mon,  5 May 2025 22:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716F3C4CEED;
	Mon,  5 May 2025 22:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484510;
	bh=OShk5Pk7+EWw5WJPlyaLJpSjwrVtxveqeWxZaYaBs5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SXzCRcth2ib4PdikNnXMTtGxaSHQ0YxpssdS/loHFqUiGFiXh0U3RsFpshfT1+2t1
	 SiVXgGz6tG+djrTMV6TrO5VGSkuoAZE+wOmZaOCUDUiH6O0g+73YSUBUwNjR++YWZ7
	 lB+Nb3I/E/Z/Nw+PnYAvFne6hlVXb69oy449vd/Uj4PoRudxEAdp3OlR0zK7YiSue5
	 j+loke3kJ0Z8XEPFpizwSRC1tPC/Pn7FPCblTH98EnZeXx0HWhWdlHVcq02x9vybSY
	 tKV/Nel+Z/KHxcpRzjxw4p41za316EI26mkYgBBCt47xobA2FnA0pDWTxnNjqgCHAZ
	 E23vwStzTQ13Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Gaurav Batra <gbatra@linux.ibm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Sasha Levin <sashal@kernel.org>,
	mpe@ellerman.id.au,
	dan.j.williams@intel.com,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	Jonathan.Cameron@huawei.com,
	david@redhat.com,
	nilay@linux.ibm.com,
	sbhat@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.14 508/642] powerpc/pseries/iommu: memory notifier incorrectly adds TCEs for pmemory
Date: Mon,  5 May 2025 18:12:04 -0400
Message-Id: <20250505221419.2672473-508-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
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
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Gaurav Batra <gbatra@linux.ibm.com>

[ Upstream commit 6aa989ab2bd0d37540c812b4270006ff794662e7 ]

iommu_mem_notifier() is invoked when RAM is dynamically added/removed. This
notifier call is responsible to add/remove TCEs from the Dynamic DMA Window
(DDW) when TCEs are pre-mapped. TCEs are pre-mapped only for RAM and not
for persistent memory (pmemory). For DMA buffers in pmemory, TCEs are
dynamically mapped when the device driver instructs to do so.

The issue is 'daxctl' command is capable of adding pmemory as "System RAM"
after LPAR boot. The command to do so is -

daxctl reconfigure-device --mode=system-ram dax0.0 --force

This will dynamically add pmemory range to LPAR RAM eventually invoking
iommu_mem_notifier(). The address range of pmemory is way beyond the Max
RAM that the LPAR can have. Which means, this range is beyond the DDW
created for the device, at device initialization time.

As a result when TCEs are pre-mapped for the pmemory range, by
iommu_mem_notifier(), PHYP HCALL returns H_PARAMETER. This failed the
command, daxctl, to add pmemory as RAM.

The solution is to not pre-map TCEs for pmemory.

Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
Tested-by: Donet Tom <donettom@linux.ibm.com>
Reviewed-by: Donet Tom <donettom@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Link: https://patch.msgid.link/20250130183854.92258-1-gbatra@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/mmzone.h      |  1 +
 arch/powerpc/mm/numa.c                 |  2 +-
 arch/powerpc/platforms/pseries/iommu.c | 29 ++++++++++++++------------
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/mmzone.h b/arch/powerpc/include/asm/mmzone.h
index d99863cd6cde4..049152f8d597a 100644
--- a/arch/powerpc/include/asm/mmzone.h
+++ b/arch/powerpc/include/asm/mmzone.h
@@ -29,6 +29,7 @@ extern cpumask_var_t node_to_cpumask_map[];
 #ifdef CONFIG_MEMORY_HOTPLUG
 extern unsigned long max_pfn;
 u64 memory_hotplug_max(void);
+u64 hot_add_drconf_memory_max(void);
 #else
 #define memory_hotplug_max() memblock_end_of_DRAM()
 #endif
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 3c1da08304d03..603a0f652ba61 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1336,7 +1336,7 @@ int hot_add_scn_to_nid(unsigned long scn_addr)
 	return nid;
 }
 
-static u64 hot_add_drconf_memory_max(void)
+u64 hot_add_drconf_memory_max(void)
 {
 	struct device_node *memory = NULL;
 	struct device_node *dn = NULL;
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index ae6f7a235d8b2..8f32340960e21 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1284,17 +1284,13 @@ static LIST_HEAD(failed_ddw_pdn_list);
 
 static phys_addr_t ddw_memory_hotplug_max(void)
 {
-	resource_size_t max_addr = memory_hotplug_max();
-	struct device_node *memory;
+	resource_size_t max_addr;
 
-	for_each_node_by_type(memory, "memory") {
-		struct resource res;
-
-		if (of_address_to_resource(memory, 0, &res))
-			continue;
-
-		max_addr = max_t(resource_size_t, max_addr, res.end + 1);
-	}
+#if defined(CONFIG_NUMA) && defined(CONFIG_MEMORY_HOTPLUG)
+	max_addr = hot_add_drconf_memory_max();
+#else
+	max_addr = memblock_end_of_DRAM();
+#endif
 
 	return max_addr;
 }
@@ -1600,7 +1596,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 	if (direct_mapping) {
 		/* DDW maps the whole partition, so enable direct DMA mapping */
-		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
+		ret = walk_system_ram_range(0, ddw_memory_hotplug_max() >> PAGE_SHIFT,
 					    win64->value, tce_setrange_multi_pSeriesLP_walk);
 		if (ret) {
 			dev_info(&dev->dev, "failed to map DMA window for %pOF: %d\n",
@@ -2349,11 +2345,17 @@ static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
 	struct memory_notify *arg = data;
 	int ret = 0;
 
+	/* This notifier can get called when onlining persistent memory as well.
+	 * TCEs are not pre-mapped for persistent memory. Persistent memory will
+	 * always be above ddw_memory_hotplug_max()
+	 */
+
 	switch (action) {
 	case MEM_GOING_ONLINE:
 		spin_lock(&dma_win_list_lock);
 		list_for_each_entry(window, &dma_win_list, list) {
-			if (window->direct) {
+			if (window->direct && (arg->start_pfn << PAGE_SHIFT) <
+				ddw_memory_hotplug_max()) {
 				ret |= tce_setrange_multi_pSeriesLP(arg->start_pfn,
 						arg->nr_pages, window->prop);
 			}
@@ -2365,7 +2367,8 @@ static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
 	case MEM_OFFLINE:
 		spin_lock(&dma_win_list_lock);
 		list_for_each_entry(window, &dma_win_list, list) {
-			if (window->direct) {
+			if (window->direct && (arg->start_pfn << PAGE_SHIFT) <
+				ddw_memory_hotplug_max()) {
 				ret |= tce_clearrange_multi_pSeriesLP(arg->start_pfn,
 						arg->nr_pages, window->prop);
 			}
-- 
2.39.5


