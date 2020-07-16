Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD710221D79
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 09:32:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6mDK0yNczDqjy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 17:32:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lvFTKz1V; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6lvl19ZdzDqvr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 17:17:55 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id u12so4113697qth.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 00:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CxIEhwPDuXo7CrTRespdnXqLwI0LZ0KuUrIP2pNY/ic=;
 b=lvFTKz1VKyFWeJJOfKpsQh538A2ECeYgBPLkealQq2QmKBKj50QQtCgKBpq7F2ECqG
 vV/j5Q+f14e2f0ZmwA7eM7elZhqsb1cBUfiEFrb6pgB8vZSqm7EiI/2gJfCr494Pwjyh
 OWRz9EY7NBVy8MZNqwael2L+crWI3osfdQgVl/CTMC3NsbXJZ0rGuGbKVOmLm+cC+K45
 oQUpphAfMc98NVNdCvPu5vKWW1aMIOW44Q/lm+ZOt6zIGdnZf4rUa2iv0UnkXKmcJLUx
 662P6qN+bCODAjIVLltBW28ORHWgRXn05zjT6khxoZuyMcIKwMeRVNV3M1Wd/FEXTAGB
 rFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CxIEhwPDuXo7CrTRespdnXqLwI0LZ0KuUrIP2pNY/ic=;
 b=PBAkgh7cih2KM0u6NEW/lFMzQJhDbuuuNoV1vpgowt3Fvdotu4q35R7A2M4xPlVDQq
 edDIhTHtwa0tFPOVEEHCaedwCB3BcO5vgNe9d+i+DhVituTPKX7F/iQjvVykvAF4EzEE
 J6qI1vgWo66yeT70IlvQD8rRsdZvza1cf/Dv3l3B5MAZEWvdy/wVbwxeMK9JgVpIvSYI
 A2ZsBW7RIZtP/4J09arh7kKqnuM1F4UbijBy8a7IyeX/7h9kmjymZ75hTvSiQqJ/7bF5
 xftsdhu6YHeMKCjPMnRB21JS//8ssBSWu9LDbcmMMtJNLCcsFI/MjMHwnnz56l+v3gzi
 BhJw==
X-Gm-Message-State: AOAM531E19UBs7Cpe/++iCkmlCq0DsJFYCs1X+xtEzJrgfIKCU9+NIMh
 UTVCcISrMSokXAYEmNOeNn4=
X-Google-Smtp-Source: ABdhPJzhA8TktDN3RhmMXQXXnFF9M1nNpn8TDlqJHhHAcSwfSSrzb28n+KH3tSE+24pivHi81HFLMQ==
X-Received: by 2002:ac8:3777:: with SMTP id p52mr3681134qtb.31.1594883871832; 
 Thu, 16 Jul 2020 00:17:51 -0700 (PDT)
Received: from LeoBras.ibmuc.com (200-236-239-31.dynamic.desktop.com.br.
 [200.236.239.31])
 by smtp.gmail.com with ESMTPSA id a5sm6637989qtd.84.2020.07.16.00.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 00:17:51 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>
Subject: [PATCH v4 6/7] powerpc/pseries/iommu: Make use of DDW even if it does
 not map the partition
Date: Thu, 16 Jul 2020 04:16:58 -0300
Message-Id: <20200716071658.467820-7-leobras.c@gmail.com>
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

As of today, if the biggest DDW that can be created can't map the whole
partition, it's creation is skipped and the default DMA window
"ibm,dma-window" is used instead.

Usually this DDW is bigger than the default DMA window, and it performs
better, so it would be nice to use it instead.

The DDW created will be used for direct mapping by default.
If it's not available, indirect mapping will be used instead.

In this case, it's necessary to update the iommu_table so iommu_alloc()
can use the DDW created. For this, iommu_table_update() is called after a
enable_ddw() when direct DMA is not available.

As there will never have both direct and indirect mappings at the same
time, the same property name can be used for the created DDW.

So renaming
define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
to
define DMA64_PROPNAME "linux,dma64-ddr-window-info"
looks the right thing to do.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/include/asm/iommu.h       |  3 ++
 arch/powerpc/kernel/iommu.c            | 15 +++++++++
 arch/powerpc/platforms/pseries/iommu.c | 46 +++++++++++++++++++-------
 3 files changed, 52 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 5032f1593299..dc4480a9d60d 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -154,6 +154,9 @@ extern int iommu_tce_table_put(struct iommu_table *tbl);
  */
 extern struct iommu_table *iommu_init_table(struct iommu_table *tbl,
 		int nid, unsigned long res_start, unsigned long res_end);
+void iommu_table_update(struct iommu_table *tbl, int nid, unsigned long liobn,
+			unsigned long win_addr, unsigned long page_shift,
+			unsigned long window_shift);
 
 #define IOMMU_TABLE_GROUP_MAX_TABLES	2
 
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index c3242253a4e7..cb0cb572eb0a 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -774,6 +774,21 @@ static void iommu_table_free(struct kref *kref)
 	kfree(tbl);
 }
 
