Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0FF367AAB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 09:11:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQpWY1l41z3d3V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 17:11:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VNqg6lho;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VNqg6lho; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQpRj3jnHz3br1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 17:08:33 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id z25so10392189qtn.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 00:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fki2MDlr3+q/tA363Zpv6iDH7bhv7YszMbA19cxnvz0=;
 b=VNqg6lhoCBRWgb11ufnzkEd4TgmKB9yMNeMI4hesMJY/krhj7lYZMXKNL4DqZwTUFV
 jS+NN8Fz/tMn6qWnK0XA2OmC6Zbo4M/uHxtlebgxdOYtsuqM+Qno6fQZEdPOniSTyvgM
 UfTc33m6aIuhL9oObqY9uqXr83mUxEU0cMeQWCuVQGNhW9nutqq1xXARbLJcA6R0in6Y
 mw2qZxZZJHrZE7erRNPLfSr3SwkLBzsn3uGTbJngs64eKGe8t2ZWnnCgKCog2immcl1z
 5w2q/e1beQHw3ZiH77Dwy8G1ua5fOhCkoZ34SEWdkB3q93ERs6MxWio0c2rTZCyZLCGR
 WICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fki2MDlr3+q/tA363Zpv6iDH7bhv7YszMbA19cxnvz0=;
 b=QxHNjJmzqTinvFZ/pon/1Otu8nHp62l2Wf5WzDbz9GMY1P7p3n9gV3NgShZzeVC4n+
 0KaiV1C+171iRowh8TtLjNR/XBlyoYPEQ9mz7iO4x62WxWZJFHYdHuIVk8N+zob/MHzW
 obr6dcFDWcYbPesbe3TkULmYRsvUD9qaWC6cqaaJJgcfOM3dEvaDpm0umTDyqAKkAx5T
 RtEHNIyIjs3ma860PBj0Lpppym9q/MKo/RLL6Op0KcqBB7PH8/VHmpGJDf362kM3+5Za
 OT/AqXDj3QFA4l+LBKPwSS5bwA1Pd0SqpSf4q4AqTq6YDkeX36HM24NzGaTVc9Q1txII
 nEdQ==
X-Gm-Message-State: AOAM533/0JSOK3uJD+TMANKA/Kr6ASV3dTfiOMbG0pG/GE/6vbkhZfub
 q8ACPQBZPBTiXob/9Lo3Ocw=
X-Google-Smtp-Source: ABdhPJwZXmAmqCBVdwlwDbgwlvzzNxVRHCRWln1yR8V6MzYpJuouoTSNoHkXn7viYn+5WQwfxFLjDg==
X-Received: by 2002:ac8:7151:: with SMTP id h17mr1660399qtp.205.1619075311623; 
 Thu, 22 Apr 2021 00:08:31 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 ([177.35.200.187])
 by smtp.gmail.com with ESMTPSA id w67sm1658329qkc.79.2021.04.22.00.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 00:08:31 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v3 07/11] powerpc/pseries/iommu: Reorganize
 iommu_table_setparms*() with new helper
Date: Thu, 22 Apr 2021 04:07:19 -0300
Message-Id: <20210422070721.463912-8-leobras.c@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210422070721.463912-1-leobras.c@gmail.com>
References: <20210422070721.463912-1-leobras.c@gmail.com>
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
index 48c029386d94..0147ccaf0be4 100644
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

