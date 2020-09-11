Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2056F26671D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 19:38:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp2yw5FMyzDrbB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 03:38:00 +1000 (AEST)
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
 header.s=20161025 header.b=I5OoPSZ2; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp2Pc0mRpzDqsh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 03:12:36 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id o5so10550982qke.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 10:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QEdNJIQ4X3FnK3yiBbgTZLbl6Qwk+PhLobfntKmGiYk=;
 b=I5OoPSZ2ML9QuJoj+L8VmNPSphD+sFkSOWjVIdTzE0h0yq9SBOwJwdJWyxCmrZrvJm
 A9PpArxiSzdnUM/XJYS/7o91aDuazPbtenOpsplbaVaPSob1hhBfXkPssWHtkDqLXfBp
 TBSBufDT/NpgeqQrbe3KueYmHdQnFV/QBc939C12M/I4cugdvoumjjDs/0u7SuacNXnF
 Dg/sGuLnaXjYFQq7+OnRpVefq218EuyOT0v+QywMaDBWDy5uUyD+sGspK73iKU4UkbUI
 o+QIqyYJj2GgXy8GktArd2sfFPDsVPBvEfr4xPOAZGWJPh/4oUcp0FHtwuYdc560dP3f
 jOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QEdNJIQ4X3FnK3yiBbgTZLbl6Qwk+PhLobfntKmGiYk=;
 b=oG0U219hjwxL8CGLsIVg+91zOfocpBa+azbCN93xW/1mG8N8DcQTAJpQ/6vqmCSU6Q
 gn6fY6nIsXVuaWXbMsMg5e2O3ukIQELh89grQkMhaCviicFprapxRvi6SzXT8z9C/RZ+
 Q54zQpP3/GW+C5sfNh/4np6y1wHbeO1SC8Jsja1mU5fq5elgY+cv+FwT3rk9Qsuz30Ci
 6Ft563VzAbQlsRhpoOpnF9egAKl0tRup5JC3tl4dqT4aglZv6WdRVnF2LpcRigzfo49f
 kQG22fGivwS3UH2sMxAsgqYv209yCpac86xWEbo6qdC9U5qaCXqJAO6w8QWeQ2L1pEy6
 QHlw==
X-Gm-Message-State: AOAM5317HcpY6kSbIBACdumLSsyNDPCp9GIziqjo3ADOwKwBa4uELWr0
 U/Zs8C7pCzFgnOXuYOEvzBg=
X-Google-Smtp-Source: ABdhPJxQs/bElqMuG2TX2N9bfW8LX9ti2Zm+lcIainT9/p7yRubSJOhHSr80Zjrg7JEA0sF4S63zYQ==
X-Received: by 2002:ae9:e84c:: with SMTP id a73mr2341295qkg.432.1599844353602; 
 Fri, 11 Sep 2020 10:12:33 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-254-96.dynamic.desktop.com.br.
 [179.125.254.96])
 by smtp.gmail.com with ESMTPSA id l5sm3533330qtc.28.2020.09.11.10.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 10:12:32 -0700 (PDT)
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
Subject: [PATCH v2 10/14] powerpc/pseries/iommu: Reorganize
 iommu_table_setparms*() with new helper
Date: Fri, 11 Sep 2020 14:07:35 -0300
Message-Id: <20200911170738.82818-11-leobras.c@gmail.com>
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

Add a new helper _iommu_table_setparms(), and use it in
iommu_table_setparms() and iommu_table_setparms_lpar() to avoid duplicated
code.

Also, setting tbl->it_ops was happening outsite iommu_table_setparms*(),
so move it to the new helper. Since we need the iommu_table_ops to be
declared before used, move iommu_table_lpar_multi_ops and
iommu_table_pseries_ops to before their respective iommu_table_setparms*().

The tce_exchange_pseries() also had to be moved up, since it's used in
iommu_table_lpar_multi_ops.xchg_no_kill.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 149 ++++++++++++-------------
 1 file changed, 72 insertions(+), 77 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 510ccb0521af..abd36b257725 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -495,12 +495,62 @@ static int tce_setrange_multi_pSeriesLP(unsigned long start_pfn,
 	return rc;
 }
 