+void iommu_table_update(struct iommu_table *tbl, int nid, unsigned long liobn,
+			unsigned long win_addr, unsigned long page_shift,
+			unsigned long window_shift)
+{
+	iommu_table_clean(tbl);
+
+	/* Update tlb with values from ddw */
+	tbl->it_index = liobn;
+	tbl->it_offset = win_addr >> page_shift;
+	tbl->it_page_shift = page_shift;
+	tbl->it_size = 1 << (window_shift - page_shift);
+
+	iommu_init_table(tbl, nid, 0, 0);
+}
+
 struct iommu_table *iommu_tce_table_get(struct iommu_table *tbl)
 {
 	if (kref_get_unless_zero(&tbl->it_kref))
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index fc8d0555e2e9..6e1c9d1599d1 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -364,7 +364,7 @@ static LIST_HEAD(direct_window_list);
 static DEFINE_SPINLOCK(direct_window_list_lock);
 /* protects initializing window twice for same device */
 static DEFINE_MUTEX(direct_window_init_mutex);
-#define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
+#define DMA64_PROPNAME "linux,dma64-ddr-window-info"
 
 static int tce_clearrange_multi_pSeriesLP(unsigned long start_pfn,
 					unsigned long num_pfn, const void *arg)
@@ -823,7 +823,7 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
 	if (ret)
 		return;
 
-	win = of_find_property(np, DIRECT64_PROPNAME, NULL);
+	win = of_find_property(np, DMA64_PROPNAME, NULL);
 	if (!win)
 		return;
 
@@ -869,8 +869,8 @@ static int find_existing_ddw_windows(void)
 	if (!firmware_has_feature(FW_FEATURE_LPAR))
 		return 0;
 
-	for_each_node_with_property(pdn, DIRECT64_PROPNAME) {
-		direct64 = of_get_property(pdn, DIRECT64_PROPNAME, &len);
+	for_each_node_with_property(pdn, DMA64_PROPNAME) {
+		direct64 = of_get_property(pdn, DMA64_PROPNAME, &len);
 		if (!direct64)
 			continue;
 
@@ -1210,23 +1210,26 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 			  query.page_size);
 		goto out_failed;
 	}
+
 	/* verify the window * number of ptes will map the partition */
-	/* check largest block * page size > max memory hotplug addr */
 	max_addr = ddw_memory_hotplug_max();
 	if (query.largest_available_block < (max_addr >> page_shift)) {
-		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu "
-			  "%llu-sized pages\n", max_addr,  query.largest_available_block,
-			  1ULL << page_shift);
-		goto out_failed;
+		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu %llu-sized pages\n",
+			max_addr, query.largest_available_block,
+			1ULL << page_shift);
+
+		len = order_base_2(query.largest_available_block << page_shift);
+	} else {
+		len = order_base_2(max_addr);
 	}
-	len = order_base_2(max_addr);
+
 	win64 = kzalloc(sizeof(struct property), GFP_KERNEL);
 	if (!win64) {
 		dev_info(&dev->dev,
 			"couldn't allocate property for 64bit dma window\n");
 		goto out_failed;
 	}
-	win64->name = kstrdup(DIRECT64_PROPNAME, GFP_KERNEL);
+	win64->name = kstrdup(DMA64_PROPNAME, GFP_KERNEL);
 	win64->value = ddwprop = kmalloc(sizeof(*ddwprop), GFP_KERNEL);
 	win64->length = sizeof(*ddwprop);
 	if (!win64->name || !win64->value) {
@@ -1273,7 +1276,9 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	list_add(&window->list, &direct_window_list);
 	spin_unlock(&direct_window_list_lock);
 
-	dma_addr = be64_to_cpu(ddwprop->dma_base);
+	/* Only returns the dma_addr if DDW maps the whole partition */
+	if (len == order_base_2(max_addr))
+		dma_addr = be64_to_cpu(ddwprop->dma_base);
 	goto out_unlock;
 
 out_free_window:
@@ -1302,6 +1307,22 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	return dma_addr;
 }
 
+static void iommu_pseries_table_update(struct pci_dev *dev,
+				       struct device_node *pdn)
+{
+	const struct dynamic_dma_window_prop *ddw;
+	struct pci_dn *pci;
+	int len;
+
+	ddw = of_get_property(pdn, DMA64_PROPNAME, &len);
+	if (!ddw  || len < sizeof(struct dynamic_dma_window_prop))
+		return;
+
+	iommu_table_update(pci->table_group->tables[0], pci->phb->node,
+			   ddw->liobn, ddw->dma_base, ddw->tce_shift,
+			   ddw->window_shift);
+}
+
 static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 {
 	struct device_node *pdn, *dn;
@@ -1382,6 +1403,7 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
 		pdev->dev.archdata.dma_offset = enable_ddw(pdev, pdn);
 		if (pdev->dev.archdata.dma_offset)
 			return true;
+		iommu_pseries_table_update(pdev, pdn);
 	}
 
 	return false;
-- 
2.25.4

