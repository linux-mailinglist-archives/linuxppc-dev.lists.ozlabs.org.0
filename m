Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A430B247B61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 02:07:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVrnm6VvtzDqZl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 10:07:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Xh5dDas6; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVrD33gJ9zDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 09:41:39 +1000 (AEST)
Received: by mail-qv1-xf44.google.com with SMTP id y11so8694711qvl.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 16:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OjLZL6pXZJKfrMzeTCsr7M9TbDtf9BfsdFN8OvCLknA=;
 b=Xh5dDas6HZxGQxGox2dCRTXKrAX8blW/qQWCM4iBSRk8aaOIzpklKLaLJ75aHZygHD
 1CBwzY9eeG+AlnvcQoyqS2GTd8zKZ87lk217NK+z91GIWy33Xa+y6qG7nfSKi76kWIwT
 0frvSagCEw/ZJKYUhnEAt5hPqP3pcTStEfD1fMDQyyI9AFC1PpnNwGyHfJqhEaw5EGqW
 NP3AhBKs2ZwbWdFA44JJklCs6mHkb6CjV2NMfMPbX45ldMDjUg7CbCt4qf17UZv4yoMx
 XZ+7u51X6xR3CmVnhT7DJeImwFsFCFPFRSAAIVBYg+G2SC2WAT5IqbuTOKxfvSLfi/nR
 WgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OjLZL6pXZJKfrMzeTCsr7M9TbDtf9BfsdFN8OvCLknA=;
 b=btTcusV1XlVYx+Ji+g56IXQzTRY5QbZOtma4T87xMCZgGDZ3q1OeKLAPlmF5ALTQbD
 MADXKuOFEaBbDuSVY9hw9EfHeYPyPtuMIf0xH6Dbip4Ls/g7aMmQ+aym7Cj7/S43um/7
 cPHlroUQC1BxOBhOMKj7QFOcMlhcuSYtaHVcqPWH7roUJ7mzDAsfC18g4Ji/NhGSSBjc
 ONa9LuL8V2X21or4mkvi8ReRFbqrGBQEGUPGuYmmjjQEwpIYhCtQEJ2v9Mf9quCZ/fad
 TX9sNUdqBnf16DB5o+zypJnttYnzP2zUr7gLGW0AzM63CiBcO3sQR2DeF+la/Rw2seLt
 Gx9g==
X-Gm-Message-State: AOAM533OaDeu6uMsv9b5fBJAA4g+xi7JbKfKrmFa5uqg74POWarK80Ft
 Mb+ejhZLE9zuclGq4QtRyeU=
X-Google-Smtp-Source: ABdhPJytAfpXnKST6bwLu+l9iB2yfT8W20lkOrNEA3HkSxqjWod0TU894IbFyeg0RmopK/4UCeTcQw==
X-Received: by 2002:ad4:4c0a:: with SMTP id bz10mr15988352qvb.78.1597707696320; 
 Mon, 17 Aug 2020 16:41:36 -0700 (PDT)
Received: from LeoBras.ibmuc.com ([177.35.193.93])
 by smtp.gmail.com with ESMTPSA id w58sm22342868qth.95.2020.08.17.16.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 16:41:35 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Subject: [PATCH v1 10/10] powerpc/pseries/iommu: Rename "direct window" to
 "dma window"
Date: Mon, 17 Aug 2020 20:40:33 -0300
Message-Id: <20200817234033.442511-11-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200817234033.442511-1-leobras.c@gmail.com>
References: <20200817234033.442511-1-leobras.c@gmail.com>
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

A previous change introduced the usage of DDW as a bigger indirect DMA
mapping when the DDW available size does not map the whole partition.

As most of the code that manipulates direct mappings was reused for
indirect mappings, it's necessary to rename all names and debug/info
messages to reflect that it can be used for both kinds of mapping.

Also, defines DEFAULT_DMA_WIN as "ibm,dma-window" to document that
it's the name of the default DMA window.

