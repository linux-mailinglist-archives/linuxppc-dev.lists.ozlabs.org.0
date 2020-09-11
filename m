Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 382592667A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 19:46:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp38l3pz9zDrQx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 03:46:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hsPNRk+t; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp2Pq5j7WzDqsm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 03:12:47 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id g3so8414148qtq.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 10:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ezuxg80dlVNhIUHzUHza62mBHHT8VoSaDPU6ZMQrrWU=;
 b=hsPNRk+tG9un0dnzsTl6Ju0JhE5bs0lgWDsTUH7VKkgISfbj+apwNm0ks7lFF3BvN7
 NMzx3XYwP+YtmPX472xNtiLq7z4FXpdQ0EfaUIj45JUFtbvykeyM5IvmgCmX7wI9bUiM
 jndEQgrQ2JBotx/M30ubMqDjHwNYlqnmP1kbRWhkwhKBhdcyGiA8+fcNglsaexSSH3Mf
 piHlRG/tonGCpsAgar347LwNUzVXNDR7SVB5Qih+eJJao/5TNKDK7rba1/SWmqpCFroR
 TBIhv268B5KOmgiezOhAZ1pRq675yXXqCJ2Hu4+9qn6qnaCMOaxh+nPb0nexkw/V5klf
 Wlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ezuxg80dlVNhIUHzUHza62mBHHT8VoSaDPU6ZMQrrWU=;
 b=EK3uz5vNJdyjHMAjfgVlaF3zl4JJMdBotfmiQ7kTPlPx6hs5rLXLJ9FqPLWizT5cVl
 vWE2WiYfXukBBKRRL5/l8WEYzxnlcDgJ3HgoYFsCKs0tLC6aMyNKvT4GiRseO96BuL+h
 YdtR/aj9N3GEakkOKZ2BFaPxXSmjG9xxIBSFzRs6uidxw8zjYpv2CecUTAx07Nm0qy8o
 oetTIJ3TPPeYaZ5LL7krW03bJBTyqh96FRi+/Gn026rC2IwGmMASZpxnGf/DIrU1Tk7M
 IajQvgGaNGYy+YBYyEt7Z4FOwsuEe2axZbanuIM2hG0M31y3V18e1tRTShbzz7wtN1R6
 mxlQ==
X-Gm-Message-State: AOAM533Nqt7Qbvf6/+pXSvmcsKSLo3p5QJhCSZglQUHmm1TCvPeLdXMO
 WtOsDXdufAY78civjyG/Jdo=
X-Google-Smtp-Source: ABdhPJzVPf5ztzp2DRgArjw1j7LrlB263mGdZV3SWoThQiJ9PQbm6glLPw636+TCpS84hGLHzYfWhA==
X-Received: by 2002:ac8:6e90:: with SMTP id c16mr2756691qtv.391.1599844365715; 
 Fri, 11 Sep 2020 10:12:45 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-254-96.dynamic.desktop.com.br.
 [179.125.254.96])
 by smtp.gmail.com with ESMTPSA id l5sm3533330qtc.28.2020.09.11.10.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 10:12:45 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Subject: [PATCH v2 13/14] powerpc/pseries/iommu: Make use of DDW for indirect
 mapping
Date: Fri, 11 Sep 2020 14:07:38 -0300
Message-Id: <20200911170738.82818-14-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200911170738.82818-1-leobras.c@gmail.com>
References: <20200911170738.82818-1-leobras.c@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 

So far it's assumed possible to map the guest RAM 1:1 to the bus, which
works with a small number of devices. SRIOV changes it as the user can
configure hundreds VFs and since phyp preallocates TCEs and does not
allow IOMMU pages bigger than 64K, it has to limit the number of TCEs
per a PE to limit waste of physical pages.

As of today, if the assumed direct mapping is not possible, DDW creation
is skipped and the default DMA window "ibm,dma-window" is used instead.

The default DMA window uses 4k pages instead of 64k pages, and since
the amount of pages (TCEs) may stay the same (on pHyp case), making
use of DDW instead of the default DMA window for indirect mapping will
expand in up to 16x the amount of memory that can be mapped on DMA.

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

Note: ddw_memory_hotplug_max() was moved up so it can be used in
find_existing_ddw().

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 160 ++++++++++++++++---------
 1 file changed, 103 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 9b7c03652e72..c4de23080d1b 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -375,6 +375,7 @@ static DEFINE_SPINLOCK(direct_window_list_lock);
 /* protects initializing window twice for same device */
 static DEFINE_MUTEX(direct_window_init_mutex);
 #define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
