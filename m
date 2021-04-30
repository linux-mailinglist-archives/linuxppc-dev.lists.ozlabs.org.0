Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2F536FEB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:37:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWygv2TVkz3dHb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 02:36:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Jb4IF5UO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Jb4IF5UO; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWyZz2bjGz30L2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 02:32:43 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id 8so37532835qkv.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 09:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mslRUMHyFzqRAlVHn1Ic+WpNixqipQb8HqjL7dCHBlQ=;
 b=Jb4IF5UOXhOGcvZxYOOtiO1v6B28c9lmoZ0Pn3Dhjw3ZFN7+K/sgbRcPgwYLzgZTpb
 GwYMcUYl6XXLOdIK3V0Qf6yfKbOEPcSUQQpxTVg5J/ruIUvfnuahT12RJRmwvjq45IfY
 icDIuSjDZ5DoodI/BvfZUE6Ta91HQjGmJ4ozI+qDN0vetnN/R9GXxeTeULLINOKtRSvG
 dA+n1G4fYnq7H+/wFZDgYb7dTA7/grdokN4uJPb1IcwjJoE0JtRpib3mHZTb9R23xbrF
 2Rqbav7Hb3WieII5HpwWdqbV1j9QnubOxSVO48CM69URZmHmigRw0jjN6wYLzY+WZmtl
 fnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mslRUMHyFzqRAlVHn1Ic+WpNixqipQb8HqjL7dCHBlQ=;
 b=bxibUaLcP/L9glh5mBA5KzSoDqmnimAeg8MWM9E3mJ8h43Hz78VmM3dfKe87g2tyd4
 t7fAiJGd6+wQSBGed/abGgy1wB664A42k8d2OmkwIVSOx/4Tj/H9jOyjRM31AinJHE4C
 yuPPUel8hf8Z4ioYTpqxKL26X3TS9CBOHBHbbM8/IGCn80xhmQ6ofk3BNBhXRHwUqZ2/
 P2c5yuhVmPKGTtxH+jQKIKzoz/1mdR9hxDOLLQGX0X0hEagYQizAWe7/ksa0oW3Jwtze
 /B90XdB4BwG5+OYRp93noKMFNVeqBcRhkt2q1Z1DZ4yGdCIg2sfD1zFvyzftXEx0dx/A
 9ChQ==
X-Gm-Message-State: AOAM5318NsVEHFZq3GYCSftJV+3YmIpr1e7bDz0CygmXCT0ObOVamOY3
 TChcDbIqObNX94sxAiXHgvQ=
X-Google-Smtp-Source: ABdhPJwMkzOOXnrikVIkt1Y1RW5CWDrnWyvTY+XYsuyx5qnV2iCbZilamvM0quYf+I3gHeM83cU/cA==
X-Received: by 2002:a37:ae02:: with SMTP id x2mr6113223qke.335.1619800360775; 
 Fri, 30 Apr 2021 09:32:40 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 ([2804:14c:482:7b04::1001])
 by smtp.gmail.com with ESMTPSA id p1sm2624334qtu.89.2021.04.30.09.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 09:32:40 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v4 10/11] powerpc/pseries/iommu: Make use of DDW for indirect
 mapping
Date: Fri, 30 Apr 2021 13:31:45 -0300
Message-Id: <20210430163145.146984-11-leobras.c@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210430163145.146984-1-leobras.c@gmail.com>
References: <20210430163145.146984-1-leobras.c@gmail.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

So far it's assumed possible to map the guest RAM 1:1 to the bus, which
works with a small number of devices. SRIOV changes it as the user can
configure hundreds VFs and since phyp preallocates TCEs and does not
allow IOMMU pages bigger than 64K, it has to limit the number of TCEs
per a PE to limit waste of physical pages.

As of today, if the assumed direct mapping is not possible, DDW creation
is skipped and the default DMA window "ibm,dma-window" is used instead.

By using DDW, indirect mapping  can get more TCEs than available for the
default DMA window, and also get access to using much larger pagesizes
(16MB as implemented in qemu vs 4k from default DMA window), causing a
significant increase on the maximum amount of memory that can be IOMMU
mapped at the same time.

Indirect mapping will only be used if direct mapping is not a
possibility.

For indirect mapping, it's necessary to re-create the iommu_table with
the new DMA window parameters, so iommu_alloc() can use it.

Removing the default DMA window for using DDW with indirect mapping
is only allowed if there is no current IOMMU memory allocated in
the iommu_table. enable_ddw() is aborted otherwise.

Even though there won't be both direct and indirect mappings at the
same time, we can't reuse the DIRECT64_PROPNAME property name, or else
an older kexec()ed kernel can assume direct mapping, and skip
iommu_alloc(), causing undesirable behavior.
So a new property name DMA64_PROPNAME "linux,dma64-ddr-window-info"
was created to represent a DDW that does not allow direct mapping.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 87 +++++++++++++++++++++-----
 1 file changed, 72 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index de54ddd9decd..572879af0211 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -53,6 +53,7 @@ enum {
 	DDW_EXT_QUERY_OUT_SIZE = 2
 };
 
+static phys_addr_t ddw_memory_hotplug_max(void);
 #ifdef CONFIG_IOMMU_API
 static int tce_exchange_pseries(struct iommu_table *tbl, long index, unsigned long *tce,
 				enum dma_data_direction *direction, bool realmode);
@@ -380,6 +381,7 @@ static DEFINE_SPINLOCK(direct_window_list_lock);
 /* protects initializing window twice for same device */
 static DEFINE_MUTEX(direct_window_init_mutex);
 #define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
+#define DMA64_PROPNAME "linux,dma64-ddr-window-info"
 
 static int tce_clearrange_multi_pSeriesLP(unsigned long start_pfn,
 					unsigned long num_pfn, const void *arg)
