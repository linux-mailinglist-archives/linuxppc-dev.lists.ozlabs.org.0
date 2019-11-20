Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E38103138
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 02:39:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hlj84npXzDqk9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 12:39:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iHp4LB9X"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlTw3xttzDqhK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:24 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id az9so12969128plb.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mVqo0CGU6Z3xgYplniDE2dPptC9Wqdx9FY58xLMeabQ=;
 b=iHp4LB9XyMeUyKJY0NK/kcfLyGLmigin5Yy2uW9GHxCrfpoGdCxcUKFaU7KIDVTYAB
 AbhOFnK9/2rWaQxo8PXDMlXS57Gx4z/cV2LNBxdcV0sBClQU14hpp+/EI/uFqn2Ih41y
 8YIfK4eyOH4oYb7EIqASkPau2hUG0I2vYCxJqZanAkHLivR1+sLJYExeo4EnxOE1FfJF
 TUDRkhgHY/6CownVTufCjsDMOc8RVQlcLidFwns6ASogshayak75ZYjDbz1NU2MQneVm
 8EvKV1fTGo14xVK+PvqY6VhsWPDtEca7a/BX7h4hQo3CyGVYEilFLwLY7VgvdDGMsYtw
 5SIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mVqo0CGU6Z3xgYplniDE2dPptC9Wqdx9FY58xLMeabQ=;
 b=IzokEY5tdjQ2C1eoh01XNEZ0COaacpAQMsnD3p6ZEdcqXDR1yeFVM3WQqagSciiZmt
 +1dwtLoOgVxDuS1vrVBq9rZqXBTJna/uU/gX5mRWAIvE3ba9Gyy0o8vxCOdPXcl4oDKs
 PrT6SC5Rje+TABCjXYv4kNK8jvPeOw1gqInAroKke9FmVZmkVNfzqzPsio3mvaZsBsWw
 164cA/h0G+A2shyJ8UBWeeNu96vaz91zkiPnt1Yp7SqvbZGZR3bKRIMNAA+KRLd+A6dh
 6L2lMnG4DbE8YPsTe/18PagnWSsf7/XijXrKFYp1tCOdliQZ1oKfZ1pgsqwmKEdsreiP
 gd2w==
X-Gm-Message-State: APjAAAUuIOnsvmxiYRwRB2EyxAQ9YIohN1WqOSZShtg1MRv7LPC25xbK
 iX1osjIKkxz9NX78g/8bXlTlltlc
X-Google-Smtp-Source: APXvYqyTI56ZlxdmMo8E6a/pf/kGdmsXipEu5Ii2r4uhurAnbZAkMNiCzeuId9+SYjW4J+VDsK4gYg==
X-Received: by 2002:a17:90b:318:: with SMTP id
 ay24mr653466pjb.25.1574213361428; 
 Tue, 19 Nov 2019 17:29:21 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:21 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 04/46] powernv/pci: Move dma_{dev|bus}_setup into pci-ioda.c
Date: Wed, 20 Nov 2019 12:28:17 +1100
Message-Id: <20191120012859.23300-5-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120012859.23300-1-oohall@gmail.com>
References: <20191120012859.23300-1-oohall@gmail.com>
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
Cc: alistair@popple.id.au, Oliver O'Halloran <oohall@gmail.com>,
 s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These functions are only used from pci-ioda.c. Move them in there and remove
the prototypes from the header files.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 43 +++++++++++++++++++++++
 arch/powerpc/platforms/powernv/pci.c      | 43 -----------------------
 arch/powerpc/platforms/powernv/pci.h      |  2 --
 3 files changed, 43 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 099c0bb1a9b9..c2b3a5a13004 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3637,6 +3637,49 @@ static void pnv_pci_ioda_shutdown(struct pci_controller *hose)
 		       OPAL_ASSERT_RESET);
 }
 
