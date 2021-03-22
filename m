Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D73344FA4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 20:10:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F43xS66DYz30Lq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 06:10:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rnlGQtVK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736;
 helo=mail-qk1-x736.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rnlGQtVK; dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F43x135n1z302L
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 06:10:28 +1100 (AEDT)
Received: by mail-qk1-x736.google.com with SMTP id q26so6507286qkm.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 12:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iNkMlxbd5hw8vbFbsx/z880fTB06PFSXH/nFwwKyStY=;
 b=rnlGQtVK9HXlygnqWYdHt7Txl0gnxq9HLW0CGVrRuzpqd69n+S42Gyed5hCfbylmjI
 oKiixgwo495YWGW0sq99flzrhZyPCH4/vXD4C0EKShIpop7qf+69ML9lKCmq3gOhZnNM
 qlKr1ecNrZWZUniNY+3FvKGjjHX4kWieZaYbQm9hSRFTWHEPXWTMexC1ZeVKimlBShMs
 ZkeDpEHlFTI2N5WE3IGf0DMHh+g0f/yvF5UlkS+ATOVQmcAUu7PXiJEsQGzDUW3lhHt4
 wf43IZ+7Gtrj6iM80U+L+UNlXvjqhEAyPBtspqJAy9EP8G/pefSlp/THDyzXl02LSlyH
 DqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iNkMlxbd5hw8vbFbsx/z880fTB06PFSXH/nFwwKyStY=;
 b=fhn3IU3HH+PFErtifMWBiRx3a6omOW2Ip1T7xT730TZIVp1nwlkJK5sgR/HretbQmt
 szSdecp/R/2n3DqNZqPX24kdhb5I317lXoHzFlfpQ3amKc8K1nrLqDNJX3YrFgY4ZR2g
 f3/squbttXpkvV4TN5o+Sf7cNj96IUSRgT277pUlQ4TsvXKVxxtHooL3Bl0m7JQjSHgs
 K53NZzTWg7NX/Sckmq5gjQoF7fFwDvy1sU2lSB3Re0j0OMO8gw20I1eBSpHf6F7sZu8d
 UuAu9D6jhq0/zUjBuqW1uoFhtv3vCAtA5RBCCpZ+BudQDqALeHj+Ljp4s0A98j2b9ksk
 7dNQ==
X-Gm-Message-State: AOAM531dkDIiu8vJ/jOKN4RvruA2gWtrOwoAYnt5HdvVTC9QNSy/7mby
 5HmmZQyxUqJzxvjbRB/iEsE=
X-Google-Smtp-Source: ABdhPJx2GYs+mlG9vxpWgsKw5z54VcLtQ6iDAT/CYzn5OSkaZdO704su+AGykz3PLGvC9Wyhb9dy1Q==
X-Received: by 2002:a05:620a:20c7:: with SMTP id
 f7mr1619367qka.156.1616440223181; 
 Mon, 22 Mar 2021 12:10:23 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 (179-125-204-19.dynamic.desktop.com.br. [179.125.204.19])
 by smtp.gmail.com with ESMTPSA id r133sm11810186qke.20.2021.03.22.12.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 12:10:22 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, brking@linux.vnet.ibm.com
Subject: [PATCH 1/1] powerpc/iommu: Enable remaining IOMMU Pagesizes present
 in LoPAR
Date: Mon, 22 Mar 2021 16:09:43 -0300
Message-Id: <20210322190943.715368-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.29.2
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

According to LoPAR, ibm,query-pe-dma-window output named "IO Page Sizes"
will let the OS know all possible pagesizes that can be used for creating a
new DDW.

Currently Linux will only try using 3 of the 8 available options:
4K, 64K and 16M. According to LoPAR, Hypervisor may also offer 32M, 64M,
128M, 256M and 16G.

Enabling bigger pages would be interesting for direct mapping systems
with a lot of RAM, while using less TCE entries.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/include/asm/iommu.h       |  8 ++++++++
 arch/powerpc/platforms/pseries/iommu.c | 28 +++++++++++++++++++-------
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index deef7c94d7b6..c170048b7a1b 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -19,6 +19,14 @@
 #include <asm/pci-bridge.h>
 #include <asm/asm-const.h>
 
+#define IOMMU_PAGE_SHIFT_16G	34
+#define IOMMU_PAGE_SHIFT_256M	28
+#define IOMMU_PAGE_SHIFT_128M	27
+#define IOMMU_PAGE_SHIFT_64M	26
+#define IOMMU_PAGE_SHIFT_32M	25
+#define IOMMU_PAGE_SHIFT_16M	24
+#define IOMMU_PAGE_SHIFT_64K	16
+
 #define IOMMU_PAGE_SHIFT_4K      12
 #define IOMMU_PAGE_SIZE_4K       (ASM_CONST(1) << IOMMU_PAGE_SHIFT_4K)
 #define IOMMU_PAGE_MASK_4K       (~((1 << IOMMU_PAGE_SHIFT_4K) - 1))
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 9fc5217f0c8e..02958e80aa91 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1099,6 +1099,24 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
 			 ret);
 }
 
+/* Returns page shift based on "IO Page Sizes" output at ibm,query-pe-dma-window. SeeL LoPAR */
+static int iommu_get_page_shift(u32 query_page_size)
+{
+	const int shift[] = {IOMMU_PAGE_SHIFT_4K,   IOMMU_PAGE_SHIFT_64K,  IOMMU_PAGE_SHIFT_16M,
+			     IOMMU_PAGE_SHIFT_32M,  IOMMU_PAGE_SHIFT_64M,  IOMMU_PAGE_SHIFT_128M,
+			     IOMMU_PAGE_SHIFT_256M, IOMMU_PAGE_SHIFT_16G};
+	int i = ARRAY_SIZE(shift) - 1;
+
+	/* Looks for the largest page size supported */
+	for (; i >= 0; i--) {
+		if (query_page_size & (1 << i))
+			return shift[i];
+	}
+
+	/* No valid page size found. */
+	return 0;
+}
+
 /*
  * If the PE supports dynamic dma windows, and there is space for a table
  * that can map all pages in a linear offset, then setup such a table,
@@ -1206,13 +1224,9 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 			goto out_failed;
 		}
 	}
-	if (query.page_size & 4) {
-		page_shift = 24; /* 16MB */
-	} else if (query.page_size & 2) {
-		page_shift = 16; /* 64kB */
-	} else if (query.page_size & 1) {
-		page_shift = 12; /* 4kB */
-	} else {
+
+	page_shift = iommu_get_page_shift(query.page_size);
+	if (!page_shift) {
 		dev_dbg(&dev->dev, "no supported direct page size in mask %x",
 			  query.page_size);
 		goto out_failed;
-- 
2.29.2

