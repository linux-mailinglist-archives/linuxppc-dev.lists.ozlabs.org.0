Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 790B01973EA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 07:39:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rLrX44Q6zDqrV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 16:39:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=d-silva.org (client-ip=66.55.73.32;
 helo=ushosting.nmnhosting.com; envelope-from=alastair@d-silva.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=d-silva.org
Authentication-Results: lists.ozlabs.org; dkim=pass (4096-bit key;
 unprotected) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256
 header.s=201810a header.b=dDzEJ12M; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48rLT300j1zDqTV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 16:23:02 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id F39C02DC682F;
 Fri, 27 Mar 2020 18:12:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585293141;
 bh=cTN8FMRoX34pEnqAaScxUQo064CptcomhYQubar6PL4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dDzEJ12MPCicxaVAdHkydps6s4bYG45dmh7GrJNLgOaIVhimCK4WsnAr28LxgF9nz
 SZ1C4w5tiF/ghQDzxSyJQQ4ZgL86wWzX423PKNWVFIFj724JhV5EldneRKE4rj1LGR
 61kGSrR6SXUtYsCr43AHIHhqj5D1VpoOx5qbkeXK5g2YJlwCRk53lmHuZyHWFsMv5C
 UIev+ORU4xZrQ+nJStJe5NkumRYilZyw4g2UzKJq9I4iulDlTSkXR/IVoMnbBPlFlS
 8FOnA4O9Q1Tn0zCEfOEGNYlZtINAXQFQRc9M9qM7imsIc/NTffHIa/hFYLBjGg47hz
 nBYcC2u3t8f52WVvJECJjIRV41puWvpmjrLjYPcMR2UG1JllWLEE4+EeK6I6xcpdJi
 gbT009RMoO44xqVORSk51rxQkr4y9PA1eXvMYxFTsby9DNUVwVL6kDGK48B5w8TbpK
 JcwCR9+3Qv0bF66b5pGwDBjYVyo1DYAjYC24hN28JGsUeDHjls4olMODbGP6DL3jAq
 O84KFtHng5DI3fXHjRvXAhVNzdPtu/Y/PBccmFoEnnsvqn1YapgeRb4gkqh2EyJPCM
 aVv9XZAGwUCwF27wFKECjzydTo1r+WX/+DJoNsp0Of3K7qTbKQnc2X9fCyLSk3dkt7
 r7OXXTocQUPjuAp4QH4snO5U=
Received: from localhost.lan ([10.0.1.179])
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTP id 02R7C4Ad045934;
 Fri, 27 Mar 2020 18:12:15 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: alastair@d-silva.org
Subject: [PATCH v4 04/25] ocxl: Remove unnecessary externs
Date: Fri, 27 Mar 2020 18:11:41 +1100
Message-Id: <20200327071202.2159885-5-alastair@d-silva.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327071202.2159885-1-alastair@d-silva.org>
References: <20200327071202.2159885-1-alastair@d-silva.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Fri, 27 Mar 2020 18:12:15 +1100 (AEDT)
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Function declarations don't need externs, remove the existing ones
so they are consistent with newer code

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
Acked-by: Andrew Donnellan <ajd@linux.ibm.com>
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 arch/powerpc/include/asm/pnv-ocxl.h | 40 ++++++++++++++---------------
 include/misc/ocxl.h                 |  6 ++---
 2 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/pnv-ocxl.h b/arch/powerpc/include/asm/pnv-ocxl.h
index 560a19bb71b7..205efc41a33c 100644
--- a/arch/powerpc/include/asm/pnv-ocxl.h
+++ b/arch/powerpc/include/asm/pnv-ocxl.h
@@ -9,29 +9,27 @@
 #define PNV_OCXL_TL_BITS_PER_RATE       4
 #define PNV_OCXL_TL_RATE_BUF_SIZE       ((PNV_OCXL_TL_MAX_TEMPLATE+1) * PNV_OCXL_TL_BITS_PER_RATE / 8)
 
-extern int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16 *enabled,
-			u16 *supported);
-extern int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count);
+int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16 *enabled, u16 *supported);
+int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count);
 
