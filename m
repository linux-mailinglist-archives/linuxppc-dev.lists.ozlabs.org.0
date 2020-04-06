Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5A419EF81
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 05:15:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wbJ30qPVzDqc2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 13:14:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=E1WBMqq2; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wb863QZTzDqs8
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 13:08:06 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id h11so5352130plk.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 20:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/2U1L+9cXdkR26EmfncTrE92ev3YRrO0GcoYnEHEViA=;
 b=E1WBMqq2ObKpWAKY8VjNyY7SeylEdX5N0a8dMFXva/+wJsgAYP8jWa3ZCyxz36WgBa
 UH1CD4OrimFrH02b4xVyCKs4WEbiVy1LpYTJBrGlebpuuFn77MQEB5g2Z71O0umGUeXj
 yCzAhVIVrRm25B4AV4VenOXMhaPncaGAgZbzA8bSJuzCNQ16mFNioeFAK+54Q1aGrpqJ
 3mKrxDiZNw4ndUhQYsgbixgGISrKYFJCpI0GHr7FJcf4/DrM7QWPM0qaJAQ+z6ypfcfJ
 zQpcymkFC7QBSroZlrNRXFIqjyJvDryHE7L+VcJd08Pk51DMzQiYCHLHvKjMngcY2QdE
 U6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/2U1L+9cXdkR26EmfncTrE92ev3YRrO0GcoYnEHEViA=;
 b=WoGEcrBHc2MKdDSMZWagI1UzN3lByj3VH73N6fCrn/W2VfqaBfYg2kzdWqx6gIoto8
 sdxQ7Kr5BfoKYzt2LcdpQd5xxpJc4EiQmZxpmOevTCXAhFJSAaQHyE3aRoF0QU8BFnYw
 Al+/S5utvsthSEVyRKpttYDgyzYFuiYTazzaYAyjSpL1p4ZPSZTbI19jf7/oJ09D0E1c
 uuWGsnWOW4d8CYRd0Za32c1CWz58G/mVHWj8phlJ4jVMq0tlTwPFB2TjqcgHRmQKSYSG
 1o+yNOU5u79kHLatNaFe623B7QyxtiNE0YQsdy3eUjewBbdjUo/qIKAH/Mqouy/qZdTb
 PjyQ==
X-Gm-Message-State: AGi0PuaSiG/csN+UvZPIbTAyKnhYey7dWcSw143ERCdLwH5tcrLZZJO0
 kGPk0ryVp0N2uxCK/OP54bROFIl6
X-Google-Smtp-Source: APiQypJfrirtpgvAwsXPv29+0lYP72B445MFaiebX2msheDRSh2GroZrhtjDtikG+8t10X62cSPLvg==
X-Received: by 2002:a17:90a:252b:: with SMTP id
 j40mr23891047pje.189.1586142484070; 
 Sun, 05 Apr 2020 20:08:04 -0700 (PDT)
Received: from localhost.ibm.com ([220.240.58.168])
 by smtp.gmail.com with ESMTPSA id e187sm10196443pfe.143.2020.04.05.20.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 20:08:03 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/7] powerpc/powernv/pci: Register iommu group at PE DMA setup
Date: Mon,  6 Apr 2020 13:07:41 +1000
Message-Id: <20200406030745.24595-4-oohall@gmail.com>
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
Cc: aik@ozlabs.ru, Reza Arbab <arbab@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the registration of IOMMU groups out of the post-phb init fixup and
into when we configure DMA for a PE. For most devices this doesn't
result in any functional changes, but for NVLink attached GPUs it
requires a bit of care. When the GPU is probed an IOMMU group would be
created for the PE that contains it. We need to ensure that group is
removed before we add the PE to the compound group that's used to keep
the translations see by the PCIe and NVLink buses the same.

No functional changes. Probably.

Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: Reza Arbab <arbab@linux.ibm.com>
Cc: Alistair Popple <alistair@popple.id.au>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/npu-dma.c  |  9 +++++++++
 arch/powerpc/platforms/powernv/pci-ioda.c | 16 ++++++----------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index de617549c9a3..4fbbdfa8b327 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -469,6 +469,15 @@ struct iommu_table_group *pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
 			compound_group->pgsizes = pe->table_group.pgsizes;
 	}
 
+       /*
+	* I'm not sure this is strictly required, but it's probably a good idea
+	* since the table_group for the PE is going to be attached to the
+	* compound table group. If we leave the PE's iommu group active then
+	* we might have the same table_group being modifiable via two sepeate
+	* iommu groups.
+	*/
+	iommu_group_put(pe->table_group.group);
+
 	pnv_comp_attach_table_group(npucomp, pe);
 
 	return compound_group;
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 2c340504fa77..cf0aaef1b8fa 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1619,10 +1619,6 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 		}
 
 		pnv_pci_ioda2_setup_dma_pe(phb, pe);
-#ifdef CONFIG_IOMMU_API
-		iommu_register_group(&pe->table_group,
-				pe->phb->hose->global_number, pe->pe_number);
-#endif
 	}
 }
 
@@ -2661,9 +2657,6 @@ static void pnv_pci_ioda_setup_iommu_api(void)
 					continue;
 
 				table_group = &pe->table_group;
-				iommu_register_group(&pe->table_group,
-						pe->phb->hose->global_number,
-						pe->pe_number);
 			}
 			pnv_ioda_setup_bus_iommu_group(pe, table_group,
 					pe->pbus);
@@ -2748,14 +2741,17 @@ static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
 			IOMMU_TABLE_GROUP_MAX_TABLES;
 	pe->table_group.max_levels = POWERNV_IOMMU_MAX_LEVELS;
 	pe->table_group.pgsizes = pnv_ioda_parse_tce_sizes(phb);
-#ifdef CONFIG_IOMMU_API
-	pe->table_group.ops = &pnv_pci_ioda2_ops;
-#endif
 
 	rc = pnv_pci_ioda2_setup_default_config(pe);
 	if (rc)
 		return;
 
+#ifdef CONFIG_IOMMU_API
+	pe->table_group.ops = &pnv_pci_ioda2_ops;
+	iommu_register_group(&pe->table_group, phb->hose->global_number,
+			     pe->pe_number);
+#endif
+
 	if (pe->flags & (PNV_IODA_PE_BUS | PNV_IODA_PE_BUS_ALL))
 		pnv_ioda_setup_bus_dma(pe, pe->pbus);
 }
-- 
2.21.1