+#ifdef CONFIG_IOMMU_API
+static int tce_exchange_pseries(struct iommu_table *tbl, long index, unsigned
+				long *tce, enum dma_data_direction *direction,
+				bool realmode)
+{
+	long rc;
+	unsigned long ioba = (unsigned long)index << tbl->it_page_shift;
+	unsigned long flags, oldtce = 0;
+	u64 proto_tce = iommu_direction_to_tce_perm(*direction);
+	unsigned long newtce = *tce | proto_tce;
+
+	spin_lock_irqsave(&tbl->large_pool.lock, flags);
+
+	rc = plpar_tce_get((u64)tbl->it_index, ioba, &oldtce);
+	if (!rc)
+		rc = plpar_tce_put((u64)tbl->it_index, ioba, newtce);
+
+	if (!rc) {
+		*direction = iommu_tce_direction(oldtce);
+		*tce = oldtce & ~(TCE_PCI_READ | TCE_PCI_WRITE);
+	}
+
+	spin_unlock_irqrestore(&tbl->large_pool.lock, flags);
+
+	return rc;
+}
+#endif
+
 static int tce_setrange_multi_pSeriesLP_walk(unsigned long start_pfn,
 		unsigned long num_pfn, void *arg)
 {
 	return tce_setrange_multi_pSeriesLP(start_pfn, num_pfn, arg);
 }
 
+static inline void _iommu_table_setparms(struct iommu_table *tbl, unsigned long busno,
+					 unsigned long liobn, unsigned long win_addr,
+					 unsigned long window_size, unsigned long page_shift,
+					 unsigned long base, struct iommu_table_ops *table_ops)
+{
+	tbl->it_busno = busno;
+	tbl->it_index = liobn;
+	tbl->it_offset = win_addr >> page_shift;
+	tbl->it_size = window_size >> page_shift;
+	tbl->it_page_shift = page_shift;
+	tbl->it_base = base;
+	tbl->it_blocksize = 16;
+	tbl->it_type = TCE_PCI;
+	tbl->it_ops = table_ops;
+}
+
+struct iommu_table_ops iommu_table_pseries_ops = {
+	.set = tce_build_pSeries,
+	.clear = tce_free_pSeries,
+	.get = tce_get_pseries
+};
+
 static void iommu_table_setparms(struct pci_controller *phb,
 				 struct device_node *dn,
 				 struct iommu_table *tbl)
@@ -509,8 +559,13 @@ static void iommu_table_setparms(struct pci_controller *phb,
 	const unsigned long *basep;
 	const u32 *sizep;
 
-	node = phb->dn;
+	/* Test if we are going over 2GB of DMA space */
+	if (phb->dma_window_base_cur + phb->dma_window_size > 0x80000000ul) {
+		udbg_printf("PCI_DMA: Unexpected number of IOAs under this PHB.\n");
+		panic("PCI_DMA: Unexpected number of IOAs under this PHB.\n");
+	}
 
+	node = phb->dn;
 	basep = of_get_property(node, "linux,tce-base", NULL);
 	sizep = of_get_property(node, "linux,tce-size", NULL);
 	if (basep == NULL || sizep == NULL) {
@@ -519,33 +574,25 @@ static void iommu_table_setparms(struct pci_controller *phb,
 		return;
 	}
 
-	tbl->it_base = (unsigned long)__va(*basep);
+	_iommu_table_setparms(tbl, phb->bus->number, 0, phb->dma_window_base_cur,
+			      phb->dma_window_size, IOMMU_PAGE_SHIFT_4K,
+			      (unsigned long)__va(*basep), &iommu_table_pseries_ops);
 
 	if (!is_kdump_kernel())
 		memset((void *)tbl->it_base, 0, *sizep);
 
-	tbl->it_busno = phb->bus->number;
-	tbl->it_page_shift = IOMMU_PAGE_SHIFT_4K;
-
-	/* Units of tce entries */
-	tbl->it_offset = phb->dma_window_base_cur >> tbl->it_page_shift;
-
-	/* Test if we are going over 2GB of DMA space */
-	if (phb->dma_window_base_cur + phb->dma_window_size > 0x80000000ul) {
-		udbg_printf("PCI_DMA: Unexpected number of IOAs under this PHB.\n");
-		panic("PCI_DMA: Unexpected number of IOAs under this PHB.\n");
-	}
-
 	phb->dma_window_base_cur += phb->dma_window_size;
-
-	/* Set the tce table size - measured in entries */
-	tbl->it_size = phb->dma_window_size >> tbl->it_page_shift;
-
-	tbl->it_index = 0;
-	tbl->it_blocksize = 16;
-	tbl->it_type = TCE_PCI;
 }
 
+struct iommu_table_ops iommu_table_lpar_multi_ops = {
+	.set = tce_buildmulti_pSeriesLP,
+#ifdef CONFIG_IOMMU_API
+	.xchg_no_kill = tce_exchange_pseries,
+#endif
+	.clear = tce_freemulti_pSeriesLP,
+	.get = tce_get_pSeriesLP
+};
+
 /*
  * iommu_table_setparms_lpar
  *
@@ -557,28 +604,17 @@ static void iommu_table_setparms_lpar(struct pci_controller *phb,
 				      struct iommu_table_group *table_group,
 				      const __be32 *dma_window)
 {
-	unsigned long offset, size;
+	unsigned long offset, size, liobn;
 
-	of_parse_dma_window(dn, dma_window, &tbl->it_index, &offset, &size);
+	of_parse_dma_window(dn, dma_window, &liobn, &offset, &size);
 
-	tbl->it_busno = phb->bus->number;
-	tbl->it_page_shift = IOMMU_PAGE_SHIFT_4K;
-	tbl->it_base   = 0;
-	tbl->it_blocksize  = 16;
-	tbl->it_type = TCE_PCI;
-	tbl->it_offset = offset >> tbl->it_page_shift;
-	tbl->it_size = size >> tbl->it_page_shift;
+	_iommu_table_setparms(tbl, phb->bus->number, liobn, offset, size, IOMMU_PAGE_SHIFT_4K, 0,
+			      &iommu_table_lpar_multi_ops);
 
 	table_group->tce32_start = offset;
 	table_group->tce32_size = size;
 }
 
-struct iommu_table_ops iommu_table_pseries_ops = {
-	.set = tce_build_pSeries,
-	.clear = tce_free_pSeries,
-	.get = tce_get_pseries
-};
-
 static void pci_dma_bus_setup_pSeries(struct pci_bus *bus)
 {
 	struct device_node *dn;
@@ -647,7 +683,6 @@ static void pci_dma_bus_setup_pSeries(struct pci_bus *bus)
 	tbl = pci->table_group->tables[0];
 
 	iommu_table_setparms(pci->phb, dn, tbl);
-	tbl->it_ops = &iommu_table_pseries_ops;
 	iommu_init_table(tbl, pci->phb->node, 0, 0);
 
 	/* Divide the rest (1.75GB) among the children */
@@ -658,43 +693,6 @@ static void pci_dma_bus_setup_pSeries(struct pci_bus *bus)
 	pr_debug("ISA/IDE, window size is 0x%llx\n", pci->phb->dma_window_size);
 }
 