-extern int pnv_ocxl_get_tl_cap(struct pci_dev *dev, long *cap,
+int pnv_ocxl_get_tl_cap(struct pci_dev *dev, long *cap,
 			char *rate_buf, int rate_buf_size);
-extern int pnv_ocxl_set_tl_conf(struct pci_dev *dev, long cap,
-			uint64_t rate_buf_phys, int rate_buf_size);
-
-extern int pnv_ocxl_get_xsl_irq(struct pci_dev *dev, int *hwirq);
-extern void pnv_ocxl_unmap_xsl_regs(void __iomem *dsisr, void __iomem *dar,
-				void __iomem *tfc, void __iomem *pe_handle);
-extern int pnv_ocxl_map_xsl_regs(struct pci_dev *dev, void __iomem **dsisr,
-				void __iomem **dar, void __iomem **tfc,
-				void __iomem **pe_handle);
-
-extern int pnv_ocxl_spa_setup(struct pci_dev *dev, void *spa_mem, int PE_mask,
-			void **platform_data);
-extern void pnv_ocxl_spa_release(void *platform_data);
-extern int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle);
-
-extern int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr);
-extern void pnv_ocxl_free_xive_irq(u32 irq);
+int pnv_ocxl_set_tl_conf(struct pci_dev *dev, long cap,
+			 uint64_t rate_buf_phys, int rate_buf_size);
+
+int pnv_ocxl_get_xsl_irq(struct pci_dev *dev, int *hwirq);
+void pnv_ocxl_unmap_xsl_regs(void __iomem *dsisr, void __iomem *dar,
+			     void __iomem *tfc, void __iomem *pe_handle);
+int pnv_ocxl_map_xsl_regs(struct pci_dev *dev, void __iomem **dsisr,
+			  void __iomem **dar, void __iomem **tfc,
+			  void __iomem **pe_handle);
+
+int pnv_ocxl_spa_setup(struct pci_dev *dev, void *spa_mem, int PE_mask, void **platform_data);
+void pnv_ocxl_spa_release(void *platform_data);
+int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle);
+
+int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr);
+void pnv_ocxl_free_xive_irq(u32 irq);
 u64 pnv_ocxl_platform_lpc_setup(struct pci_dev *pdev, u64 size);
 void pnv_ocxl_platform_lpc_release(struct pci_dev *pdev);
 
diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
index 06dd5839e438..0a762e387418 100644
--- a/include/misc/ocxl.h
+++ b/include/misc/ocxl.h
@@ -173,7 +173,7 @@ int ocxl_context_detach(struct ocxl_context *ctx);
  *
  * Returns 0 on success, negative on failure
  */
-extern int ocxl_afu_irq_alloc(struct ocxl_context *ctx, int *irq_id);
+int ocxl_afu_irq_alloc(struct ocxl_context *ctx, int *irq_id);
 
 /**
  * Frees an IRQ associated with an AFU context
@@ -182,7 +182,7 @@ extern int ocxl_afu_irq_alloc(struct ocxl_context *ctx, int *irq_id);
  *
  * Returns 0 on success, negative on failure
  */
-extern int ocxl_afu_irq_free(struct ocxl_context *ctx, int irq_id);
+int ocxl_afu_irq_free(struct ocxl_context *ctx, int irq_id);
 
 /**
  * Gets the address of the trigger page for an IRQ
@@ -193,7 +193,7 @@ extern int ocxl_afu_irq_free(struct ocxl_context *ctx, int irq_id);
  *
  * returns the trigger page address, or 0 if the IRQ is not valid
  */
-extern u64 ocxl_afu_irq_get_addr(struct ocxl_context *ctx, int irq_id);
+u64 ocxl_afu_irq_get_addr(struct ocxl_context *ctx, int irq_id);
 
 /**
  * Provide a callback to be called when an IRQ is triggered
-- 
2.24.1

