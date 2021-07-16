Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5273CB43D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 10:31:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GR4G82q95z3dcj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 18:31:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=BE3CuxTW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f34;
 helo=mail-qv1-xf34.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BE3CuxTW; dkim-atps=neutral
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GR4BS0FNpz30C1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 18:28:15 +1000 (AEST)
Received: by mail-qv1-xf34.google.com with SMTP id h18so4225307qve.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 01:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DAVEbAx7bu04TCg8bbxup/FztcIFteyG7Ix6iBoacZ4=;
 b=BE3CuxTWWwqXwGZTwKo13URfVqlxd6FOyxWNfUoOY/bBd23Gz7GVO8eaVrmmiNB3wt
 R40sezxR+BxxSPgHemo6mXvSNzbT+S9jsu2tNMYpmGejLnYhlzioWyCwMkUGZKbFpypS
 QaAhsIfkEgIxuseQXoB4jqGbKu3rogGxNcF91vkszCPzDWJ5L7uUBrcl8LnDYos0Jixs
 19BAogPb35Kp8XZpB4QxV2GEOFoBVlfMIEcseq2nOIn/lrDaAfchJCqIDhFAMEazmKKh
 xZvZWlpAlK7zf6YEl6c9fM43S5aEv543knY2U1t8ucyc862jN0WshZZWxkxET3hqPJjG
 Thsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DAVEbAx7bu04TCg8bbxup/FztcIFteyG7Ix6iBoacZ4=;
 b=uYDCk7D1Iu2krjRcBJyVrcJyztOcHMvCbZl42ztrXrFpO7maS+nkEtWl0ydEvkiwDf
 57dxrnbZxThgUWkYQc8JfH1MYLZjnj5/B8Z+bcrrhz5eoreSDCu0dic5xLVWcKDm+Azl
 UFrht99NjbOwe2l39Mlb6CXFYeFoisNIf9azAdMrgOpzQ1hyykAq+6ZRQaAKuf6Kaf4E
 3T8Jrt+at7adtsPY5TB2BJEuDqdRdG2XmWid177ABfJWZDxs3WXTEmCCN9eqgUQEqw0E
 4ZbtxWWLr2/krffTGM2aHeVYQDILqnr4bgXg1uNaJInSBCyusRMZo0AqyiPJjeQiTYL5
 3gdQ==
X-Gm-Message-State: AOAM532JVG0QEw7c/bAP3oC45MreOV8rOvXMaB7wmV2OnUELLdXCTC9K
 XAQbOXa/IsJrHauJgxxVFCM=
X-Google-Smtp-Source: ABdhPJzew1epNbv+KOcaGQe/20SQATFNsoOGJ9datZTAYga0pOpAUajZqYordqSEZk32XK9LhkLtrg==
X-Received: by 2002:a0c:da87:: with SMTP id z7mr9063072qvj.62.1626424093530;
 Fri, 16 Jul 2021 01:28:13 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:14c:482:92eb:ffdf:6b35:b94d:258])
 by smtp.gmail.com with ESMTPSA id q199sm3603540qka.112.2021.07.16.01.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 01:28:13 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 kernel test robot <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PATCH v5 07/11] powerpc/pseries/iommu: Reorganize
 iommu_table_setparms*() with new helper
Date: Fri, 16 Jul 2021 05:27:52 -0300
Message-Id: <20210716082755.428187-8-leobras.c@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716082755.428187-1-leobras.c@gmail.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
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

Add a new helper _iommu_table_setparms(), and use it in
iommu_table_setparms() and iommu_table_setparms_lpar() to avoid duplicated
code.

Also, setting tbl->it_ops was happening outsite iommu_table_setparms*(),
so move it to the new helper. Since we need the iommu_table_ops to be
declared before used, declare iommu_table_lpar_multi_ops and
iommu_table_pseries_ops to before their respective iommu_table_setparms*().

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 72 ++++++++++++++------------
 1 file changed, 38 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 7ca79a04fa52..108c3dcca686 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -501,6 +501,24 @@ static int tce_setrange_multi_pSeriesLP_walk(unsigned long start_pfn,
 	return tce_setrange_multi_pSeriesLP(start_pfn, num_pfn, arg);
 }
 
+static void iommu_table_setparms_common(struct iommu_table *tbl, unsigned long busno,
+					unsigned long liobn, unsigned long win_addr,
+					unsigned long window_size, unsigned long page_shift,
+					void *base, struct iommu_table_ops *table_ops)
+{
+	tbl->it_busno = busno;
+	tbl->it_index = liobn;
+	tbl->it_offset = win_addr >> page_shift;
+	tbl->it_size = window_size >> page_shift;
+	tbl->it_page_shift = page_shift;
+	tbl->it_base = (unsigned long)base;
+	tbl->it_blocksize = 16;
+	tbl->it_type = TCE_PCI;
+	tbl->it_ops = table_ops;
+}
+
+struct iommu_table_ops iommu_table_pseries_ops;
+
 static void iommu_table_setparms(struct pci_controller *phb,
 				 struct device_node *dn,
 				 struct iommu_table *tbl)
