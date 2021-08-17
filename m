Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 949DE3EE6DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 08:48:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GphS82wZcz3dp8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 16:48:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IJOETY3d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IJOETY3d; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GphHg30hYz3cL3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 16:40:47 +1000 (AEST)
Received: by mail-qk1-x734.google.com with SMTP id 22so12571174qkg.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 23:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lC/HyJ28CoF+5fuIrRQutcc9g236fS+YJ5EtXVPU55E=;
 b=IJOETY3dkl+oqXGg0CmDJDggX8BKbEAcPd7VSAS02kDz8lizCl2g/LnuaS4qlN45UZ
 4ZpcP+Yl+GY08qi5goNtHrmRpMOWo8VPnKDNenzzXshXzG1G26AjaqqgfqmtV8tR2z18
 rVaV1kYqCdQbN2uyWmk3xI7oervixB6KEAG3tCTR9fN0d4zekbobboNfWOsyyAN2ACun
 z55tu1hTuZBOhnQnQXFxn7RS0Q2jrX9frFj5/FVxfzOhuZ4MefifQlHDTLcSAlrxG057
 UKSrynlpVThARquTpNETLRiCZJLizUZdBKYeoh90gqpeOuvXdi768iTOPrG8JGdgyi/9
 LYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lC/HyJ28CoF+5fuIrRQutcc9g236fS+YJ5EtXVPU55E=;
 b=PJRBq+wVBbBbOvhaBw3BuJsY6xVl26bIZ3gwxevo0P+GTkKIK5FECkgFPE6bsuGW6Y
 xKnt625u2Dx6lAQgZtUe88W6pRm02O5kujO45mwdybdEzk/2JY2iFw4yh6bwOYi9mcA8
 ou2nfHcqdxEd5zaq+O/togn60NEvuNxoYqnzfHYT1xsqO29+PxQGPccymHhYJ8SD/xca
 M/5dpz1gAmiY3ZaCdj1QPSWHTXq08ZfTlXHe019ORGfcvtjq3eIgHt3/Bac9Np56bmco
 Qf2BPMMkFoASxo130oIsBELx2u3naQLE02B42x7FnasyHv7xTVw/jcFZWvIJuM0bcMMU
 AdhA==
X-Gm-Message-State: AOAM530RHAmPfVsHUkH8VQx+cBOe+Y0kn9cWi4SXO8rOE1tb9lkJe1z9
 ZeTny9BTkvlTaAccSLvB3Hw=
X-Google-Smtp-Source: ABdhPJyDjjZxUiFq6PnigSnde090rip12oROcfC7q9HbbpexK4mhsHGuUCpRofczMTDaoTmFg6M/uw==
X-Received: by 2002:a37:9586:: with SMTP id x128mr2283188qkd.49.1629182445204; 
 Mon, 16 Aug 2021 23:40:45 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:30b2:5c9e:50:88f3:269a])
 by smtp.gmail.com with ESMTPSA id c11sm526938qth.29.2021.08.16.23.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 23:40:44 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Nicolin Chen <nicoleotsuka@gmail.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH v6 11/11] powerpc/pseries/iommu: Rename "direct window" to
 "dma window"
Date: Tue, 17 Aug 2021 03:39:29 -0300
Message-Id: <20210817063929.38701-12-leobras.c@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817063929.38701-1-leobras.c@gmail.com>
References: <20210817063929.38701-1-leobras.c@gmail.com>
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

This should cause no behavioural change, just adjust naming.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 87 +++++++++++++-------------
 1 file changed, 45 insertions(+), 42 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 0eccc29f5573..dab5c56ffd0e 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -349,7 +349,7 @@ struct dynamic_dma_window_prop {
 	__be32	window_shift;	/* ilog2(tce_window_size) */
 };
 
