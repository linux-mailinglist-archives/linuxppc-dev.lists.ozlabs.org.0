Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D652667BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 19:48:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp3C91bTxzDqxB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 03:48:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iSRCZJ/u; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp2Pw5bvVzDqs8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 03:12:52 +1000 (AEST)
Received: by mail-qv1-xf43.google.com with SMTP id b13so5569920qvl.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 10:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FPzR7Zqg+PPA7iHXennnbiJW6Siu3K9lflHEfUqPAP0=;
 b=iSRCZJ/u+Rh2k+4suIiAgtrfsxOA1JWwy/TfLnaDYVrA4G/ViT5wRw3unlNLCJIaAp
 SPclhWiBvMnAhdYJkAc+J2nFNV7eRlUNdzX1yoks0G+XmZVknAC18+wURbyu19OqtGp6
 3xW+FWkh80RfTIhIpnpqMcFemY34eOksXr6itjz1JSV+oeQa0/oBQOT5c0qp6di0+KzY
 lfbDkmKC5X4rxjR6UCeDVWLO7a7tK7s1b7fK4ExgbRHMQdt/0aXJiY2mySBSS/7FRWD+
 Y+uXrIb9voNnae4kn3tLvsxmXLnbYk++2VE2egITYNHnivJaznjtWV1SsFlOS6ScSlW2
 WPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FPzR7Zqg+PPA7iHXennnbiJW6Siu3K9lflHEfUqPAP0=;
 b=AoSj+YjFq+pQgvHVi0WFKlHsrR2hzOIYyWOMyUA3zwGJ8jXLTlvmyLZNWrsKCUUEaU
 TiECOI2xWMiOWBOU0+Sre/Opxb7DZatjAtx470uJ08IWBm+mJ991nZTphR/adaX+lEst
 oEFk2JBzE7qXTscLuj99RBzpUEl3a/yhfHcZUC2HGLjEOi0BZ4Yx2j0H8ikun5GxTJqL
 vK18od80z34qrYkO/j3EsZnsRcz+hBng4yUtOsR/KJTCK7ffABxJ+VCIIkUS95IQeS5U
 c8rreB4GRbfuUB0w6w7lmKSunhlex75NDvbp22JueiODSVPyUbao2cLhf6hBs8Ci1dfw
 buHQ==
X-Gm-Message-State: AOAM532deD7XMFpm25nloA6Bu/TXwNK4Aad/PHCzPGV6LSfPRH/q1cwT
 9OSJZeHMIwW+HJbUvSMgOAQ=
X-Google-Smtp-Source: ABdhPJyWe5HKQ4uv+Nj2vC8YKnavqzhKssvsQFxt8me7PmPd2Cl/KJlqndHhv3LT+/2vPJLPaQlifA==
X-Received: by 2002:a05:6214:5c8:: with SMTP id
 t8mr2978978qvz.86.1599844369353; 
 Fri, 11 Sep 2020 10:12:49 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-254-96.dynamic.desktop.com.br.
 [179.125.254.96])
 by smtp.gmail.com with ESMTPSA id l5sm3533330qtc.28.2020.09.11.10.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 10:12:48 -0700 (PDT)
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
Subject: [PATCH v2 14/14] powerpc/pseries/iommu: Rename "direct window" to
 "dma window"
