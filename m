Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B405D221D7E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 09:34:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6mGT08ryzDr2F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 17:34:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oamjSBt4; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6lvp3L5gzDqvR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 17:17:58 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id e11so4638694qkm.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 00:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZS4oJIQ2eGXNXG4ckn/BOCjLtcC7Sfi7mznbmBvYbzg=;
 b=oamjSBt4+8VIplrXC+jFe4VZV+OdEcmqKl6Iwf4ecu4XygY1Y1vJ5OdUV7KhttV4Zk
 FAIGMNNPJuxBcXK9J02xLqlWDqbfRQVPMNVM+dNT0qMtmTyMZCYwzkvjL3anEzx3jHON
 EgCFBvupyO9rncdasTCwB1FI3g7KpHJ+zx6dF6t9alP2cZRre319oogkNZvpBQLL5eC6
 kM9GNZe5MZhzIO+zrC+cXKJuSQtQF2iqFaowU+TazTsmqXo1dtEosHR/BigI2y8MtOck
 /mWNKqotNM/2+5fgwYkz0IKEKaOg1uXTTtvq0pAQhEjKaljs5Q6KdB/zJ21JxsyrGyw5
 mBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZS4oJIQ2eGXNXG4ckn/BOCjLtcC7Sfi7mznbmBvYbzg=;
 b=MPNu1gNXouLMjobe+j2w1TY/kn3ezWodZ3R5O+gkj/d86tUIv7jIGD7TusUkFVKksa
 OHg8vg1m46G+YpsAy9q1Bv5Jv4g4i/zqBDJQjQEqxKgQJbM5p/APrdNMTuMBn2r+bPHZ
 +lv67AP4JudYokQ+UYoM8MuNZ/DD9nhs8mLPlc8SjnttWp9maAqPXifPm+YKBcRm4gO2
 oZDYnTFdBaxvSTVTOzDmHtjmLN2mQkMvam4Z8cBYZgqpTeLvMxnNsa9Stk+iPkrVFgGA
 fq/t4dWLMn95GfcIVTEzLzfgQTcpMueuoIRaY/VPqDGfYXjkXYcw/h3ir8IDpsv2FKU0
 3MAA==
X-Gm-Message-State: AOAM530nnihwfwbFLSkEhWWC08CVun8YjE/PBpXmoIy8LeGj+uhWRZ5j
 o6nNvxMwOXyvy28lFFPmZQA=
X-Google-Smtp-Source: ABdhPJyURFS5X63jWted3i4754ovE+xqZMCPQm3I9rkPOy+KOPpLA2hsUxg1Mcbm+o+VmlSKIT7ZAA==
X-Received: by 2002:a37:995:: with SMTP id 143mr2705579qkj.266.1594883876048; 
 Thu, 16 Jul 2020 00:17:56 -0700 (PDT)
Received: from LeoBras.ibmuc.com (200-236-239-31.dynamic.desktop.com.br.
 [200.236.239.31])
 by smtp.gmail.com with ESMTPSA id a5sm6637989qtd.84.2020.07.16.00.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 00:17:55 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>
Subject: [PATCH v4 7/7] powerpc/pseries/iommu: Rename "direct window" to "dma
 window"
Date: Thu, 16 Jul 2020 04:16:59 -0300
Message-Id: <20200716071658.467820-8-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200716071658.467820-1-leobras.c@gmail.com>
References: <20200716071658.467820-1-leobras.c@gmail.com>
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
 arch/powerpc/platforms/pseries/iommu.c | 100 +++++++++++++------------
 1 file changed, 52 insertions(+), 48 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 6e1c9d1599d1..5ca952d966a4 100644
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
@@ -697,15 +698,18 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
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
 
@@ -803,11 +807,11 @@ static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
 
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
@@ -835,26 +839,26 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
 
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
@@ -863,15 +867,15 @@ static int find_existing_ddw_windows(void)
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
@@ -882,10 +886,10 @@ static int find_existing_ddw_windows(void)
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
@@ -1118,13 +1122,13 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	u64 dma_addr, max_addr;
 	struct device_node *dn;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
-	struct direct_window *window;
+	struct dma_win *window;
 	struct property *win64;
 	struct dynamic_dma_window_prop *ddwprop;
 	struct failed_ddw_pdn *fpdn;
 	bool default_win_removed = false;
 
-	mutex_lock(&direct_window_init_mutex);
+	mutex_lock(&dma_win_init_mutex);
 
 	dma_addr = find_existing_ddw(pdn);
 	if (dma_addr != 0)
@@ -1177,7 +1181,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		struct property *default_win;
 		int reset_win_ext;
 
-		default_win = of_find_property(pdn, "ibm,dma-window", NULL);
+		default_win = of_find_property(pdn, DEFAULT_DMA_WIN, NULL);
 		if (!default_win)
 			goto out_failed;
 
@@ -1206,8 +1210,8 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	} else if (query.page_size & 1) {
 		page_shift = 12; /* 4kB */
 	} else {
-		dev_dbg(&dev->dev, "no supported direct page size in mask %x",
-			  query.page_size);
+		dev_dbg(&dev->dev, "no supported page size in mask %x",
+			query.page_size);
 		goto out_failed;
 	}
 
@@ -1258,7 +1262,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
 			win64->value, tce_setrange_multi_pSeriesLP_walk);
 	if (ret) {
-		dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
+		dev_info(&dev->dev, "failed to map DMA window for %pOF: %d\n",
 			 dn, ret);
 		goto out_free_window;
 	}
@@ -1272,9 +1276,9 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
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
@@ -1303,7 +1307,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	list_add(&fpdn->list, &failed_ddw_pdn_list);
 
 out_unlock:
-	mutex_unlock(&direct_window_init_mutex);
+	mutex_unlock(&dma_win_init_mutex);
 	return dma_addr;
 }
 
@@ -1343,7 +1347,7 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 
 	for (pdn = dn; pdn && PCI_DN(pdn) && !PCI_DN(pdn)->table_group;
 	     pdn = pdn->parent) {
-		dma_window = of_get_property(pdn, "ibm,dma-window", NULL);
+		dma_window = of_get_property(pdn, DEFAULT_DMA_WIN, NULL);
 		if (dma_window)
 			break;
 	}
@@ -1394,7 +1398,7 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
 	 */
 	for (pdn = dn; pdn && PCI_DN(pdn) && !PCI_DN(pdn)->table_group;
 			pdn = pdn->parent) {
-		dma_window = of_get_property(pdn, "ibm,dma-window", NULL);
+		dma_window = of_get_property(pdn, DEFAULT_DMA_WIN, NULL);
 		if (dma_window)
 			break;
 	}
@@ -1412,29 +1416,29 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
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
@@ -1455,7 +1459,7 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
 	struct of_reconfig_data *rd = data;
 	struct device_node *np = rd->dn;
 	struct pci_dn *pci = PCI_DN(np);
-	struct direct_window *window;
+	struct dma_win *window;
 
 	switch (action) {
 	case OF_RECONFIG_DETACH_NODE:
@@ -1471,15 +1475,15 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
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

