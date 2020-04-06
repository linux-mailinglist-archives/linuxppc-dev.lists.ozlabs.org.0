Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB09419EF8E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 05:22:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wbSx57VTzDqV4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 13:22:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=T9tdbGUH; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wb8G6NDTzDqyY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 13:08:14 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id a24so6860166pfc.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 20:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qsH7aJrSal8DIcZALuLdhqqrav9t+exVZUNpJEdGLyQ=;
 b=T9tdbGUHPExpWI9rnoUqHfOeIpChiiXJMMMjIPfDLPMU7iouYkWCsrMqDtjJjauuG9
 IlJii01XkK2LdfFNBA3nWLvh1DNGAXCJqCdXMJnR/06XKs1J/O9p8w1Qj4IXDS0iVU4E
 f4TmJDRUf0ko82ii2Ri/bjXLHrXoPewknytLIBGeaEwLPdzMZsZCeTmQSrgAda8k6Cbi
 2JsuhIPHFocVxVlTBB2kxwmBIfG5DQ5nrW8HfeNRZP72oBgydoSrMI1sifmMdyu6NvfH
 psazX+o3cJ4mPJufH6kvS+emoWuDlDwNqgt1AGsxvXiX6Y+u6QUMSqRcdvyYO7D0Td79
 Oq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qsH7aJrSal8DIcZALuLdhqqrav9t+exVZUNpJEdGLyQ=;
 b=fIjXnppbA9dA4SLS9epcH1XPBTBvDbj9iyD07JTCelBJj02wpxXuTl71PUba4aY6Kl
 krzUEXKFAeED0up9kov+Qg06ShVBQu95/skRD2eJUklGE8KuQ351kPgWdfG1T6Uot0Di
 7KTeNyqxGhQO+6DrlRUd0xP2hLx8j5XFlq4yRG1ChhiDA0G70aPkZv50d3t97A4cZGJD
 GdUHpVbLrHVgLAOUiJFhXl6MRP9aux+dPpdpae/ezX3YIrCFNBm1ZQxGX/XcyqP4Wx1Z
 2IxIgepMl5aiNl4x8L2askhnMoEos9Qe35MgpV5bZlwuFGmwg/pWgJ2J4qEREPurhlg9
 NQZg==
X-Gm-Message-State: AGi0PubK0nk7rGqtf8oJ3ZNJnE7QhsbnkB5gakB7LScbw7y+Kqu/4Nrq
 vtOvVQZQoK2Jc0kC6tf48GzPNWOp
X-Google-Smtp-Source: APiQypI5B+Sblg4u4mjcC7BVA3XGjGj0b5ZXTmQ7sa8uAVEMUrxvm8i+JsdVk+VmBgfHJOnAf/vfcw==
X-Received: by 2002:aa7:931a:: with SMTP id 26mr18826095pfj.11.1586142492515; 
 Sun, 05 Apr 2020 20:08:12 -0700 (PDT)
Received: from localhost.ibm.com ([220.240.58.168])
 by smtp.gmail.com with ESMTPSA id e187sm10196443pfe.143.2020.04.05.20.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 20:08:12 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 7/7] powerpc/powernv/npu: Move IOMMU group setup into npu-dma.c
Date: Mon,  6 Apr 2020 13:07:45 +1000
Message-Id: <20200406030745.24595-8-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406030745.24595-1-oohall@gmail.com>
References: <20200406030745.24595-1-oohall@gmail.com>
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
Cc: aik@ozlabs.ru, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The NVlink IOMMU group setup is only relevant to NVLink devices so move
it into the NPU containment zone. This let us remove some prototypes in
pci.h and staticfy some function definitions.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/npu-dma.c  | 54 +++++++++++++++++++-
 arch/powerpc/platforms/powernv/pci-ioda.c | 60 +++--------------------
 arch/powerpc/platforms/powernv/pci.h      |  6 +--
 3 files changed, 60 insertions(+), 60 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index df27b8d7e78f..abeaa533b976 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -15,6 +15,7 @@
 
 #include <asm/debugfs.h>
 #include <asm/powernv.h>
+#include <asm/ppc-pci.h>
 #include <asm/opal.h>
 
 #include "pci.h"
@@ -425,7 +426,8 @@ static void pnv_comp_attach_table_group(struct npu_comp *npucomp,
 	++npucomp->pe_num;
 }
 
-struct iommu_table_group *pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
+static struct iommu_table_group *
+	pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
 {
 	struct iommu_table_group *compound_group;
 	struct npu_comp *npucomp;
@@ -491,7 +493,7 @@ struct iommu_table_group *pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
 	return compound_group;
 }
 
-struct iommu_table_group *pnv_npu_compound_attach(struct pnv_ioda_pe *pe)
+static struct iommu_table_group *pnv_npu_compound_attach(struct pnv_ioda_pe *pe)
 {
 	struct iommu_table_group *table_group;
 	struct npu_comp *npucomp;
@@ -534,6 +536,54 @@ struct iommu_table_group *pnv_npu_compound_attach(struct pnv_ioda_pe *pe)
 
 	return table_group;
 }
