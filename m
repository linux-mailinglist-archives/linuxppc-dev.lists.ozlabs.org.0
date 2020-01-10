Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B90BE136800
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 08:12:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vDgw1ph8zDq9H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 18:12:12 +1100 (AEDT)
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
 header.s=20161025 header.b=r8poHMoD; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vDSm2r6yzDqcn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 18:02:32 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id x185so672899pfc.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2020 23:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=45vF0P65MfxFIvdSNjBo7RP7akNxs0weK17UELHPqUY=;
 b=r8poHMoD3qKM8mNB28MvzVNXNb04jseuMC4mUx9YhM59NzgX9qgOPQI7uG9qay4I1q
 N/O+KaL/3W6x9mHf9cLAdvKfvZaV7cpnUtxb2bpPYAyOCdnAgkgtuSXgNgdTcAZQbqZA
 sY8m524BOr0sep9JJnyJXAvYWCK8XEsbB/kMC17Hnn0+HIdUJy0XM1uxFNjMzaMA2cTi
 GocYe1wbepschDBXHfs/WzCl94JqdngeWOizlndef5wvBQM1Ex/MVfF1qi7Yk+qJtPIG
 e04YoeCe5nI9DoqznYUSWouETutT8IDwf9ba2++BQNlJdZH9+4ETNJO3vaRaFsdXpc7T
 9l6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=45vF0P65MfxFIvdSNjBo7RP7akNxs0weK17UELHPqUY=;
 b=m3JXEPRhVc3lM9QTeFSZ3qRFkaNGJbsT1aczCTMBmDAKkQn1BjYRJTvW53rDWxuRL8
 AlPyemkWaVkmSdTCavrrNdFZfS4sWyJyGwLn8FIcE/NryVYWNZvVTxe4tXQaSl4iz2Pd
 WSWuji9d4FI8ikqAlDdi5rXXBrp1/Zctv4TiOaTu7G3tmAr2f5ECxpah3Uz3JhZdxdJ1
 ij6uIKwJHXc21Dy7KUDs7SwyphAdERONVZV3z+tGStJzpiuJRwoePc5iliGIat++sJbZ
 5zY1ooTJ8Si8k6NPv5lFE+0WN1KTzSxIywRvnOgUeB7AdpwJvovzG3oK2KsJMNL8Bh1H
 sAog==
X-Gm-Message-State: APjAAAU9zZG76ewTuJ9ZLkKPor5MwLIJz8dcV4ae+Wo2uofyZZmEhZA+
 hwHDrSfDs04Z7gSnGQglQFbIS4qVBs0=
X-Google-Smtp-Source: APXvYqxeiBNRLtqz+uDIyg+0MqvxSYSFB/Isb5wfTO4I5MNZgL9uJ2JoBbM8UBr19MtXLI0NCtpzzQ==
X-Received: by 2002:aa7:864f:: with SMTP id a15mr2379932pfo.136.1578639750565; 
 Thu, 09 Jan 2020 23:02:30 -0800 (PST)
Received: from localhost.localdomain (ohallo2.lnk.telstra.net.
 [110.142.13.149])
 by smtp.gmail.com with ESMTPSA id n26sm1309791pgd.46.2020.01.09.23.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 23:02:30 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] powernv/pci: Fold pnv_pci_dma_dev_setup() into the
 pci-ioda.c version
Date: Fri, 10 Jan 2020 18:02:06 +1100
Message-Id: <20200110070207.439-5-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200110070207.439-1-oohall@gmail.com>
References: <20200110070207.439-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pnv_pci_dma_dev_setup() does nothing but call the phb->dma_dev_setup()
callback, if one exists. That callback is only set for normal PCIe PHBs so
we can remove the layer of indirection and use the ioda version in
the pci_controller_ops.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 7 ++++---
 arch/powerpc/platforms/powernv/pci.c      | 9 ---------
 arch/powerpc/platforms/powernv/pci.h      | 2 --
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index ae177ee..e2a9440 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1743,8 +1743,10 @@ int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 }
 #endif /* CONFIG_PCI_IOV */
 
-static void pnv_pci_ioda_dma_dev_setup(struct pnv_phb *phb, struct pci_dev *pdev)
+static void pnv_pci_ioda_dma_dev_setup(struct pci_dev *pdev)
 {
+	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
+	struct pnv_phb *phb = hose->private_data;
 	struct pci_dn *pdn = pci_get_pdn(pdev);
 	struct pnv_ioda_pe *pe;
 
@@ -3627,7 +3629,7 @@ static void pnv_pci_ioda_shutdown(struct pci_controller *hose)
 }
 
 static const struct pci_controller_ops pnv_pci_ioda_controller_ops = {
-	.dma_dev_setup		= pnv_pci_dma_dev_setup,
+	.dma_dev_setup		= pnv_pci_ioda_dma_dev_setup,
 	.dma_bus_setup		= pnv_pci_dma_bus_setup,
 	.iommu_bypass_supported	= pnv_pci_ioda_iommu_bypass_supported,
 	.setup_msi_irqs		= pnv_setup_msi_irqs,
@@ -3886,7 +3888,6 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 		hose->controller_ops = pnv_npu_ocapi_ioda_controller_ops;
 		break;
 	default:
-		phb->dma_dev_setup = pnv_pci_ioda_dma_dev_setup;
 		hose->controller_ops = pnv_pci_ioda_controller_ops;
 	}
 
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 8307e1f..31f1949 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -810,15 +810,6 @@ struct iommu_table *pnv_pci_table_alloc(int nid)
 	return tbl;
 }
 
-void pnv_pci_dma_dev_setup(struct pci_dev *pdev)
-{
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
-
-	if (phb && phb->dma_dev_setup)
-		phb->dma_dev_setup(phb, pdev);
-}
-
 void pnv_pci_dma_bus_setup(struct pci_bus *bus)
 {
 	struct pci_controller *hose = bus->sysdata;
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index f914f0b..0cdc9ba 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -108,7 +108,6 @@ struct pnv_phb {
 	int (*msi_setup)(struct pnv_phb *phb, struct pci_dev *dev,
 			 unsigned int hwirq, unsigned int virq,
 			 unsigned int is_64, struct msi_msg *msg);
-	void (*dma_dev_setup)(struct pnv_phb *phb, struct pci_dev *pdev);
 	int (*init_m64)(struct pnv_phb *phb);
 	int (*get_pe_state)(struct pnv_phb *phb, int pe_no);
 	void (*freeze_pe)(struct pnv_phb *phb, int pe_no);
@@ -189,7 +188,6 @@ extern void pnv_npu2_map_lpar(struct pnv_ioda_pe *gpe, unsigned long msr);
 extern void pnv_pci_reset_secondary_bus(struct pci_dev *dev);
 extern int pnv_eeh_phb_reset(struct pci_controller *hose, int option);
 
-extern void pnv_pci_dma_dev_setup(struct pci_dev *pdev);
 extern void pnv_pci_dma_bus_setup(struct pci_bus *bus);
 extern int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type);
 extern void pnv_teardown_msi_irqs(struct pci_dev *pdev);
-- 
2.9.5

