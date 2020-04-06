Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1920719EF8A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 05:20:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wbQF6D6KzDqf9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 13:20:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vCUcGFR3; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wb8D66mLzDqyf
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 13:08:12 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id m17so863122pgj.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 20:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dRKEPz/4c46HfuES64p+ymOUxqjx+AUHuT3l6IEr04E=;
 b=vCUcGFR3grNwCDAwYDSN4WTftm8O1BLTXkstr8mBwjc2tzMr76ou+72BGntLY2q3iD
 Ez11Cx7OSt4UAC1eu0s2Ao/tEcdhWilMO8ITKeV+lAWeYGg/5oVMV/PyakNkHl8xADIN
 +SMpeaenzeueCtnT/iblu/zBUgKbalE/kSs1pEsWatl1EYjpTlmQSB9aYu6XKR2lUreB
 zTtWpNqT5S929fqqc20a2yG7L67pM2O91YtI3+QP5CpQYJdx9pJTqst7TFJWKJdlvCpy
 udW0D8DLRKnSIA7qFs5BdwuOBEElnh6slYiAZqqyjeL0ivs8dhv8/A1F5AqiaI36B0GN
 2GBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dRKEPz/4c46HfuES64p+ymOUxqjx+AUHuT3l6IEr04E=;
 b=RGi+cbEtnPHgSR/Q/5K1jJQFI4oH+M+mmmNyeDEeXXwUjrqOn2HIqpueSb+MN9m8kH
 9C08xIi04/XHeijWxgdmHjLRnIiPXOX6Bf+dXcHbQjRzFITSRhhDV2EwHOUgkzZPqeFl
 +RYTIl4xxBZCrSgx9+ZuBRGm6WNz7c7l1DMHwUJK2vWRw19AUbkyJ9mqx3QvFdZ8FBPk
 qgqOPvgzAESv839rkor72I2+ca6bugIStihL1GpnUyqt7Sx+VxVwGhyup4acHWRruCHr
 gqC7jWpGyyGmFvmusa00M1xZGfv7MDbRBx+bt73gMTRKs6H7NC8fwAQ5Kp9UbVpJ7C5v
 z4LA==
X-Gm-Message-State: AGi0PuYl6pGRlp0yvfjOtmqMW5R3aMaWsMcWSXn3lmMfM8H2QUX8a1RP
 wErCUTvgb6pRW/obeziSVv94it4U
X-Google-Smtp-Source: APiQypI9YjfJ/I5o83tcU7DgubIQcIZHzNR/2Zj7RFCVjkYv+m3OwaTmnSwa0Sj91kWSL7VDOVyaPg==
X-Received: by 2002:aa7:9e42:: with SMTP id z2mr19118817pfq.109.1586142490448; 
 Sun, 05 Apr 2020 20:08:10 -0700 (PDT)
Received: from localhost.ibm.com ([220.240.58.168])
 by smtp.gmail.com with ESMTPSA id e187sm10196443pfe.143.2020.04.05.20.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 20:08:10 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/7] powerpc/powernv/pci: Move tce size parsing to
 pci-ioda-tce.c
Date: Mon,  6 Apr 2020 13:07:44 +1000
Message-Id: <20200406030745.24595-7-oohall@gmail.com>
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

Move it in with the rest of the TCE wrangling rather than carting around
a static prototype in pci-ioda.c

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda-tce.c | 28 +++++++++++++++++
 arch/powerpc/platforms/powernv/pci-ioda.c     | 30 -------------------
 arch/powerpc/platforms/powernv/pci.h          |  2 ++
 3 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda-tce.c b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
index 5dc6847d5f4c..f923359d8afc 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda-tce.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
@@ -17,6 +17,34 @@
 #include <asm/tce.h>
 #include "pci.h"
 
+unsigned long pnv_ioda_parse_tce_sizes(struct pnv_phb *phb)
+{
+	struct pci_controller *hose = phb->hose;
+	struct device_node *dn = hose->dn;
+	unsigned long mask = 0;
+	int i, rc, count;
+	u32 val;
+
+	count = of_property_count_u32_elems(dn, "ibm,supported-tce-sizes");
+	if (count <= 0) {
+		mask = SZ_4K | SZ_64K;
+		/* Add 16M for POWER8 by default */
+		if (cpu_has_feature(CPU_FTR_ARCH_207S) &&
+				!cpu_has_feature(CPU_FTR_ARCH_300))
+			mask |= SZ_16M | SZ_256M;
+		return mask;
+	}
+
+	for (i = 0; i < count; i++) {
+		rc = of_property_read_u32_index(dn, "ibm,supported-tce-sizes",
+						i, &val);
+		if (rc == 0)
+			mask |= 1ULL << val;
+	}
+
+	return mask;
+}
+
 void pnv_pci_setup_iommu_table(struct iommu_table *tbl,
 		void *tce_mem, u64 tce_size,
 		u64 dma_offset, unsigned int page_shift)
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 8b45b8e561e9..c020ade3a846 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2585,8 +2585,6 @@ static struct iommu_table_group_ops pnv_pci_ioda2_ops = {
 	.release_ownership = pnv_ioda2_release_ownership,
 };
 
-static unsigned long pnv_ioda_parse_tce_sizes(struct pnv_phb *phb);
-
 static void pnv_pci_ioda_setup_iommu_api(void)
 {
 	struct pci_controller *hose;
@@ -2638,34 +2636,6 @@ static void pnv_pci_ioda_setup_iommu_api(void)
 static void pnv_pci_ioda_setup_iommu_api(void) { };
 #endif
 
-static unsigned long pnv_ioda_parse_tce_sizes(struct pnv_phb *phb)
-{
-	struct pci_controller *hose = phb->hose;
-	struct device_node *dn = hose->dn;
-	unsigned long mask = 0;
-	int i, rc, count;
-	u32 val;
-
-	count = of_property_count_u32_elems(dn, "ibm,supported-tce-sizes");
-	if (count <= 0) {
-		mask = SZ_4K | SZ_64K;
-		/* Add 16M for POWER8 by default */
-		if (cpu_has_feature(CPU_FTR_ARCH_207S) &&
-				!cpu_has_feature(CPU_FTR_ARCH_300))
-			mask |= SZ_16M | SZ_256M;
-		return mask;
-	}
-
-	for (i = 0; i < count; i++) {
-		rc = of_property_read_u32_index(dn, "ibm,supported-tce-sizes",
-						i, &val);
-		if (rc == 0)
-			mask |= 1ULL << val;
-	}
-
-	return mask;
-}
-
 static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
 				       struct pnv_ioda_pe *pe)
 {
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index d3bbdeab3a32..0c5845a1f05d 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -244,4 +244,6 @@ extern void pnv_pci_setup_iommu_table(struct iommu_table *tbl,
 		void *tce_mem, u64 tce_size,
 		u64 dma_offset, unsigned int page_shift);
 
+extern unsigned long pnv_ioda_parse_tce_sizes(struct pnv_phb *phb);
+
 #endif /* __POWERNV_PCI_H */
-- 
2.21.1

