Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D634213438
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 08:33:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ylXy5qxJzDrD2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 16:33:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bJalu8LL; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ylFJ3rTQzDr86
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 16:20:20 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id w27so122082qtb.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 23:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cDr4DpWvuFbd+kaG6fqx1+0jPmXHKdGtHNz1tK3xqDs=;
 b=bJalu8LL+hcD18lBOgAH6f7Whs6OE30pOFN+36zGDgU/YOgWofFeXDu581vDei/Txr
 ZD5YAXhKZRaNQLSZGCeBljK6nMBUNGeuuncUBQw14QmlOSlTeIQecMxvWbcZCcoFkWik
 ZfdjFqGZTp6U0ucz/nMGg/SXgBn1UeeWKplDQPy9V0zokRQbOpsDLiMGv3Xd59gn5jjL
 oLmDe78ZGBSO0419HOC/cPhZH2QHb9nktDpz/MSYxYqUiY96zdXWpTTLfP/1AC8cJrkF
 FgbIaYLgmL7RWchdM1Dk7lGKP6d3nekL+mrMUV3V5y/7bvPVOWlDsEYWBiQuxD+fjk9H
 6Low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cDr4DpWvuFbd+kaG6fqx1+0jPmXHKdGtHNz1tK3xqDs=;
 b=FYt0OIwvffY+K4hts57j3+1vdQL6j7Tcm7ovmpHX0d5eBNr+Vs5p639+my/zYKlx9W
 KqbLN+iy+ZmL0pLF4UZsWlvh2VRecNAF1R5+WIRDwermRT4klzLow6pjw8/jn5XKWjzF
 3DijduVRX0MiIMkk6fIWTPwU1GRIsUm+lzlis4IM0+NsnBgRiyJvri20cfMTt6TiPyx6
 q921xllUP/8kie9b5gy4qe0IrepelodDakuxZOlvpkdzVq4JuKzX9DLfYu9Q/D6Blvhj
 a5J7c1FXW/KqgWRU9h0JFN5kSOCTlZfDOvEf4K0znSNwi6NPRtHr1zMJBtqjyW40JJ9X
 Lx2A==
X-Gm-Message-State: AOAM530TkVU1dV3QlTV1fbAgZOX0JJWTo80ZgV+v65nGihPLqEHAS0LO
 yX5WYUrvFT9ui7t/+23U1cIUD/Tk
X-Google-Smtp-Source: ABdhPJxgb6xQU+Junpwcwdz3StwkkJHKQpKRmIGH7+wo9P/U64ba2NUf3TCFAe7DwXjEHnssce5OAA==
X-Received: by 2002:ac8:6f2c:: with SMTP id i12mr34832835qtv.174.1593757218320; 
 Thu, 02 Jul 2020 23:20:18 -0700 (PDT)
Received: from LeoBras.ibmuc.com (200-236-245-17.dynamic.desktop.com.br.
 [200.236.245.17])
 by smtp.gmail.com with ESMTPSA id n28sm11165288qtf.8.2020.07.02.23.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 23:20:17 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Leonardo Bras <leobras.c@gmail.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>
Subject: [PATCH v3 6/6] powerpc/pseries/iommu: Rename "direct window" to "dma
 window"
Date: Fri,  3 Jul 2020 03:18:44 -0300
Message-Id: <20200703061844.111865-7-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200703061844.111865-1-leobras.c@gmail.com>
References: <20200703061844.111865-1-leobras.c@gmail.com>
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
 arch/powerpc/platforms/pseries/iommu.c | 101 +++++++++++++------------
 1 file changed, 53 insertions(+), 48 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index c652177de09c..070b80efc43a 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -339,7 +339,7 @@ struct dynamic_dma_window_prop {
 	__be32	window_shift;	/* ilog2(tce_window_size) */
 };
 