Date: Fri, 11 Sep 2020 14:07:39 -0300
Message-Id: <20200911170738.82818-15-leobras.c@gmail.com>
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
 arch/powerpc/platforms/pseries/iommu.c | 102 +++++++++++++------------
 1 file changed, 53 insertions(+), 49 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index c4de23080d1b..56638b7f07fc 100644
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
@@ -369,13 +369,14 @@ struct ddw_create_response {
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
+#define DEFAULT_DMA_WIN "ibm,dma-window"
 
 static int tce_clearrange_multi_pSeriesLP(unsigned long start_pfn,
 					unsigned long num_pfn, const void *arg)
@@ -706,15 +707,18 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
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
 
@@ -810,11 +814,11 @@ static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
 
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
@@ -842,7 +846,7 @@ static int remove_ddw(struct device_node *np, bool remove_prop, const char *win_
 
 	ret = of_remove_property(np, win);
 	if (ret)
-		pr_warn("%pOF: failed to remove direct window property: %d\n",
+		pr_warn("%pOF: failed to remove dma window property: %d\n",
 			np, ret);
 	return 0;
 }
@@ -886,34 +890,34 @@ static phys_addr_t ddw_memory_hotplug_max(void)
 
 static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, bool *direct_mapping)
 {
-	struct direct_window *window;
-	const struct dynamic_dma_window_prop *direct64;
+	struct dma_win *window;
+	const struct dynamic_dma_window_prop *dma64;
 	unsigned long window_size;
 	bool found = false;
 
-	spin_lock(&direct_window_list_lock);
+	spin_lock(&dma_win_list_lock);
 	/* check if we already created a window and dupe that config if so */
-	list_for_each_entry(window, &direct_window_list, list) {
+	list_for_each_entry(window, &dma_win_list, list) {
 		if (window->device == pdn) {
-			direct64 = window->prop;
-			*dma_addr = be64_to_cpu(direct64->dma_base);
+			dma64 = window->prop;
+			*dma_addr = be64_to_cpu(dma64->dma_base);
 
-			window_size = (1UL << be32_to_cpu(direct64->window_shift));
+			window_size = (1UL << be32_to_cpu(dma64->window_shift));
 			*direct_mapping = (window_size >= ddw_memory_hotplug_max());
 
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
@@ -929,7 +933,7 @@ static void find_existing_ddw_windows_named(const char *name)
 {
 	int len;
 	struct device_node *pdn;
-	struct direct_window *window;
+	struct dma_win *window;
 	const struct dynamic_dma_window_prop *dma64;
 
 	for_each_node_with_property(pdn, name) {
@@ -943,9 +947,9 @@ static void find_existing_ddw_windows_named(const char *name)
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
 
@@ -1179,7 +1183,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	u64 max_addr, win_addr;
 	struct device_node *dn;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
-	struct direct_window *window;
+	struct dma_win *window;
 	const char *win_name;
 	struct property *win64 = NULL;
 	struct failed_ddw_pdn *fpdn;
@@ -1187,10 +1191,10 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	struct pci_dn *pci = PCI_DN(pdn);
 	struct iommu_table *tbl = pci->table_group->tables[0];
 
-	mutex_lock(&direct_window_init_mutex);
+	mutex_lock(&dma_win_init_mutex);
 
 	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &direct_mapping)) {
-		mutex_unlock(&direct_window_init_mutex);
+		mutex_unlock(&dma_win_init_mutex);
 		return direct_mapping;
 	}
 
@@ -1241,7 +1245,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		struct property *default_win;
 		int reset_win_ext;
 
-		default_win = of_find_property(pdn, "ibm,dma-window", NULL);
+		default_win = of_find_property(pdn, DEFAULT_DMA_WIN, NULL);
 		if (!default_win)
 			goto out_failed;
 
@@ -1272,8 +1276,8 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	} else if ((query.page_size & 1) && PAGE_SHIFT >= 12) {
 		page_shift = 12; /* 4kB */
 	} else {
-		dev_dbg(&dev->dev, "no supported direct page size in mask %x",
-			  query.page_size);
+		dev_dbg(&dev->dev, "no supported page size in mask %x",
+			query.page_size);
 		goto out_failed;
 	}
 
@@ -1331,7 +1335,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
 					    win64->value, tce_setrange_multi_pSeriesLP_walk);
 		if (ret) {
-			dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
+			dev_info(&dev->dev, "failed to map DMA window for %pOF: %d\n",
 				 dn, ret);
 			goto out_list_del;
 		}
@@ -1354,9 +1358,9 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		set_iommu_table_base(&dev->dev, tbl);
 	}
 
-	spin_lock(&direct_window_list_lock);
-	list_add(&window->list, &direct_window_list);
-	spin_unlock(&direct_window_list_lock);
+	spin_lock(&dma_win_list_lock);
+	list_add(&window->list, &dma_win_list);
+	spin_unlock(&dma_win_list_lock);
 
 	dev->dev.archdata.dma_offset = win_addr;
 	goto out_unlock;
@@ -1387,7 +1391,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	list_add(&fpdn->list, &failed_ddw_pdn_list);
 
 out_unlock:
-	mutex_unlock(&direct_window_init_mutex);
+	mutex_unlock(&dma_win_init_mutex);
 	return win64 && direct_mapping;
 }
 
@@ -1411,7 +1415,7 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 
 	for (pdn = dn; pdn && PCI_DN(pdn) && !PCI_DN(pdn)->table_group;
 	     pdn = pdn->parent) {
-		dma_window = of_get_property(pdn, "ibm,dma-window", NULL);
+		dma_window = of_get_property(pdn, DEFAULT_DMA_WIN, NULL);
 		if (dma_window)
 			break;
 	}
@@ -1461,7 +1465,7 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
 	 */
 	for (pdn = dn; pdn && PCI_DN(pdn) && !PCI_DN(pdn)->table_group;
 			pdn = pdn->parent) {
-		dma_window = of_get_property(pdn, "ibm,dma-window", NULL);
+		dma_window = of_get_property(pdn, DEFAULT_DMA_WIN, NULL);
 		if (dma_window)
 			break;
 	}
@@ -1475,29 +1479,29 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
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
@@ -1518,7 +1522,7 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
 	struct of_reconfig_data *rd = data;
 	struct device_node *np = rd->dn;
 	struct pci_dn *pci = PCI_DN(np);
-	struct direct_window *window;
+	struct dma_win *window;
 
 	switch (action) {
 	case OF_RECONFIG_DETACH_NODE:
@@ -1537,15 +1541,15 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
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