+
+void pnv_pci_npu_setup_iommu_groups(void)
+{
+	struct pci_controller *hose;
+	struct pnv_phb *phb;
+	struct pnv_ioda_pe *pe;
+
+	/*
+	 * For non-nvlink devices the IOMMU group is registered when the PE is
+	 * configured and devices are added to the group when the per-device
+	 * DMA setup is run. That's done in hose->ops.dma_dev_setup() which is
+	 * only initialise for "normal" IODA PHBs.
+	 *
+	 * For NVLink devices we need to ensure the NVLinks and the GPU end up
+	 * in the same IOMMU group, so that's handled here.
+	 */
+	list_for_each_entry(hose, &hose_list, list_node) {
+		phb = hose->private_data;
+
+		if (phb->type == PNV_PHB_IODA2)
+			list_for_each_entry(pe, &phb->ioda.pe_list, list)
+				pnv_try_setup_npu_table_group(pe);
+	}
+
+	/*
+	 * Now we have all PHBs discovered, time to add NPU devices to
+	 * the corresponding IOMMU groups.
+	 */
+	list_for_each_entry(hose, &hose_list, list_node) {
+		unsigned long  pgsizes;
+
+		phb = hose->private_data;
+
+		if (phb->type != PNV_PHB_NPU_NVLINK)
+			continue;
+
+		pgsizes = pnv_ioda_parse_tce_sizes(phb);
+		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
+			/*
+			 * IODA2 bridges get this set up from
+			 * pci_controller_ops::setup_bridge but NPU bridges
+			 * do not have this hook defined so we do it here.
+			 */
+			pe->table_group.pgsizes = pgsizes;
+			pnv_npu_compound_attach(pe);
+		}
+	}
+}
 #endif /* CONFIG_IOMMU_API */
 
 int pnv_npu2_init(struct pci_controller *hose)
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index c020ade3a846..dba0c2c09f61 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1288,7 +1288,7 @@ static void pnv_ioda_setup_npu_PEs(struct pci_bus *bus)
 		pnv_ioda_setup_npu_PE(pdev);
 }
 
-static void pnv_pci_ioda_setup_PEs(void)
+static void pnv_pci_ioda_setup_nvlink(void)
 {
 	struct pci_controller *hose;
 	struct pnv_phb *phb;
@@ -1312,6 +1312,11 @@ static void pnv_pci_ioda_setup_PEs(void)
 		list_for_each_entry(pe, &phb->ioda.pe_list, list)
 			pnv_npu2_map_lpar(pe, MSR_DR | MSR_PR | MSR_HV);
 	}
+
+#ifdef CONFIG_IOMMU_API
+	/* setup iommu groups so we can do nvlink pass-thru */
+	pnv_pci_npu_setup_iommu_groups();
+#endif
 }
 
 #ifdef CONFIG_PCI_IOV
@@ -2584,56 +2589,6 @@ static struct iommu_table_group_ops pnv_pci_ioda2_ops = {
 	.take_ownership = pnv_ioda2_take_ownership,
 	.release_ownership = pnv_ioda2_release_ownership,
 };
-
-static void pnv_pci_ioda_setup_iommu_api(void)
-{
-	struct pci_controller *hose;
-	struct pnv_phb *phb;
-	struct pnv_ioda_pe *pe;
-
-	/*
-	 * For non-nvlink devices the IOMMU group is registered when the PE is
-	 * configured and devices are added to the group when the per-device
-	 * DMA setup is run. That's done in hose->ops.dma_dev_setup() which is
-	 * only initialise for "normal" IODA PHBs.
-	 *
-	 * For NVLink devices we need to ensure the NVLinks and the GPU end up
-	 * in the same IOMMU group, so that's handled here.
-	 */
-	list_for_each_entry(hose, &hose_list, list_node) {
-		phb = hose->private_data;
-
-		if (phb->type == PNV_PHB_IODA2)
-			list_for_each_entry(pe, &phb->ioda.pe_list, list)
-				pnv_try_setup_npu_table_group(pe);
-	}
-
-	/*
-	 * Now we have all PHBs discovered, time to add NPU devices to
-	 * the corresponding IOMMU groups.
-	 */
-	list_for_each_entry(hose, &hose_list, list_node) {
-		unsigned long  pgsizes;
-
-		phb = hose->private_data;
-
-		if (phb->type != PNV_PHB_NPU_NVLINK)
-			continue;
-
-		pgsizes = pnv_ioda_parse_tce_sizes(phb);
-		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
-			/*
-			 * IODA2 bridges get this set up from
-			 * pci_controller_ops::setup_bridge but NPU bridges
-			 * do not have this hook defined so we do it here.
-			 */
-			pe->table_group.pgsizes = pgsizes;
-			pnv_npu_compound_attach(pe);
-		}
-	}
-}
-#else /* !CONFIG_IOMMU_API */
-static void pnv_pci_ioda_setup_iommu_api(void) { };
 #endif
 
 static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
@@ -3132,8 +3087,7 @@ static void pnv_pci_enable_bridges(void)
 
 static void pnv_pci_ioda_fixup(void)
 {
-	pnv_pci_ioda_setup_PEs();
-	pnv_pci_ioda_setup_iommu_api();
+	pnv_pci_ioda_setup_nvlink();
 	pnv_pci_ioda_create_dbgfs();
 
 	pnv_pci_enable_bridges();
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 0c5845a1f05d..20941ef2706e 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -209,11 +209,7 @@ extern void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
 /* Nvlink functions */
 extern void pnv_npu_try_dma_set_bypass(struct pci_dev *gpdev, bool bypass);
 extern void pnv_pci_ioda2_tce_invalidate_entire(struct pnv_phb *phb, bool rm);
-extern struct pnv_ioda_pe *pnv_pci_npu_setup_iommu(struct pnv_ioda_pe *npe);
-extern struct iommu_table_group *pnv_try_setup_npu_table_group(
-		struct pnv_ioda_pe *pe);
-extern struct iommu_table_group *pnv_npu_compound_attach(
-		struct pnv_ioda_pe *pe);
+extern void pnv_pci_npu_setup_iommu_groups(void);
 
 /* pci-ioda-tce.c */
 #define POWERNV_IOMMU_DEFAULT_LEVELS	2
-- 
2.21.1