+#define DMA64_PROPNAME "linux,dma64-ddr-window-info"
 
 static int tce_clearrange_multi_pSeriesLP(unsigned long start_pfn,
 					unsigned long num_pfn, const void *arg)
@@ -846,10 +847,48 @@ static int remove_ddw(struct device_node *np, bool remove_prop, const char *win_
 	return 0;
 }
 
-static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
+static phys_addr_t ddw_memory_hotplug_max(void)
+{
+	phys_addr_t max_addr = memory_hotplug_max();
+	struct device_node *memory;
+
+	/*
+	 * The "ibm,pmemory" can appear anywhere in the address space.
+	 * Assuming it is still backed by page structs, set the upper limit
+	 * for the huge DMA window as MAX_PHYSMEM_BITS.
+	 */
+	if (of_find_node_by_type(NULL, "ibm,pmemory"))
+		return (sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
+			(phys_addr_t)-1 : (1ULL << MAX_PHYSMEM_BITS);
+
+	for_each_node_by_type(memory, "memory") {
+		unsigned long start, size;
+		int n_mem_addr_cells, n_mem_size_cells, len;
+		const __be32 *memcell_buf;
+
+		memcell_buf = of_get_property(memory, "reg", &len);
+		if (!memcell_buf || len <= 0)
+			continue;
+
+		n_mem_addr_cells = of_n_addr_cells(memory);
+		n_mem_size_cells = of_n_size_cells(memory);
+
+		start = of_read_number(memcell_buf, n_mem_addr_cells);
+		memcell_buf += n_mem_addr_cells;
+		size = of_read_number(memcell_buf, n_mem_size_cells);
+		memcell_buf += n_mem_size_cells;
+
+		max_addr = max_t(phys_addr_t, max_addr, start + size);
+	}
+
+	return max_addr;
+}
+
+static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, bool *direct_mapping)
 {
 	struct direct_window *window;
 	const struct dynamic_dma_window_prop *direct64;
+	unsigned long window_size;
 	bool found = false;
 
 	spin_lock(&direct_window_list_lock);
@@ -858,6 +897,10 @@ static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
 		if (window->device == pdn) {
 			direct64 = window->prop;
 			*dma_addr = be64_to_cpu(direct64->dma_base);
+
+			window_size = (1UL << be32_to_cpu(direct64->window_shift));
+			*direct_mapping = (window_size >= ddw_memory_hotplug_max());
+
 			found = true;
 			break;
 		}
@@ -912,6 +955,7 @@ static int find_existing_ddw_windows(void)
 		return 0;
 
 	find_existing_ddw_windows_named(DIRECT64_PROPNAME);
+	find_existing_ddw_windows_named(DMA64_PROPNAME);
 
 	return 0;
 }