+void pnv_pci_dma_dev_setup(struct pci_dev *pdev)
+{
+	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
+	struct pnv_phb *phb = hose->private_data;
+#ifdef CONFIG_PCI_IOV
+	struct pnv_ioda_pe *pe;
+
+	/* Fix the VF pdn PE number */
+	if (pdev->is_virtfn) {
+		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
+			if (pe->rid == ((pdev->bus->number << 8) |
+			    (pdev->devfn & 0xff))) {
+				pe->pdev = pdev;
+				break;
+			}
+		}
+	}
+#endif /* CONFIG_PCI_IOV */
+
+	if (phb && phb->dma_dev_setup)
+		phb->dma_dev_setup(phb, pdev);
+}
+
+void pnv_pci_dma_bus_setup(struct pci_bus *bus)
+{
+	struct pci_controller *hose = bus->sysdata;
+	struct pnv_phb *phb = hose->private_data;
+	struct pnv_ioda_pe *pe;
+
+	list_for_each_entry(pe, &phb->ioda.pe_list, list) {
+		if (!(pe->flags & (PNV_IODA_PE_BUS | PNV_IODA_PE_BUS_ALL)))
+			continue;
+
+		if (!pe->pbus)
+			continue;
+
+		if (bus->number == ((pe->rid >> 8) & 0xFF)) {
+			pe->pbus = bus;
+			break;
+		}
+	}
+}
+
 static const struct pci_controller_ops pnv_pci_ioda_controller_ops = {
 	.dma_dev_setup		= pnv_pci_dma_dev_setup,
 	.dma_bus_setup		= pnv_pci_dma_bus_setup,
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index b7761e2e06f8..8b9058b52575 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -810,49 +810,6 @@ struct iommu_table *pnv_pci_table_alloc(int nid)
 	return tbl;
 }
 
-void pnv_pci_dma_dev_setup(struct pci_dev *pdev)
-{
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
-#ifdef CONFIG_PCI_IOV
-	struct pnv_ioda_pe *pe;
-
-	/* Fix the VF pdn PE number */
-	if (pdev->is_virtfn) {
-		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
-			if (pe->rid == ((pdev->bus->number << 8) |
-			    (pdev->devfn & 0xff))) {
-				pe->pdev = pdev;
-				break;
-			}
-		}
-	}
-#endif /* CONFIG_PCI_IOV */
-
-	if (phb && phb->dma_dev_setup)
-		phb->dma_dev_setup(phb, pdev);
-}
-
-void pnv_pci_dma_bus_setup(struct pci_bus *bus)
-{
-	struct pci_controller *hose = bus->sysdata;
-	struct pnv_phb *phb = hose->private_data;
-	struct pnv_ioda_pe *pe;
-
-	list_for_each_entry(pe, &phb->ioda.pe_list, list) {
-		if (!(pe->flags & (PNV_IODA_PE_BUS | PNV_IODA_PE_BUS_ALL)))
-			continue;
-
-		if (!pe->pbus)
-			continue;
-
-		if (bus->number == ((pe->rid >> 8) & 0xFF)) {
-			pe->pbus = bus;
-			break;
-		}
-	}
-}
-
 struct device_node *pnv_pci_get_phb_node(struct pci_dev *dev)
 {
 	struct pci_controller *hose = pci_bus_to_host(dev->bus);
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 01a01739c03e..f23145575048 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -189,8 +189,6 @@ extern void pnv_npu2_map_lpar(struct pnv_ioda_pe *gpe, unsigned long msr);
 extern void pnv_pci_reset_secondary_bus(struct pci_dev *dev);
 extern int pnv_eeh_phb_reset(struct pci_controller *hose, int option);
 
-extern void pnv_pci_dma_dev_setup(struct pci_dev *pdev);
-extern void pnv_pci_dma_bus_setup(struct pci_bus *bus);
 extern int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type);
 extern void pnv_teardown_msi_irqs(struct pci_dev *pdev);
 extern struct pnv_ioda_pe *__pnv_ioda_get_pe(struct pnv_phb *phb, u16 bdfn);
-- 
2.21.0