@@ -918,6 +920,7 @@ static int find_existing_ddw_windows(void)
 		return 0;
 
 	find_existing_ddw_windows_named(DIRECT64_PROPNAME);
+	find_existing_ddw_windows_named(DMA64_PROPNAME);
 
 	return 0;
 }
@@ -1207,10 +1210,13 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	struct device_node *dn;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
 	struct direct_window *window;
+	const char *win_name;
 	struct property *win64 = NULL;
 	struct failed_ddw_pdn *fpdn;
-	bool default_win_removed = false;
+	bool default_win_removed = false, direct_mapping = false;
 	bool pmem_present;
+	struct pci_dn *pci = PCI_DN(pdn);
+	struct iommu_table *tbl = pci->table_group->tables[0];
 
 	dn = of_find_node_by_type(NULL, "ibm,pmemory");
 	pmem_present = dn != NULL;
@@ -1218,8 +1224,12 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 	mutex_lock(&direct_window_init_mutex);
 
-	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &len))
-		goto out_unlock;
+	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &len)) {
+		direct_mapping = (len >= max_ram_len);
+
+		mutex_unlock(&direct_window_init_mutex);
+		return direct_mapping;
+	}
 
 	/*
 	 * If we already went through this for a previous function of
@@ -1298,7 +1308,6 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		goto out_failed;
 	}
 	/* verify the window * number of ptes will map the partition */
-	/* check largest block * page size > max memory hotplug addr */
 	/*
 	 * The "ibm,pmemory" can appear anywhere in the address space.
 	 * Assuming it is still backed by page structs, try MAX_PHYSMEM_BITS
@@ -1320,6 +1329,17 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 			1ULL << len,
 			query.largest_available_block,
 			1ULL << page_shift);
+
+		len = order_base_2(query.largest_available_block << page_shift);
+		win_name = DMA64_PROPNAME;
+	} else {
+		direct_mapping = true;
+		win_name = DIRECT64_PROPNAME;
+	}
+
+	/* DDW + IOMMU on single window may fail if there is any allocation */
+	if (default_win_removed && !direct_mapping && iommu_table_in_use(tbl)) {
+		dev_dbg(&dev->dev, "current IOMMU table in use, can't be replaced.\n");
 		goto out_failed;
 	}
 
@@ -1331,8 +1351,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		  create.liobn, dn);
 
 	win_addr = ((u64)create.addr_hi << 32) | create.addr_lo;
-	win64 = ddw_property_create(DIRECT64_PROPNAME, create.liobn, win_addr,
-				    page_shift, len);
+	win64 = ddw_property_create(win_name, create.liobn, win_addr, page_shift, len);
 	if (!win64) {
 		dev_info(&dev->dev,
 			 "couldn't allocate property, property name, or value\n");
@@ -1350,12 +1369,47 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	if (!window)
 		goto out_del_prop;
 
-	ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
-			win64->value, tce_setrange_multi_pSeriesLP_walk);
-	if (ret) {
-		dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
-			 dn, ret);
-		goto out_del_list;
+	if (direct_mapping) {
+		/* DDW maps the whole partition, so enable direct DMA mapping */
+		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
+					    win64->value, tce_setrange_multi_pSeriesLP_walk);
+		if (ret) {
+			dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
+				 dn, ret);
+			goto out_del_list;
+		}
+	} else {
+		struct iommu_table *newtbl;
+		int i;
+
+		/* New table for using DDW instead of the default DMA window */
+		newtbl = iommu_pseries_alloc_table(pci->phb->node);
+		if (!newtbl) {
+			dev_dbg(&dev->dev, "couldn't create new IOMMU table\n");
+			goto out_del_list;
+		}
+
+		for (i = 0; i < ARRAY_SIZE(pci->phb->mem_resources); i++) {
+			const unsigned long mask = IORESOURCE_MEM_64 | IORESOURCE_MEM;
+
+			/* Look for MMIO32 */
+			if ((pci->phb->mem_resources[i].flags & mask) == IORESOURCE_MEM)
+				break;
+		}
+
+		_iommu_table_setparms(newtbl, pci->phb->bus->number, create.liobn, win_addr,
+				      1UL << len, page_shift, 0, &iommu_table_lpar_multi_ops);
+		iommu_init_table(newtbl, pci->phb->node, pci->phb->mem_resources[i].start,
+				 pci->phb->mem_resources[i].end);
+
+		if (default_win_removed)
+			iommu_tce_table_put(tbl);
+		else
+			pci->table_group->tables[1] = tbl;
+
+		pci->table_group->tables[0] = newtbl;
+
+		set_iommu_table_base(&dev->dev, newtbl);
 	}
 
 	spin_lock(&direct_window_list_lock);
@@ -1398,10 +1452,10 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	 * as RAM, then we failed to create a window to cover persistent
 	 * memory and need to set the DMA limit.
 	 */
-	if (pmem_present && win64 && (len == max_ram_len))
+	if (pmem_present && direct_mapping && len == max_ram_len)
 		dev->dev.bus_dma_limit = dev->dev.archdata.dma_offset + (1ULL << len);
 
-	return win64;
+	return win64 && direct_mapping;
 }
 
 static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
@@ -1542,7 +1596,10 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
 		 * we have to remove the property when releasing
 		 * the device node.
 		 */
-		remove_ddw(np, false, DIRECT64_PROPNAME);
+
+		if (remove_ddw(np, false, DIRECT64_PROPNAME))
+			remove_ddw(np, false, DMA64_PROPNAME);
+
 		if (pci && pci->table_group)
 			iommu_pseries_free_group(pci->table_group,
 					np->full_name);
-- 
2.30.2