Those changes are not supposed to change how the code works in any
way, just adjust naming.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 110 +++++++++++++------------
 1 file changed, 57 insertions(+), 53 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 9544e3c91ced..c1454f9cd254 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -355,7 +355,7 @@ struct dynamic_dma_window_prop {
 
 #define DDW_FLAGS_DIRECT	0x01
 
-struct direct_window {
+struct dma_win {
 	struct device_node *device;
 	const struct dynamic_dma_window_prop *prop;
 	struct list_head list;
@@ -375,12 +375,13 @@ struct ddw_create_response {
 	u32 addr_lo;
 };
 
-static LIST_HEAD(direct_window_list);
+static LIST_HEAD(dma_win_list);
 /* prevents races between memory on/offline and window creation */
-static DEFINE_SPINLOCK(direct_window_list_lock);
+static DEFINE_SPINLOCK(dma_win_list_lock);
 /* protects initializing window twice for same device */
-static DEFINE_MUTEX(direct_window_init_mutex);
+static DEFINE_MUTEX(dma_win_init_mutex);
 #define DMA64_PROPNAME "linux,dma64-ddr-window-info"
+#define DEFAULT_DMA_WIN "ibm,dma-window"
 
 static int tce_clearrange_multi_pSeriesLP(unsigned long start_pfn,
 					unsigned long num_pfn, const void *arg)
@@ -713,15 +714,18 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 	pr_debug("pci_dma_bus_setup_pSeriesLP: setting up bus %pOF\n",
 		 dn);
 
-	/* Find nearest ibm,dma-window, walking up the device tree */
+	/*
+	 * Find nearest ibm,dma-window (default DMA window), walking up the
+	 * device tree
+	 */
 	for (pdn = dn; pdn != NULL; pdn = pdn->parent) {
-		dma_window = of_get_property(pdn, "ibm,dma-window", NULL);
+		dma_window = of_get_property(pdn, DEFAULT_DMA_WIN, NULL);
 		if (dma_window != NULL)
 			break;
 	}
 
 	if (dma_window == NULL) {
-		pr_debug("  no ibm,dma-window property !\n");
+		pr_debug("  no %s property !\n", DEFAULT_DMA_WIN);
 		return;
 	}
 
@@ -819,11 +823,11 @@ static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
 
 	ret = rtas_call(ddw_avail[DDW_REMOVE_PE_DMA_WIN], 1, 1, NULL, liobn);
 	if (ret)
-		pr_warn("%pOF: failed to remove direct window: rtas returned "
+		pr_warn("%pOF: failed to remove dma window: rtas returned "
 			"%d to ibm,remove-pe-dma-window(%x) %llx\n",
 			np, ret, ddw_avail[DDW_REMOVE_PE_DMA_WIN], liobn);
 	else
-		pr_debug("%pOF: successfully removed direct window: rtas returned "
+		pr_debug("%pOF: successfully removed dma window: rtas returned "
 			"%d to ibm,remove-pe-dma-window(%x) %llx\n",
 			np, ret, ddw_avail[DDW_REMOVE_PE_DMA_WIN], liobn);
 }
@@ -851,36 +855,36 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
 
 	ret = of_remove_property(np, win);
 	if (ret)
-		pr_warn("%pOF: failed to remove direct window property: %d\n",
+		pr_warn("%pOF: failed to remove dma window property: %d\n",
 			np, ret);
 }
 
 static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, bool *direct_mapping)
 {
-	struct direct_window *window;
-	const struct dynamic_dma_window_prop *direct64;
+	struct dma_win *window;
+	const struct dynamic_dma_window_prop *dma64;
 	bool found = false;
 
-	spin_lock(&direct_window_list_lock);
+	spin_lock(&dma_win_list_lock);
 	/* check if we already created a window and dupe that config if so */
-	list_for_each_entry(window, &direct_window_list, list) {
+	list_for_each_entry(window, &dma_win_list, list) {
 		if (window->device == pdn) {
-			direct64 = window->prop;
-			*dma_addr = be64_to_cpu(direct64->dma_base);
-			*direct_mapping = be32_to_cpu(direct64->flags) & DDW_FLAGS_DIRECT;
+			dma64 = window->prop;
+			*dma_addr = be64_to_cpu(dma64->dma_base);
+			*direct_mapping = be32_to_cpu(dma64->flags) & DDW_FLAGS_DIRECT;
 			found = true;
 			break;
 		}
 	}
-	spin_unlock(&direct_window_list_lock);
+	spin_unlock(&dma_win_list_lock);
 
 	return found;
 }
 
-static struct direct_window *ddw_list_add(struct device_node *pdn,
-					  const struct dynamic_dma_window_prop *dma64)
+static struct dma_win *ddw_list_add(struct device_node *pdn,
+				    const struct dynamic_dma_window_prop *dma64)
 {
-	struct direct_window *window;
+	struct dma_win *window;
 
 	window = kzalloc(sizeof(*window), GFP_KERNEL);
 	if (!window)
@@ -888,9 +892,9 @@ static struct direct_window *ddw_list_add(struct device_node *pdn,
 
 	window->device = pdn;
 	window->prop = dma64;
-	spin_lock(&direct_window_list_lock);
-	list_add(&window->list, &direct_window_list);
-	spin_unlock(&direct_window_list_lock);
+	spin_lock(&dma_win_list_lock);
+	list_add(&window->list, &dma_win_list);
+	spin_unlock(&dma_win_list_lock);
 
 	return window;
 }
@@ -899,19 +903,19 @@ static int find_existing_ddw_windows(void)
 {
 	int len;
 	struct device_node *pdn;
-	struct direct_window *window;
-	const struct dynamic_dma_window_prop *direct64;
+	struct dma_win *window;
+	const struct dynamic_dma_window_prop *dma64;
 
 	if (!firmware_has_feature(FW_FEATURE_LPAR))
 		return 0;
 
 	for_each_node_with_property(pdn, DMA64_PROPNAME) {
-		direct64 = of_get_property(pdn, DMA64_PROPNAME, &len);
-		if (!direct64)
+		dma64 = of_get_property(pdn, DMA64_PROPNAME, &len);
+		if (!dma64)
 			continue;
 
-		window = ddw_list_add(pdn, direct64);
-		if (!window || len < sizeof(*direct64)) {
+		window = ddw_list_add(pdn, dma64);
+		if (!window || len < sizeof(*dma64)) {
 			kfree(window);
 			remove_ddw(pdn, true);
 		}
@@ -1203,17 +1207,17 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	u64 max_addr, win_addr;
 	struct device_node *dn;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
-	struct direct_window *window;
+	struct dma_win *window;
 	struct property *win64 = NULL;
 	struct failed_ddw_pdn *fpdn;
 	bool default_win_removed = false, maps_whole_partition = false;
 	struct pci_dn *pci = PCI_DN(pdn);
 	struct iommu_table *tbl = pci->table_group->tables[0];
 
-	mutex_lock(&direct_window_init_mutex);
+	mutex_lock(&dma_win_init_mutex);
 
 	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &maps_whole_partition)) {
-		mutex_unlock(&direct_window_init_mutex);
+		mutex_unlock(&dma_win_init_mutex);
 		return maps_whole_partition;
 	}
 
@@ -1264,7 +1268,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		struct property *default_win;
 		int reset_win_ext;
 
-		default_win = of_find_property(pdn, "ibm,dma-window", NULL);
+		default_win = of_find_property(pdn, DEFAULT_DMA_WIN, NULL);
 		if (!default_win)
 			goto out_failed;
 
@@ -1293,8 +1297,8 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	} else if (query.page_size & 1) {
 		page_shift = 12; /* 4kB */
 	} else {
-		dev_dbg(&dev->dev, "no supported direct page size in mask %x",
-			  query.page_size);
+		dev_dbg(&dev->dev, "no supported page size in mask %x",
+			query.page_size);
 		goto out_failed;
 	}
 
@@ -1349,7 +1353,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
 					    win64->value, tce_setrange_multi_pSeriesLP_walk);
 		if (ret) {
-			dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
+			dev_info(&dev->dev, "failed to map DMA window for %pOF: %d\n",
 				 dn, ret);
 			goto out_free_window;
 		}
@@ -1369,9 +1373,9 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	goto out_unlock;
 
 out_free_window:
-	spin_lock(&direct_window_list_lock);
+	spin_lock(&dma_win_list_lock);
 	list_del(&window->list);
-	spin_unlock(&direct_window_list_lock);
+	spin_unlock(&dma_win_list_lock);
 
 	kfree(window);
 
@@ -1399,7 +1403,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	list_add(&fpdn->list, &failed_ddw_pdn_list);
 
 out_unlock:
-	mutex_unlock(&direct_window_init_mutex);
+	mutex_unlock(&dma_win_init_mutex);
 	return win64 && maps_whole_partition;
 }
 
@@ -1423,7 +1427,7 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 
 	for (pdn = dn; pdn && PCI_DN(pdn) && !PCI_DN(pdn)->table_group;
 	     pdn = pdn->parent) {
-		dma_window = of_get_property(pdn, "ibm,dma-window", NULL);
+		dma_window = of_get_property(pdn, DEFAULT_DMA_WIN, NULL);
 		if (dma_window)
 			break;
 	}
@@ -1474,7 +1478,7 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
 	 */
 	for (pdn = dn; pdn && PCI_DN(pdn) && !PCI_DN(pdn)->table_group;
 			pdn = pdn->parent) {
-		dma_window = of_get_property(pdn, "ibm,dma-window", NULL);
+		dma_window = of_get_property(pdn, DEFAULT_DMA_WIN, NULL);
 		if (dma_window)
 			break;
 	}
@@ -1488,29 +1492,29 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
 static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
 		void *data)
 {
-	struct direct_window *window;
+	struct dma_win *window;
 	struct memory_notify *arg = data;
 	int ret = 0;
 
 	switch (action) {
 	case MEM_GOING_ONLINE:
-		spin_lock(&direct_window_list_lock);
-		list_for_each_entry(window, &direct_window_list, list) {
+		spin_lock(&dma_win_list_lock);
+		list_for_each_entry(window, &dma_win_list, list) {
 			ret |= tce_setrange_multi_pSeriesLP(arg->start_pfn,
 					arg->nr_pages, window->prop);
 			/* XXX log error */
 		}
-		spin_unlock(&direct_window_list_lock);
+		spin_unlock(&dma_win_list_lock);
 		break;
 	case MEM_CANCEL_ONLINE:
 	case MEM_OFFLINE:
-		spin_lock(&direct_window_list_lock);
-		list_for_each_entry(window, &direct_window_list, list) {
+		spin_lock(&dma_win_list_lock);
+		list_for_each_entry(window, &dma_win_list, list) {
 			ret |= tce_clearrange_multi_pSeriesLP(arg->start_pfn,
 					arg->nr_pages, window->prop);
 			/* XXX log error */
 		}
-		spin_unlock(&direct_window_list_lock);
+		spin_unlock(&dma_win_list_lock);
 		break;
 	default:
 		break;
@@ -1531,7 +1535,7 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
 	struct of_reconfig_data *rd = data;
 	struct device_node *np = rd->dn;
 	struct pci_dn *pci = PCI_DN(np);
-	struct direct_window *window;
+	struct dma_win *window;
 
 	switch (action) {
 	case OF_RECONFIG_DETACH_NODE:
@@ -1547,15 +1551,15 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
 			iommu_pseries_free_group(pci->table_group,
 					np->full_name);
 
-		spin_lock(&direct_window_list_lock);
-		list_for_each_entry(window, &direct_window_list, list) {
+		spin_lock(&dma_win_list_lock);
+		list_for_each_entry(window, &dma_win_list, list) {
 			if (window->device == np) {
 				list_del(&window->list);
 				kfree(window);
 				break;
 			}
 		}
-		spin_unlock(&direct_window_list_lock);
+		spin_unlock(&dma_win_list_lock);
 		break;
 	default:
 		err = NOTIFY_DONE;
-- 
2.25.4