@@ -1054,43 +1098,6 @@ struct failed_ddw_pdn {
 
 static LIST_HEAD(failed_ddw_pdn_list);
 
-static phys_addr_t ddw_memory_hotplug_max(void)
-{
-	phys_addr_t max_addr = memory_hotplug_max();
-	struct device_node *memory;
-
-	/*
-	 * The "ibm,pmemory" can appear anywhere in the address space.
-	 * Assuming it is still backed by page structs, set the upper limit
-	 * for the huge DMA window as MAX_PHYSMEM_BITS.
-	 */
-	if (of_find_node_by_type(NULL, "ibm,pmemory"))
-		return (sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
-			(phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS);
-
-	for_each_node_by_type(memory, "memory") {
-		unsigned long start, size;
-		int n_mem_addr_cells, n_mem_size_cells, len;
-		const __be32 *memcell_buf;
-
-		memcell_buf = of_get_property(memory, "reg", &len);
-		if (!memcell_buf || len <= 0)
-			continue;
-
-		n_mem_addr_cells = of_n_addr_cells(memory);
-		n_mem_size_cells = of_n_size_cells(memory);
-
-		start = of_read_number(memcell_buf, n_mem_addr_cells);
-		memcell_buf += n_mem_addr_cells;
-		size = of_read_number(memcell_buf, n_mem_size_cells);
-		memcell_buf += n_mem_size_cells;
-
-		max_addr = max_t(phys_addr_t, max_addr, start + size);
-	}
-
-	return max_addr;
-}
-
 /*
  * Platforms supporting the DDW option starting with LoPAR level 2.7 implement
  * ibm,ddw-extensions, which carries the rtas token for
@@ -1173,14 +1180,19 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	struct device_node *dn;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
 	struct direct_window *window;
+	const char *win_name;
 	struct property *win64 = NULL;
 	struct failed_ddw_pdn *fpdn;
-	bool default_win_removed = false;
+	bool default_win_removed = false, direct_mapping = false;
+	struct pci_dn *pci = PCI_DN(pdn);
+	struct iommu_table *tbl = pci->table_group->tables[0];
 
 	mutex_lock(&direct_window_init_mutex);
 
-	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset))
-		goto out_unlock;
+	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &direct_mapping)) {
+		mutex_unlock(&direct_window_init_mutex);
+		return direct_mapping;
+	}
 
 	/*
 	 * If we already went through this for a previous function of
@@ -1266,15 +1278,25 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	}
 
 	/* verify the window * number of ptes will map the partition */
-	/* check largest block * page size > max memory hotplug addr */
 	max_addr = ddw_memory_hotplug_max();
 	if (query.largest_available_block < (max_addr >> page_shift)) {
-		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu "
-			  "%llu-sized pages\n", max_addr,  query.largest_available_block,
-			  1ULL << page_shift);
+		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu %llu-sized pages\n",
+			max_addr, query.largest_available_block,
+			1ULL << page_shift);
+
+		len = order_base_2(query.largest_available_block << page_shift);
+		win_name = DMA64_PROPNAME;
+	} else {
+		direct_mapping = true;
+		len = order_base_2(max_addr);
+		win_name = DIRECT64_PROPNAME;
+	}
+
+	/* DDW + IOMMU on single window may fail if there is any allocation */
+	if (default_win_removed && !direct_mapping && iommu_table_in_use(tbl)) {
+		dev_dbg(&dev->dev, "current IOMMU table in use, can't be replaced.\n");
 		goto out_failed;
 	}
-	len = order_base_2(max_addr);
 
 	ret = create_ddw(dev, ddw_avail, &create, page_shift, len);
 	if (ret != 0)
@@ -1284,8 +1306,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		create.liobn, dn);
 
 	win_addr = ((u64)create.addr_hi << 32) | create.addr_lo;
-	win64 = ddw_property_create(DIRECT64_PROPNAME, create.liobn, win_addr,
-				    page_shift, len);
+	win64 = ddw_property_create(win_name, create.liobn, win_addr, page_shift, len);
 	if (!win64) {
 		dev_info(&dev->dev,
 			 "couldn't allocate property, property name, or value\n");
@@ -1300,15 +1321,37 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	}
 
 	window = ddw_list_new_entry(pdn, win64->value);
-	if (!window)
+	if (!window) {
+		dev_dbg(&dev->dev, "couldn't create new list entry\n");
 		goto out_prop_del;
+	}
 
-	ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
-			win64->value, tce_setrange_multi_pSeriesLP_walk);
-	if (ret) {
-		dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
-			 dn, ret);
-		goto out_list_del;
+	if (direct_mapping) {
+		/* DDW maps the whole partition, so enable direct DMA mapping */
+		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
+					    win64->value, tce_setrange_multi_pSeriesLP_walk);
+		if (ret) {
+			dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
+				 dn, ret);
+			goto out_list_del;
+		}
+	} else {
+		/* New table for using DDW instead of the default DMA window */
+		tbl = iommu_pseries_alloc_table(pci->phb->node);
+		if (!tbl) {
+			dev_dbg(&dev->dev, "couldn't create new IOMMU table\n");
+			goto out_list_del;
+		}
+
+		_iommu_table_setparms(tbl, pci->phb->bus->number, create.liobn, win_addr,
+				      1UL << len, page_shift, 0, &iommu_table_lpar_multi_ops);
+		iommu_init_table(tbl, pci->phb->node, 0, 0);
+
+		/* Free old table and replace by the newer */
+		iommu_tce_table_put(pci->table_group->tables[0]);
+		pci->table_group->tables[0] = tbl;
+
+		set_iommu_table_base(&dev->dev, tbl);
 	}
 
 	spin_lock(&direct_window_list_lock);
@@ -1345,7 +1388,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 out_unlock:
 	mutex_unlock(&direct_window_init_mutex);
-	return win64;
+	return win64 && direct_mapping;
 }
 
 static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
@@ -1486,7 +1529,10 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
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
2.25.4