-struct direct_window {
+struct dma_win {
 	struct device_node *device;
 	const struct dynamic_dma_window_prop *prop;
 	struct list_head list;
@@ -359,12 +359,13 @@ struct ddw_create_response {
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
@@ -697,9 +698,12 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
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
@@ -710,7 +714,8 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 		dma_window = alt_dma_window;
 
 	if (dma_window == NULL) {
-		pr_debug("  no ibm,dma-window nor linux,dma64-ddr-window-info property !\n");
+		pr_debug("  no %s nor %s property !\n",
+			 DEFAULT_DMA_WIN, DMA64_PROPNAME);
 		return;
 	}
 
@@ -808,11 +813,11 @@ static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
 
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
@@ -840,26 +845,26 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
 
 	ret = of_remove_property(np, win);
 	if (ret)
-		pr_warn("%pOF: failed to remove direct window property: %d\n",
+		pr_warn("%pOF: failed to remove dma window property: %d\n",
 			np, ret);
 }
 
 static u64 find_existing_ddw(struct device_node *pdn)
 {
-	struct direct_window *window;
-	const struct dynamic_dma_window_prop *direct64;
+	struct dma_win *window;
+	const struct dynamic_dma_window_prop *dma64;
 	u64 dma_addr = 0;
 
-	spin_lock(&direct_window_list_lock);
+	spin_lock(&dma_win_list_lock);
 	/* check if we already created a window and dupe that config if so */
-	list_for_each_entry(window, &direct_window_list, list) {
+	list_for_each_entry(window, &dma_win_list, list) {
 		if (window->device == pdn) {
-			direct64 = window->prop;
-			dma_addr = be64_to_cpu(direct64->dma_base);
+			dma64 = window->prop;
+			dma_addr = be64_to_cpu(dma64->dma_base);
 			break;
 		}
 	}
-	spin_unlock(&direct_window_list_lock);
+	spin_unlock(&dma_win_list_lock);
 
 	return dma_addr;
 }
@@ -868,15 +873,15 @@ static int find_existing_ddw_windows(void)
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
 
 		window = kzalloc(sizeof(*window), GFP_KERNEL);
@@ -887,10 +892,10 @@ static int find_existing_ddw_windows(void)
 		}
 
 		window->device = pdn;
-		window->prop = direct64;
-		spin_lock(&direct_window_list_lock);
-		list_add(&window->list, &direct_window_list);
-		spin_unlock(&direct_window_list_lock);
+		window->prop = dma64;
+		spin_lock(&dma_win_list_lock);
+		list_add(&window->list, &dma_win_list);
+		spin_unlock(&dma_win_list_lock);
 	}
 
 	return 0;
@@ -1123,12 +1128,12 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	u64 dma_addr, max_addr;
 	struct device_node *dn;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
-	struct direct_window *window;
+	struct dma_win *window;
 	struct property *win64, *default_win = NULL;
 	struct dynamic_dma_window_prop *ddwprop;
 	struct failed_ddw_pdn *fpdn;
 
-	mutex_lock(&direct_window_init_mutex);
+	mutex_lock(&dma_win_init_mutex);
 
 	dma_addr = find_existing_ddw(pdn);
 	if (dma_addr != 0)
@@ -1178,7 +1183,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	 * for extensions presence.
 	 */
 	if (query.windows_available == 0) {
-		default_win = of_find_property(pdn, "ibm,dma-window", NULL);
+		default_win = of_find_property(pdn, DEFAULT_DMA_WIN, NULL);
 		if (!default_win)
 			goto out_failed;
 
@@ -1206,8 +1211,8 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	} else if (query.page_size & 1) {
 		page_shift = 12; /* 4kB */
 	} else {
-		dev_dbg(&dev->dev, "no supported direct page size in mask %x",
-			  query.page_size);
+		dev_dbg(&dev->dev, "no supported page size in mask %x",
+			query.page_size);
 		goto out_restore_defwin;
 	}
 
@@ -1258,7 +1263,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
 			win64->value, tce_setrange_multi_pSeriesLP_walk);
 	if (ret) {
-		dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
+		dev_info(&dev->dev, "failed to map DMA window for %pOF: %d\n",
 			 dn, ret);
 		goto out_free_window;
 	}
@@ -1272,9 +1277,9 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 	window->device = pdn;
 	window->prop = ddwprop;
-	spin_lock(&direct_window_list_lock);
-	list_add(&window->list, &direct_window_list);
-	spin_unlock(&direct_window_list_lock);
+	spin_lock(&dma_win_list_lock);
+	list_add(&window->list, &dma_win_list);
+	spin_unlock(&dma_win_list_lock);
 
 	/* Only returns the dma_addr if DDW maps the whole partition */
 	if (len == order_base_2(max_addr))
@@ -1304,7 +1309,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	list_add(&fpdn->list, &failed_ddw_pdn_list);
 
 out_unlock:
-	mutex_unlock(&direct_window_init_mutex);
+	mutex_unlock(&dma_win_init_mutex);
 	return dma_addr;
 }
 
@@ -1328,7 +1333,7 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 
 	for (pdn = dn; pdn && PCI_DN(pdn) && !PCI_DN(pdn)->table_group;
 	     pdn = pdn->parent) {
-		dma_window = of_get_property(pdn, "ibm,dma-window", NULL);
+		dma_window = of_get_property(pdn, DEFAULT_DMA_WIN, NULL);
 		if (dma_window)
 			break;
 	}
@@ -1379,7 +1384,7 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
 	 */
 	for (pdn = dn; pdn && PCI_DN(pdn) && !PCI_DN(pdn)->table_group;
 			pdn = pdn->parent) {
-		dma_window = of_get_property(pdn, "ibm,dma-window", NULL);
+		dma_window = of_get_property(pdn, DEFAULT_DMA_WIN, NULL);
 		if (dma_window)
 			break;
 	}
@@ -1396,29 +1401,29 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
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
@@ -1439,7 +1444,7 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
 	struct of_reconfig_data *rd = data;
 	struct device_node *np = rd->dn;
 	struct pci_dn *pci = PCI_DN(np);
-	struct direct_window *window;
+	struct dma_win *window;
 
 	switch (action) {
 	case OF_RECONFIG_DETACH_NODE:
@@ -1455,15 +1460,15 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
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