-struct direct_window {
+struct dma_win {
 	struct device_node *device;
 	const struct dynamic_dma_window_prop *prop;
 	struct list_head list;
@@ -369,11 +369,11 @@ struct ddw_create_response {
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
 #define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
 #define DMA64_PROPNAME "linux,dma64-ddr-window-info"
 
@@ -713,7 +713,10 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 	pr_debug("pci_dma_bus_setup_pSeriesLP: setting up bus %pOF\n",
 		 dn);
 
-	/* Find nearest ibm,dma-window, walking up the device tree */
+	/*
+	 * Find nearest ibm,dma-window (default DMA window), walking up the
+	 * device tree
+	 */
 	for (pdn = dn; pdn != NULL; pdn = pdn->parent) {
 		dma_window = of_get_property(pdn, "ibm,dma-window", NULL);
 		if (dma_window != NULL)
@@ -869,37 +872,37 @@ static int remove_ddw(struct device_node *np, bool remove_prop, const char *win_
 
 	ret = of_remove_property(np, win);
 	if (ret)
-		pr_warn("%pOF: failed to remove direct window property: %d\n",
+		pr_warn("%pOF: failed to remove DMA window property: %d\n",
 			np, ret);
 	return 0;
 }
 
 static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, int *window_shift)
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
-			*window_shift = be32_to_cpu(direct64->window_shift);
+			dma64 = window->prop;
+			*dma_addr = be64_to_cpu(dma64->dma_base);
+			*window_shift = be32_to_cpu(dma64->window_shift);
 			found = true;
 			break;
 		}
 	}
-	spin_unlock(&direct_window_list_lock);
+	spin_unlock(&dma_win_list_lock);
 
 	return found;
 }
 
-static struct direct_window *ddw_list_new_entry(struct device_node *pdn,
-						const struct dynamic_dma_window_prop *dma64)
+static struct dma_win *ddw_list_new_entry(struct device_node *pdn,
+					  const struct dynamic_dma_window_prop *dma64)
 {
-	struct direct_window *window;
+	struct dma_win *window;
 
 	window = kzalloc(sizeof(*window), GFP_KERNEL);
 	if (!window)
@@ -915,7 +918,7 @@ static void find_existing_ddw_windows_named(const char *name)
 {
 	int len;
 	struct device_node *pdn;
-	struct direct_window *window;
+	struct dma_win *window;
 	const struct dynamic_dma_window_prop *dma64;
 
 	for_each_node_with_property(pdn, name) {
@@ -929,9 +932,9 @@ static void find_existing_ddw_windows_named(const char *name)
 		if (!window)
 			break;
 
-		spin_lock(&direct_window_list_lock);
-		list_add(&window->list, &direct_window_list);
-		spin_unlock(&direct_window_list_lock);
+		spin_lock(&dma_win_list_lock);
+		list_add(&window->list, &dma_win_list);
+		spin_unlock(&dma_win_list_lock);
 	}
 }
 
@@ -1231,7 +1234,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	const char *win_name;
 	struct device_node *dn;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
-	struct direct_window *window;
+	struct dma_win *window;
 	struct property *win64;
 	bool ddw_enabled = false;
 	struct failed_ddw_pdn *fpdn;
@@ -1244,7 +1247,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	pmem_present = dn != NULL;
 	of_node_put(dn);
 
-	mutex_lock(&direct_window_init_mutex);
+	mutex_lock(&dma_win_init_mutex);
 
 	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &len)) {
 		direct_mapping = (len >= max_ram_len);
@@ -1324,8 +1327,8 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 	page_shift = iommu_get_page_shift(query.page_size);
 	if (!page_shift) {
-		dev_dbg(&dev->dev, "no supported direct page size in mask %x",
-			  query.page_size);
+		dev_dbg(&dev->dev, "no supported page size in mask %x",
+			query.page_size);
 		goto out_failed;
 	}
 
@@ -1384,7 +1387,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 	ret = of_add_property(pdn, win64);
 	if (ret) {
-		dev_err(&dev->dev, "unable to add dma window property for %pOF: %d",
+		dev_err(&dev->dev, "unable to add DMA window property for %pOF: %d",
 			pdn, ret);
 		goto out_free_prop;
 	}
@@ -1398,7 +1401,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
 					    win64->value, tce_setrange_multi_pSeriesLP_walk);
 		if (ret) {
-			dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
+			dev_info(&dev->dev, "failed to map DMA window for %pOF: %d\n",
 				 dn, ret);
 
 		/* Make sure to clean DDW if any TCE was set*/
@@ -1443,9 +1446,9 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		set_iommu_table_base(&dev->dev, newtbl);
 	}
 
-	spin_lock(&direct_window_list_lock);
-	list_add(&window->list, &direct_window_list);
-	spin_unlock(&direct_window_list_lock);
+	spin_lock(&dma_win_list_lock);
+	list_add(&window->list, &dma_win_list);
+	spin_unlock(&dma_win_list_lock);
 
 	dev->dev.archdata.dma_offset = win_addr;
 	ddw_enabled = true;
@@ -1477,7 +1480,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	list_add(&fpdn->list, &failed_ddw_pdn_list);
 
 out_unlock:
-	mutex_unlock(&direct_window_init_mutex);
+	mutex_unlock(&dma_win_init_mutex);
 
 	/*
 	 * If we have persistent memory and the window size is only as big
@@ -1575,29 +1578,29 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
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
@@ -1618,7 +1621,7 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
 	struct of_reconfig_data *rd = data;
 	struct device_node *np = rd->dn;
 	struct pci_dn *pci = PCI_DN(np);
-	struct direct_window *window;
+	struct dma_win *window;
 
 	switch (action) {
 	case OF_RECONFIG_DETACH_NODE:
@@ -1636,15 +1639,15 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
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
2.32.0