@@ -509,8 +527,13 @@ static void iommu_table_setparms(struct pci_controller *phb,
 	const unsigned long *basep;
 	const u32 *sizep;
 
-	node = phb->dn;
+	/* Test if we are going over 2GB of DMA space */
+	if (phb->dma_window_base_cur + phb->dma_window_size > SZ_2G) {
+		udbg_printf("PCI_DMA: Unexpected number of IOAs under this PHB.\n");
+		panic("PCI_DMA: Unexpected number of IOAs under this PHB.\n");
+	}
 
+	node = phb->dn;
 	basep = of_get_property(node, "linux,tce-base", NULL);
 	sizep = of_get_property(node, "linux,tce-size", NULL);
 	if (basep == NULL || sizep == NULL) {
@@ -519,33 +542,18 @@ static void iommu_table_setparms(struct pci_controller *phb,
 		return;
 	}
 
-	tbl->it_base = (unsigned long)__va(*basep);
+	iommu_table_setparms_common(tbl, phb->bus->number, 0, phb->dma_window_base_cur,
+				    phb->dma_window_size, IOMMU_PAGE_SHIFT_4K,
+				    __va(*basep), &iommu_table_pseries_ops);
 
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
 
+struct iommu_table_ops iommu_table_lpar_multi_ops;
+
 /*
  * iommu_table_setparms_lpar
  *
@@ -557,17 +565,13 @@ static void iommu_table_setparms_lpar(struct pci_controller *phb,
 				      struct iommu_table_group *table_group,
 				      const __be32 *dma_window)
 {
-	unsigned long offset, size;
+	unsigned long offset, size, liobn;
 
-	of_parse_dma_window(dn, dma_window, &tbl->it_index, &offset, &size);
+	of_parse_dma_window(dn, dma_window, &liobn, &offset, &size);
+
+	iommu_table_setparms_common(tbl, phb->bus->number, liobn, offset, size, IOMMU_PAGE_SHIFT_4K, NULL,
+				    &iommu_table_lpar_multi_ops);
 
-	tbl->it_busno = phb->bus->number;
-	tbl->it_page_shift = IOMMU_PAGE_SHIFT_4K;
-	tbl->it_base   = 0;
-	tbl->it_blocksize  = 16;
-	tbl->it_type = TCE_PCI;
-	tbl->it_offset = offset >> tbl->it_page_shift;
-	tbl->it_size = size >> tbl->it_page_shift;
 
 	table_group->tce32_start = offset;
 	table_group->tce32_size = size;
@@ -647,7 +651,7 @@ static void pci_dma_bus_setup_pSeries(struct pci_bus *bus)
 	tbl = pci->table_group->tables[0];
 
 	iommu_table_setparms(pci->phb, dn, tbl);
-	tbl->it_ops = &iommu_table_pseries_ops;
+
 	if (!iommu_init_table(tbl, pci->phb->node, 0, 0))
 		panic("Failed to initialize iommu table");
 
@@ -730,7 +734,7 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 		tbl = ppci->table_group->tables[0];
 		iommu_table_setparms_lpar(ppci->phb, pdn, tbl,
 				ppci->table_group, dma_window);
-		tbl->it_ops = &iommu_table_lpar_multi_ops;
+
 		if (!iommu_init_table(tbl, ppci->phb->node, 0, 0))
 			panic("Failed to initialize iommu table");
 		iommu_register_group(ppci->table_group,
@@ -760,7 +764,7 @@ static void pci_dma_dev_setup_pSeries(struct pci_dev *dev)
 		PCI_DN(dn)->table_group = iommu_pseries_alloc_group(phb->node);
 		tbl = PCI_DN(dn)->table_group->tables[0];
 		iommu_table_setparms(phb, dn, tbl);
-		tbl->it_ops = &iommu_table_pseries_ops;
+
 		if (!iommu_init_table(tbl, phb->node, 0, 0))
 			panic("Failed to initialize iommu table");
 
@@ -1443,7 +1447,7 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 		tbl = pci->table_group->tables[0];
 		iommu_table_setparms_lpar(pci->phb, pdn, tbl,
 				pci->table_group, dma_window);
-		tbl->it_ops = &iommu_table_lpar_multi_ops;
+
 		iommu_init_table(tbl, pci->phb->node, 0, 0);
 		iommu_register_group(pci->table_group,
 				pci_domain_nr(pci->phb->bus), 0);
-- 
2.32.0

