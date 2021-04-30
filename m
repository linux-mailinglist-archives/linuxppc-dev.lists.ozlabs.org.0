Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 873E136FEAF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:35:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWyfJ3Zhbz3cZL
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 02:35:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SPHkMy5a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SPHkMy5a; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWyZl6Dw5z30CS
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 02:32:31 +1000 (AEST)
Received: by mail-qv1-xf2c.google.com with SMTP id x27so34712342qvd.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 09:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kVFVGaC/KDPy2IfH2/AdNDd/7nkatI7oRkJ+mdTvSsE=;
 b=SPHkMy5agk7hZplxeRwIBJpgaXKbgG1q8yWNcegsPrZXGNCG3Of95d/fjl5HBtdS8Z
 wu/PSFOCI54WQyeyU3I0j5x+3CIXYTuKTuLRfjOfN0g4EAOs1UBWAgZVCKn0/PUgKRhM
 CTPPgtzzZ0EvbN/2ukhUdiawSuOJeP8qKME7WLEGDSLrdOCVLHQWoOQv8HYilYfUOGcS
 KSBgmeJYilv2F5uUSC7ZdUnyvqvgYuVyXNFfBlqaLGeL3qmfHK0AzCMntN8N7KhT6XFT
 M0zfVdW5Og73K7QsQymUBDshkspGP0o7Atoi4ldNnDVjp8wJ3oPxBSovADSz3yCBheMm
 +03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kVFVGaC/KDPy2IfH2/AdNDd/7nkatI7oRkJ+mdTvSsE=;
 b=qqvYV/T9VIrUsTTtn6DizPKh8ufnVfeu3rB3KchQ3cA4j2HL72b9P40SjB3AisLrHi
 +CcI0O7wbLauxEqo1kdRyTDcYuZ7ccENjQCOMPg1N2pqNMumP4En78tkYFyDMq7xALQR
 XNueIZws5unrsVPCuXOk9ZDLBGHFXo7iiukOVu0yN/9wGAECAc3Z821/lSpRM50iaGrP
 kEzFLApBIGgYK/2fX5xNvv3T8Ki+EpXRpqZngI+pbJRMmU1776+P96FpHXxLltg3lxLW
 uClPJi3ctzpvpfWJYZ2SuN6JK4nBf1S2f1SbhyZTs2kksq3pSa/0AtOAp/E8E2nwVrGo
 w3og==
X-Gm-Message-State: AOAM530DjSPKwxmVwWoKTLfcQXNf3faWGF4oUwG9X3qYyZs4nb18ZDFa
 GWbc4YYhHSs5theMq62nqiM=
X-Google-Smtp-Source: ABdhPJxpBA2z1f/SmLRt/Px4Ab/jAlzn9Lb47i7N7o1Tpxo+ZVwulQI4iGPVr2jQqA14p3MRMkOMHg==
X-Received: by 2002:ad4:41c6:: with SMTP id a6mr6207657qvq.56.1619800349262;
 Fri, 30 Apr 2021 09:32:29 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 ([2804:14c:482:7b04::1001])
 by smtp.gmail.com with ESMTPSA id p1sm2624334qtu.89.2021.04.30.09.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 09:32:28 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v4 07/11] powerpc/pseries/iommu: Reorganize
 iommu_table_setparms*() with new helper
Date: Fri, 30 Apr 2021 13:31:42 -0300
Message-Id: <20210430163145.146984-8-leobras.c@gmail.com>
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

Add a new helper _iommu_table_setparms(), and use it in
iommu_table_setparms() and iommu_table_setparms_lpar() to avoid duplicated
code.

Also, setting tbl->it_ops was happening outsite iommu_table_setparms*(),
so move it to the new helper. Since we need the iommu_table_ops to be
declared before used, move iommu_table_lpar_multi_ops and
iommu_table_pseries_ops to before their respective iommu_table_setparms*().

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 100 ++++++++++++-------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 5a70ecd579b8..89cb6e9e9f31 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -53,6 +53,11 @@ enum {
 	DDW_EXT_QUERY_OUT_SIZE = 2
 };
 
+#ifdef CONFIG_IOMMU_API
+static int tce_exchange_pseries(struct iommu_table *tbl, long index, unsigned long *tce,
+				enum dma_data_direction *direction, bool realmode);
+#endif
+
 static struct iommu_table *iommu_pseries_alloc_table(int node)
 {
 	struct iommu_table *tbl;
@@ -501,6 +506,28 @@ static int tce_setrange_multi_pSeriesLP_walk(unsigned long start_pfn,
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
@@ -509,8 +536,13 @@ static void iommu_table_setparms(struct pci_controller *phb,
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
@@ -519,33 +551,25 @@ static void iommu_table_setparms(struct pci_controller *phb,
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
@@ -557,28 +581,17 @@ static void iommu_table_setparms_lpar(struct pci_controller *phb,
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
@@ -647,7 +660,6 @@ static void pci_dma_bus_setup_pSeries(struct pci_bus *bus)
 	tbl = pci->table_group->tables[0];
 
 	iommu_table_setparms(pci->phb, dn, tbl);
-	tbl->it_ops = &iommu_table_pseries_ops;
 	iommu_init_table(tbl, pci->phb->node, 0, 0);
 
 	/* Divide the rest (1.75GB) among the children */
@@ -664,7 +676,7 @@ static int tce_exchange_pseries(struct iommu_table *tbl, long index, unsigned
 				bool realmode)
 {
 	long rc;
-	unsigned long ioba = (unsigned long) index << tbl->it_page_shift;
+	unsigned long ioba = (unsigned long)index << tbl->it_page_shift;
 	unsigned long flags, oldtce = 0;
 	u64 proto_tce = iommu_direction_to_tce_perm(*direction);
 	unsigned long newtce = *tce | proto_tce;
@@ -686,15 +698,6 @@ static int tce_exchange_pseries(struct iommu_table *tbl, long index, unsigned
 }
 #endif
 
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
@@ -729,7 +732,6 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 		tbl = ppci->table_group->tables[0];
 		iommu_table_setparms_lpar(ppci->phb, pdn, tbl,
 				ppci->table_group, dma_window);
-		tbl->it_ops = &iommu_table_lpar_multi_ops;
 		iommu_init_table(tbl, ppci->phb->node, 0, 0);
 		iommu_register_group(ppci->table_group,
 				pci_domain_nr(bus), 0);
@@ -758,7 +760,6 @@ static void pci_dma_dev_setup_pSeries(struct pci_dev *dev)
 		PCI_DN(dn)->table_group = iommu_pseries_alloc_group(phb->node);
 		tbl = PCI_DN(dn)->table_group->tables[0];
 		iommu_table_setparms(phb, dn, tbl);
-		tbl->it_ops = &iommu_table_pseries_ops;
 		iommu_init_table(tbl, phb->node, 0, 0);
 		set_iommu_table_base(&dev->dev, tbl);
 		return;
@@ -1436,7 +1437,6 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 		tbl = pci->table_group->tables[0];
 		iommu_table_setparms_lpar(pci->phb, pdn, tbl,
 				pci->table_group, dma_window);
-		tbl->it_ops = &iommu_table_lpar_multi_ops;
 		iommu_init_table(tbl, pci->phb->node, 0, 0);
 		iommu_register_group(pci->table_group,
 				pci_domain_nr(pci->phb->bus), 0);
-- 
2.30.2