-#ifdef CONFIG_IOMMU_API
-static int tce_exchange_pseries(struct iommu_table *tbl, long index, unsigned
-				long *tce, enum dma_data_direction *direction,
-				bool realmode)
-{
-	long rc;
-	unsigned long ioba = (unsigned long) index << tbl->it_page_shift;
-	unsigned long flags, oldtce = 0;
-	u64 proto_tce = iommu_direction_to_tce_perm(*direction);
-	unsigned long newtce = *tce | proto_tce;
-
-	spin_lock_irqsave(&tbl->large_pool.lock, flags);
-
-	rc = plpar_tce_get((u64)tbl->it_index, ioba, &oldtce);
-	if (!rc)
-		rc = plpar_tce_put((u64)tbl->it_index, ioba, newtce);
-
-	if (!rc) {
-		*direction = iommu_tce_direction(oldtce);
-		*tce = oldtce & ~(TCE_PCI_READ | TCE_PCI_WRITE);
-	}
-
-	spin_unlock_irqrestore(&tbl->large_pool.lock, flags);
-
-	return rc;
-}
-#endif
-
-struct iommu_table_ops iommu_table_lpar_multi_ops = {
-	.set = tce_buildmulti_pSeriesLP,
-#ifdef CONFIG_IOMMU_API
-	.xchg_no_kill = tce_exchange_pseries,
-#endif
-	.clear = tce_freemulti_pSeriesLP,
-	.get = tce_get_pSeriesLP
-};
-
 static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 {
 	struct iommu_table *tbl;
@@ -729,7 +727,6 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 		tbl = ppci->table_group->tables[0];
 		iommu_table_setparms_lpar(ppci->phb, pdn, tbl,
 				ppci->table_group, dma_window);
-		tbl->it_ops = &iommu_table_lpar_multi_ops;
 		iommu_init_table(tbl, ppci->phb->node, 0, 0);
 		iommu_register_group(ppci->table_group,
 				pci_domain_nr(bus), 0);
@@ -758,7 +755,6 @@ static void pci_dma_dev_setup_pSeries(struct pci_dev *dev)
 		PCI_DN(dn)->table_group = iommu_pseries_alloc_group(phb->node);
 		tbl = PCI_DN(dn)->table_group->tables[0];
 		iommu_table_setparms(phb, dn, tbl);
-		tbl->it_ops = &iommu_table_pseries_ops;
 		iommu_init_table(tbl, phb->node, 0, 0);
 		set_iommu_table_base(&dev->dev, tbl);
 		return;
@@ -1385,7 +1381,6 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 		tbl = pci->table_group->tables[0];
 		iommu_table_setparms_lpar(pci->phb, pdn, tbl,
 				pci->table_group, dma_window);
-		tbl->it_ops = &iommu_table_lpar_multi_ops;
 		iommu_init_table(tbl, pci->phb->node, 0, 0);
 		iommu_register_group(pci->table_group,
 				pci_domain_nr(pci->phb->bus), 0);
-- 
2.25.4

