Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C184D7C13
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 08:36:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KH7dm0GdKz3bgX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 18:36:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ztzmVDCi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+605a0c0c3369109790a8+6777+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=ztzmVDCi; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KH7XX0Ljtz3Wtr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 18:32:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9TI61PVS1CmYy96IdPK0xotFklww6NqACNVye6CbaCc=; b=ztzmVDCimd9p0qwRm3lPhdEThS
 Myvw6EN96v1eJT5HIwjmhtSTD1TGKN+ia9lsBzRQQLbtwfn1lMSZmS1xHx0qRKrzU4UBuKdYNyTZX
 8H7CJzvwmYx5ufy1f24XGAoU7n0oP0ekhhcJF8sTxahztZj3Vp0H7aR/xGGmoRdzShekU91k9U+k3
 HL/vhJGPknDZS3VDH4yXPZrZVMxHlnMVwQZPk9ynPQftVct1V87zITgA6hv+wi7HOoioEhjv2Iewz
 rESc6pI2aejfYQodsDN3VxFl32XCwKmZqGn7KtURt42Ki+5zp7cbRqBjhzryE4qIA+ThVjmdawC3y
 i+FuQ/CA==;
Received: from [46.140.54.162] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfBK-0044dW-LB; Mon, 14 Mar 2022 07:31:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 07/15] x86: remove the IOMMU table infrastructure
Date: Mon, 14 Mar 2022 08:31:21 +0100
Message-Id: <20220314073129.1862284-8-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220314073129.1862284-1-hch@lst.de>
References: <20220314073129.1862284-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 tboot-devel@lists.sourceforge.net, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The IOMMU table tries to separate the different IOMMUs into different
backends, but actually requires various cross calls.

Rewrite the code to do the generic swiotlb/swiotlb-xen setup directly
in pci-dma.c and then just call into the IOMMU drivers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/ia64/include/asm/iommu_table.h    |   7 --
 arch/x86/include/asm/dma-mapping.h     |   1 -
 arch/x86/include/asm/gart.h            |   5 +-
 arch/x86/include/asm/iommu.h           |   6 ++
 arch/x86/include/asm/iommu_table.h     | 102 -----------------------
 arch/x86/include/asm/swiotlb.h         |  30 -------
 arch/x86/include/asm/xen/swiotlb-xen.h |   2 -
 arch/x86/kernel/Makefile               |   2 -
 arch/x86/kernel/amd_gart_64.c          |   5 +-
 arch/x86/kernel/aperture_64.c          |  14 ++--
 arch/x86/kernel/pci-dma.c              | 107 ++++++++++++++++++++-----
 arch/x86/kernel/pci-iommu_table.c      |  77 ------------------
 arch/x86/kernel/pci-swiotlb.c          |  77 ------------------
 arch/x86/kernel/tboot.c                |   1 -
 arch/x86/kernel/vmlinux.lds.S          |  12 ---
 arch/x86/xen/Makefile                  |   2 -
 arch/x86/xen/pci-swiotlb-xen.c         |  96 ----------------------
 drivers/iommu/amd/init.c               |   6 --
 drivers/iommu/amd/iommu.c              |   5 +-
 drivers/iommu/intel/dmar.c             |   6 +-
 include/linux/dmar.h                   |   6 +-
 21 files changed, 110 insertions(+), 459 deletions(-)
 delete mode 100644 arch/ia64/include/asm/iommu_table.h
 delete mode 100644 arch/x86/include/asm/iommu_table.h
 delete mode 100644 arch/x86/include/asm/swiotlb.h
 delete mode 100644 arch/x86/kernel/pci-iommu_table.c
 delete mode 100644 arch/x86/kernel/pci-swiotlb.c
 delete mode 100644 arch/x86/xen/pci-swiotlb-xen.c

diff --git a/arch/ia64/include/asm/iommu_table.h b/arch/ia64/include/asm/iommu_table.h
deleted file mode 100644
index cc96116ac276a..0000000000000
--- a/arch/ia64/include/asm/iommu_table.h
+++ /dev/null
@@ -1,7 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_IA64_IOMMU_TABLE_H
-#define _ASM_IA64_IOMMU_TABLE_H
-
-#define IOMMU_INIT_POST(_detect)
-
-#endif /* _ASM_IA64_IOMMU_TABLE_H */
diff --git a/arch/x86/include/asm/dma-mapping.h b/arch/x86/include/asm/dma-mapping.h
index bb1654fe0ce74..256fd8115223d 100644
--- a/arch/x86/include/asm/dma-mapping.h
+++ b/arch/x86/include/asm/dma-mapping.h
@@ -9,7 +9,6 @@
 
 #include <linux/scatterlist.h>
 #include <asm/io.h>
-#include <asm/swiotlb.h>
 
 extern int iommu_merge;
 extern int panic_on_overflow;
diff --git a/arch/x86/include/asm/gart.h b/arch/x86/include/asm/gart.h
index 3185565743459..5af8088a10df6 100644
--- a/arch/x86/include/asm/gart.h
+++ b/arch/x86/include/asm/gart.h
@@ -38,7 +38,7 @@ extern int gart_iommu_aperture_disabled;
 extern void early_gart_iommu_check(void);
 extern int gart_iommu_init(void);
 extern void __init gart_parse_options(char *);
-extern int gart_iommu_hole_init(void);
+void gart_iommu_hole_init(void);
 
 #else
 #define gart_iommu_aperture            0
@@ -51,9 +51,8 @@ static inline void early_gart_iommu_check(void)
 static inline void gart_parse_options(char *options)
 {
 }
-static inline int gart_iommu_hole_init(void)
+static inline void gart_iommu_hole_init(void)
 {
-	return -ENODEV;
 }
 #endif
 
diff --git a/arch/x86/include/asm/iommu.h b/arch/x86/include/asm/iommu.h
index bf1ed2ddc74bd..dba89ed40d38d 100644
--- a/arch/x86/include/asm/iommu.h
+++ b/arch/x86/include/asm/iommu.h
@@ -9,6 +9,12 @@
 extern int force_iommu, no_iommu;
 extern int iommu_detected;
 
+#ifdef CONFIG_SWIOTLB
+extern bool x86_swiotlb_enable;
+#else
+#define x86_swiotlb_enable false
+#endif
+
 /* 10 seconds */
 #define DMAR_OPERATION_TIMEOUT ((cycles_t) tsc_khz*10*1000)
 
diff --git a/arch/x86/include/asm/iommu_table.h b/arch/x86/include/asm/iommu_table.h
deleted file mode 100644
index 1fb3fd1a83c25..0000000000000
--- a/arch/x86/include/asm/iommu_table.h
+++ /dev/null
@@ -1,102 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_X86_IOMMU_TABLE_H
-#define _ASM_X86_IOMMU_TABLE_H
-
-#include <asm/swiotlb.h>
-
-/*
- * History lesson:
- * The execution chain of IOMMUs in 2.6.36 looks as so:
- *
- *            [xen-swiotlb]
- *                 |
- *         +----[swiotlb *]--+
- *        /         |         \
- *       /          |          \
- *    [GART]     [Calgary]  [Intel VT-d]
- *     /
- *    /
- * [AMD-Vi]
- *
- * *: if SWIOTLB detected 'iommu=soft'/'swiotlb=force' it would skip
- * over the rest of IOMMUs and unconditionally initialize the SWIOTLB.
- * Also it would surreptitiously initialize set the swiotlb=1 if there were
- * more than 4GB and if the user did not pass in 'iommu=off'. The swiotlb
- * flag would be turned off by all IOMMUs except the Calgary one.
- *
- * The IOMMU_INIT* macros allow a similar tree (or more complex if desired)
- * to be built by defining who we depend on.
- *
- * And all that needs to be done is to use one of the macros in the IOMMU
- * and the pci-dma.c will take care of the rest.
- */
-
-struct iommu_table_entry {
-	initcall_t	detect;
-	initcall_t	depend;
-	void		(*early_init)(void); /* No memory allocate available. */
-	void		(*late_init)(void); /* Yes, can allocate memory. */
-#define IOMMU_FINISH_IF_DETECTED (1<<0)
-#define IOMMU_DETECTED		 (1<<1)
-	int		flags;
-};
-/*
- * Macro fills out an entry in the .iommu_table that is equivalent
- * to the fields that 'struct iommu_table_entry' has. The entries
- * that are put in the .iommu_table section are not put in any order
- * hence during boot-time we will have to resort them based on
- * dependency. */
-
-
-#define __IOMMU_INIT(_detect, _depend, _early_init, _late_init, _finish)\
-	static const struct iommu_table_entry				\
-		__iommu_entry_##_detect __used				\
-	__attribute__ ((unused, __section__(".iommu_table"),		\
-			aligned((sizeof(void *)))))	\
-	= {_detect, _depend, _early_init, _late_init,			\
-	   _finish ? IOMMU_FINISH_IF_DETECTED : 0}
-/*
- * The simplest IOMMU definition. Provide the detection routine
- * and it will be run after the SWIOTLB and the other IOMMUs
- * that utilize this macro. If the IOMMU is detected (ie, the
- * detect routine returns a positive value), the other IOMMUs
- * are also checked. You can use IOMMU_INIT_POST_FINISH if you prefer
- * to stop detecting the other IOMMUs after yours has been detected.
- */
-#define IOMMU_INIT_POST(_detect)					\
-	__IOMMU_INIT(_detect, pci_swiotlb_detect_4gb,  NULL, NULL, 0)
-
-#define IOMMU_INIT_POST_FINISH(detect)					\
-	__IOMMU_INIT(_detect, pci_swiotlb_detect_4gb,  NULL, NULL, 1)
-
-/*
- * A more sophisticated version of IOMMU_INIT. This variant requires:
- *  a). A detection routine function.
- *  b). The name of the detection routine we depend on to get called
- *      before us.
- *  c). The init routine which gets called if the detection routine
- *      returns a positive value from the pci_iommu_alloc. This means
- *      no presence of a memory allocator.
- *  d). Similar to the 'init', except that this gets called from pci_iommu_init
- *      where we do have a memory allocator.
- *
- * The standard IOMMU_INIT differs from the IOMMU_INIT_FINISH variant
- * in that the former will continue detecting other IOMMUs in the call
- * list after the detection routine returns a positive number, while the
- * latter will stop the execution chain upon first successful detection.
- * Both variants will still call the 'init' and 'late_init' functions if
- * they are set.
- */
-#define IOMMU_INIT_FINISH(_detect, _depend, _init, _late_init)		\
-	__IOMMU_INIT(_detect, _depend, _init, _late_init, 1)
-
-#define IOMMU_INIT(_detect, _depend, _init, _late_init)			\
-	__IOMMU_INIT(_detect, _depend, _init, _late_init, 0)
-
-void sort_iommu_table(struct iommu_table_entry *start,
-		      struct iommu_table_entry *finish);
-
-void check_iommu_entries(struct iommu_table_entry *start,
-			 struct iommu_table_entry *finish);
-
-#endif /* _ASM_X86_IOMMU_TABLE_H */
diff --git a/arch/x86/include/asm/swiotlb.h b/arch/x86/include/asm/swiotlb.h
deleted file mode 100644
index ff6c92eff035a..0000000000000
--- a/arch/x86/include/asm/swiotlb.h
+++ /dev/null
@@ -1,30 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_X86_SWIOTLB_H
-#define _ASM_X86_SWIOTLB_H
-
-#include <linux/swiotlb.h>
-
-#ifdef CONFIG_SWIOTLB
-extern int swiotlb;
-extern int __init pci_swiotlb_detect_override(void);
-extern int __init pci_swiotlb_detect_4gb(void);
-extern void __init pci_swiotlb_init(void);
-extern void __init pci_swiotlb_late_init(void);
-#else
-#define swiotlb 0
-static inline int pci_swiotlb_detect_override(void)
-{
-	return 0;
-}
-static inline int pci_swiotlb_detect_4gb(void)
-{
-	return 0;
-}
-static inline void pci_swiotlb_init(void)
-{
-}
-static inline void pci_swiotlb_late_init(void)
-{
-}
-#endif
-#endif /* _ASM_X86_SWIOTLB_H */
diff --git a/arch/x86/include/asm/xen/swiotlb-xen.h b/arch/x86/include/asm/xen/swiotlb-xen.h
index 66b4ddde77430..e5a90b42e4dde 100644
--- a/arch/x86/include/asm/xen/swiotlb-xen.h
+++ b/arch/x86/include/asm/xen/swiotlb-xen.h
@@ -3,10 +3,8 @@
 #define _ASM_X86_SWIOTLB_XEN_H
 
 #ifdef CONFIG_SWIOTLB_XEN
-extern int __init pci_xen_swiotlb_detect(void);
 extern int pci_xen_swiotlb_init_late(void);
 #else
-#define pci_xen_swiotlb_detect NULL
 static inline int pci_xen_swiotlb_init_late(void) { return -ENXIO; }
 #endif
 
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 6aef9ee28a394..2851d4f0aa0d2 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -71,7 +71,6 @@ obj-y			+= bootflag.o e820.o
 obj-y			+= pci-dma.o quirks.o topology.o kdebugfs.o
 obj-y			+= alternative.o i8253.o hw_breakpoint.o
 obj-y			+= tsc.o tsc_msr.o io_delay.o rtc.o
-obj-y			+= pci-iommu_table.o
 obj-y			+= resource.o
 obj-y			+= irqflags.o
 obj-y			+= static_call.o
@@ -136,7 +135,6 @@ obj-$(CONFIG_PCSPKR_PLATFORM)	+= pcspeaker.o
 
 obj-$(CONFIG_X86_CHECK_BIOS_CORRUPTION) += check.o
 
-obj-$(CONFIG_SWIOTLB)			+= pci-swiotlb.o
 obj-$(CONFIG_OF)			+= devicetree.o
 obj-$(CONFIG_UPROBES)			+= uprobes.o
 
diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index ed837383de5c8..194d54eed5376 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -38,11 +38,9 @@
 #include <asm/iommu.h>
 #include <asm/gart.h>
 #include <asm/set_memory.h>
-#include <asm/swiotlb.h>
 #include <asm/dma.h>
 #include <asm/amd_nb.h>
 #include <asm/x86_init.h>
-#include <asm/iommu_table.h>
 
 static unsigned long iommu_bus_base;	/* GART remapping area (physical) */
 static unsigned long iommu_size;	/* size of remapping area bytes */
@@ -808,7 +806,7 @@ int __init gart_iommu_init(void)
 	flush_gart();
 	dma_ops = &gart_dma_ops;
 	x86_platform.iommu_shutdown = gart_iommu_shutdown;
-	swiotlb = 0;
+	x86_swiotlb_enable = false;
 
 	return 0;
 }
@@ -842,4 +840,3 @@ void __init gart_parse_options(char *p)
 		}
 	}
 }
-IOMMU_INIT_POST(gart_iommu_hole_init);
diff --git a/arch/x86/kernel/aperture_64.c b/arch/x86/kernel/aperture_64.c
index af3ba08b684b5..7a5630d904b23 100644
--- a/arch/x86/kernel/aperture_64.c
+++ b/arch/x86/kernel/aperture_64.c
@@ -392,7 +392,7 @@ void __init early_gart_iommu_check(void)
 
 static int __initdata printed_gart_size_msg;
 
-int __init gart_iommu_hole_init(void)
+void __init gart_iommu_hole_init(void)
 {
 	u32 agp_aper_base = 0, agp_aper_order = 0;
 	u32 aper_size, aper_alloc = 0, aper_order = 0, last_aper_order = 0;
@@ -401,11 +401,11 @@ int __init gart_iommu_hole_init(void)
 	int i, node;
 
 	if (!amd_gart_present())
-		return -ENODEV;
+		return;
 
 	if (gart_iommu_aperture_disabled || !fix_aperture ||
 	    !early_pci_allowed())
-		return -ENODEV;
+		return;
 
 	pr_info("Checking aperture...\n");
 
@@ -491,10 +491,8 @@ int __init gart_iommu_hole_init(void)
 			 * and fixed up the northbridge
 			 */
 			exclude_from_core(last_aper_base, last_aper_order);
-
-			return 1;
 		}
-		return 0;
+		return;
 	}
 
 	if (!fallback_aper_force) {
@@ -527,7 +525,7 @@ int __init gart_iommu_hole_init(void)
 			panic("Not enough memory for aperture");
 		}
 	} else {
-		return 0;
+		return;
 	}
 
 	/*
@@ -561,6 +559,4 @@ int __init gart_iommu_hole_init(void)
 	}
 
 	set_up_gart_resume(aper_order, aper_alloc);
-
-	return 1;
 }
diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index de234e7a8962e..df96926421be0 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -7,13 +7,16 @@
 #include <linux/memblock.h>
 #include <linux/gfp.h>
 #include <linux/pci.h>
+#include <linux/amd-iommu.h>
 
 #include <asm/proto.h>
 #include <asm/dma.h>
 #include <asm/iommu.h>
 #include <asm/gart.h>
 #include <asm/x86_init.h>
-#include <asm/iommu_table.h>
+
+#include <xen/xen.h>
+#include <xen/swiotlb-xen.h>
 
 static bool disable_dac_quirk __read_mostly;
 
@@ -34,24 +37,83 @@ int no_iommu __read_mostly;
 /* Set this to 1 if there is a HW IOMMU in the system */
 int iommu_detected __read_mostly = 0;
 
-extern struct iommu_table_entry __iommu_table[], __iommu_table_end[];
+#ifdef CONFIG_SWIOTLB
+bool x86_swiotlb_enable;
+
+static void __init pci_swiotlb_detect(void)
+{
+	/* don't initialize swiotlb if iommu=off (no_iommu=1) */
+	if (!no_iommu && max_possible_pfn > MAX_DMA32_PFN)
+		x86_swiotlb_enable = true;
+
+	/*
+	 * Set swiotlb to 1 so that bounce buffers are allocated and used for
+	 * devices that can't support DMA to encrypted memory.
+	 */
+	if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
+		x86_swiotlb_enable = true;
+
+	if (swiotlb_force == SWIOTLB_FORCE)
+		x86_swiotlb_enable = true;
+}
+#else
+static inline void __init pci_swiotlb_detect(void)
+{
+}
+#endif /* CONFIG_SWIOTLB */
+
+#ifdef CONFIG_SWIOTLB_XEN
+static bool xen_swiotlb;
+
+static void __init pci_xen_swiotlb_init(void)
+{
+	if (!xen_initial_domain() && !x86_swiotlb_enable &&
+	    swiotlb_force != SWIOTLB_FORCE)
+		return;
+	x86_swiotlb_enable = true;
+	xen_swiotlb = true;
+	xen_swiotlb_init_early();
+	dma_ops = &xen_swiotlb_dma_ops;
+	if (IS_ENABLED(CONFIG_PCI))
+		pci_request_acs();
+}
+
+int pci_xen_swiotlb_init_late(void)
+{
+	int rc;
+
+	if (xen_swiotlb)
+		return 0;
+
+	rc = xen_swiotlb_init();
+	if (rc)
+		return rc;
+
+	/* XXX: this switches the dma ops under live devices! */
+	dma_ops = &xen_swiotlb_dma_ops;
+	if (IS_ENABLED(CONFIG_PCI))
+		pci_request_acs();
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_xen_swiotlb_init_late);
+#else
+static inline void __init pci_xen_swiotlb_init(void)
+{
+}
+#endif /* CONFIG_SWIOTLB_XEN */
 
 void __init pci_iommu_alloc(void)
 {
-	struct iommu_table_entry *p;
-
-	sort_iommu_table(__iommu_table, __iommu_table_end);
-	check_iommu_entries(__iommu_table, __iommu_table_end);
-
-	for (p = __iommu_table; p < __iommu_table_end; p++) {
-		if (p && p->detect && p->detect() > 0) {
-			p->flags |= IOMMU_DETECTED;
-			if (p->early_init)
-				p->early_init();
-			if (p->flags & IOMMU_FINISH_IF_DETECTED)
-				break;
-		}
+	if (xen_pv_domain()) {
+		pci_xen_swiotlb_init();
+		return;
 	}
+	pci_swiotlb_detect();
+	gart_iommu_hole_init();
+	amd_iommu_detect();
+	detect_intel_iommu();
+	if (x86_swiotlb_enable)
+		swiotlb_init(0);
 }
 
 /*
@@ -102,7 +164,7 @@ static __init int iommu_setup(char *p)
 		}
 #ifdef CONFIG_SWIOTLB
 		if (!strncmp(p, "soft", 4))
-			swiotlb = 1;
+			x86_swiotlb_enable = true;
 #endif
 		if (!strncmp(p, "pt", 2))
 			iommu_set_default_passthrough(true);
@@ -121,14 +183,17 @@ early_param("iommu", iommu_setup);
 
 static int __init pci_iommu_init(void)
 {
-	struct iommu_table_entry *p;
-
 	x86_init.iommu.iommu_init();
 
-	for (p = __iommu_table; p < __iommu_table_end; p++) {
-		if (p && (p->flags & IOMMU_DETECTED) && p->late_init)
-			p->late_init();
+#ifdef CONFIG_SWIOTLB
+	/* An IOMMU turned us off. */
+	if (x86_swiotlb_enable) {
+		pr_info("PCI-DMA: Using software bounce buffering for IO (SWIOTLB)\n");
+		swiotlb_print_info();
+	} else {
+		swiotlb_exit();
 	}
+#endif
 
 	return 0;
 }
diff --git a/arch/x86/kernel/pci-iommu_table.c b/arch/x86/kernel/pci-iommu_table.c
deleted file mode 100644
index 42e92ec62973b..0000000000000
--- a/arch/x86/kernel/pci-iommu_table.c
+++ /dev/null
@@ -1,77 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/dma-mapping.h>
-#include <asm/iommu_table.h>
-#include <linux/string.h>
-#include <linux/kallsyms.h>
-
-static struct iommu_table_entry * __init
-find_dependents_of(struct iommu_table_entry *start,
-		   struct iommu_table_entry *finish,
-		   struct iommu_table_entry *q)
-{
-	struct iommu_table_entry *p;
-
-	if (!q)
-		return NULL;
-
-	for (p = start; p < finish; p++)
-		if (p->detect == q->depend)
-			return p;
-
-	return NULL;
-}
-
-
-void __init sort_iommu_table(struct iommu_table_entry *start,
-			     struct iommu_table_entry *finish) {
-
-	struct iommu_table_entry *p, *q, tmp;
-
-	for (p = start; p < finish; p++) {
-again:
-		q = find_dependents_of(start, finish, p);
-		/* We are bit sneaky here. We use the memory address to figure
-		 * out if the node we depend on is past our point, if so, swap.
-		 */
-		if (q > p) {
-			tmp = *p;
-			memmove(p, q, sizeof(*p));
-			*q = tmp;
-			goto again;
-		}
-	}
-
-}
-
-#ifdef DEBUG
-void __init check_iommu_entries(struct iommu_table_entry *start,
-				struct iommu_table_entry *finish)
-{
-	struct iommu_table_entry *p, *q, *x;
-
-	/* Simple cyclic dependency checker. */
-	for (p = start; p < finish; p++) {
-		q = find_dependents_of(start, finish, p);
-		x = find_dependents_of(start, finish, q);
-		if (p == x) {
-			printk(KERN_ERR "CYCLIC DEPENDENCY FOUND! %pS depends on %pS and vice-versa. BREAKING IT.\n",
-			       p->detect, q->detect);
-			/* Heavy handed way..*/
-			x->depend = NULL;
-		}
-	}
-
-	for (p = start; p < finish; p++) {
-		q = find_dependents_of(p, finish, p);
-		if (q && q > p) {
-			printk(KERN_ERR "EXECUTION ORDER INVALID! %pS should be called before %pS!\n",
-			       p->detect, q->detect);
-		}
-	}
-}
-#else
-void __init check_iommu_entries(struct iommu_table_entry *start,
-				       struct iommu_table_entry *finish)
-{
-}
-#endif
diff --git a/arch/x86/kernel/pci-swiotlb.c b/arch/x86/kernel/pci-swiotlb.c
deleted file mode 100644
index 814ab46a0dada..0000000000000
--- a/arch/x86/kernel/pci-swiotlb.c
+++ /dev/null
@@ -1,77 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include <linux/pci.h>
-#include <linux/cache.h>
-#include <linux/init.h>
-#include <linux/swiotlb.h>
-#include <linux/memblock.h>
-#include <linux/dma-direct.h>
-#include <linux/cc_platform.h>
-
-#include <asm/iommu.h>
-#include <asm/swiotlb.h>
-#include <asm/dma.h>
-#include <asm/xen/swiotlb-xen.h>
-#include <asm/iommu_table.h>
-
-int swiotlb __read_mostly;
-
-/*
- * pci_swiotlb_detect_override - set swiotlb to 1 if necessary
- *
- * This returns non-zero if we are forced to use swiotlb (by the boot
- * option).
- */
-int __init pci_swiotlb_detect_override(void)
-{
-	if (swiotlb_force == SWIOTLB_FORCE)
-		swiotlb = 1;
-
-	return swiotlb;
-}
-IOMMU_INIT_FINISH(pci_swiotlb_detect_override,
-		  pci_xen_swiotlb_detect,
-		  pci_swiotlb_init,
-		  pci_swiotlb_late_init);
-
-/*
- * If 4GB or more detected (and iommu=off not set) or if SME is active
- * then set swiotlb to 1 and return 1.
- */
-int __init pci_swiotlb_detect_4gb(void)
-{
-	/* don't initialize swiotlb if iommu=off (no_iommu=1) */
-	if (!no_iommu && max_possible_pfn > MAX_DMA32_PFN)
-		swiotlb = 1;
-
-	/*
-	 * Set swiotlb to 1 so that bounce buffers are allocated and used for
-	 * devices that can't support DMA to encrypted memory.
-	 */
-	if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
-		swiotlb = 1;
-
-	return swiotlb;
-}
-IOMMU_INIT(pci_swiotlb_detect_4gb,
-	   pci_swiotlb_detect_override,
-	   pci_swiotlb_init,
-	   pci_swiotlb_late_init);
-
-void __init pci_swiotlb_init(void)
-{
-	if (swiotlb)
-		swiotlb_init(0);
-}
-
-void __init pci_swiotlb_late_init(void)
-{
-	/* An IOMMU turned us off. */
-	if (!swiotlb)
-		swiotlb_exit();
-	else {
-		printk(KERN_INFO "PCI-DMA: "
-		       "Using software bounce buffering for IO (SWIOTLB)\n");
-		swiotlb_print_info();
-	}
-}
diff --git a/arch/x86/kernel/tboot.c b/arch/x86/kernel/tboot.c
index f9af561c3cd4f..0c1154a1c4032 100644
--- a/arch/x86/kernel/tboot.c
+++ b/arch/x86/kernel/tboot.c
@@ -24,7 +24,6 @@
 #include <asm/processor.h>
 #include <asm/bootparam.h>
 #include <asm/pgalloc.h>
-#include <asm/swiotlb.h>
 #include <asm/fixmap.h>
 #include <asm/proto.h>
 #include <asm/setup.h>
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 27f830345b6f0..bbe910c15b293 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -306,18 +306,6 @@ SECTIONS
 		*(.altinstr_replacement)
 	}
 
-	/*
-	 * struct iommu_table_entry entries are injected in this section.
-	 * It is an array of IOMMUs which during run time gets sorted depending
-	 * on its dependency order. After rootfs_initcall is complete
-	 * this section can be safely removed.
-	 */
-	.iommu_table : AT(ADDR(.iommu_table) - LOAD_OFFSET) {
-		__iommu_table = .;
-		*(.iommu_table)
-		__iommu_table_end = .;
-	}
-
 	. = ALIGN(8);
 	.apicdrivers : AT(ADDR(.apicdrivers) - LOAD_OFFSET) {
 		__apicdrivers = .;
diff --git a/arch/x86/xen/Makefile b/arch/x86/xen/Makefile
index 4953260e281c3..3c5b52fbe4a7f 100644
--- a/arch/x86/xen/Makefile
+++ b/arch/x86/xen/Makefile
@@ -47,6 +47,4 @@ obj-$(CONFIG_XEN_DEBUG_FS)	+= debugfs.o
 
 obj-$(CONFIG_XEN_PV_DOM0)	+= vga.o
 
-obj-$(CONFIG_SWIOTLB_XEN)	+= pci-swiotlb-xen.o
-
 obj-$(CONFIG_XEN_EFI)		+= efi.o
diff --git a/arch/x86/xen/pci-swiotlb-xen.c b/arch/x86/xen/pci-swiotlb-xen.c
deleted file mode 100644
index 46df59aeaa06a..0000000000000
--- a/arch/x86/xen/pci-swiotlb-xen.c
+++ /dev/null
@@ -1,96 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-/* Glue code to lib/swiotlb-xen.c */
-
-#include <linux/dma-map-ops.h>
-#include <linux/pci.h>
-#include <xen/swiotlb-xen.h>
-
-#include <asm/xen/hypervisor.h>
-#include <xen/xen.h>
-#include <asm/iommu_table.h>
-
-
-#include <asm/xen/swiotlb-xen.h>
-#ifdef CONFIG_X86_64
-#include <asm/iommu.h>
-#include <asm/dma.h>
-#endif
-#include <linux/export.h>
-
-static int xen_swiotlb __read_mostly;
-
-/*
- * pci_xen_swiotlb_detect - set xen_swiotlb to 1 if necessary
- *
- * This returns non-zero if we are forced to use xen_swiotlb (by the boot
- * option).
- */
-int __init pci_xen_swiotlb_detect(void)
-{
-
-	if (!xen_pv_domain())
-		return 0;
-
-	/* If running as PV guest, either iommu=soft, or swiotlb=force will
-	 * activate this IOMMU. If running as PV privileged, activate it
-	 * irregardless.
-	 */
-	if (xen_initial_domain() || swiotlb || swiotlb_force == SWIOTLB_FORCE)
-		xen_swiotlb = 1;
-
-	/* If we are running under Xen, we MUST disable the native SWIOTLB.
-	 * Don't worry about swiotlb_force flag activating the native, as
-	 * the 'swiotlb' flag is the only one turning it on. */
-	swiotlb = 0;
-
-#ifdef CONFIG_X86_64
-	/* pci_swiotlb_detect_4gb turns on native SWIOTLB if no_iommu == 0
-	 * (so no iommu=X command line over-writes).
-	 * Considering that PV guests do not want the *native SWIOTLB* but
-	 * only Xen SWIOTLB it is not useful to us so set no_iommu=1 here.
-	 */
-	if (max_pfn > MAX_DMA32_PFN)
-		no_iommu = 1;
-#endif
-	return xen_swiotlb;
-}
-
-static void __init pci_xen_swiotlb_init(void)
-{
-	if (xen_swiotlb) {
-		xen_swiotlb_init_early();
-		dma_ops = &xen_swiotlb_dma_ops;
-
-#ifdef CONFIG_PCI
-		/* Make sure ACS will be enabled */
-		pci_request_acs();
-#endif
-	}
-}
-
-int pci_xen_swiotlb_init_late(void)
-{
-	int rc;
-
-	if (xen_swiotlb)
-		return 0;
-
-	rc = xen_swiotlb_init();
-	if (rc)
-		return rc;
-
-	dma_ops = &xen_swiotlb_dma_ops;
-#ifdef CONFIG_PCI
-	/* Make sure ACS will be enabled */
-	pci_request_acs();
-#endif
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(pci_xen_swiotlb_init_late);
-
-IOMMU_INIT_FINISH(pci_xen_swiotlb_detect,
-		  NULL,
-		  pci_xen_swiotlb_init,
-		  NULL);
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index dc338acf33385..0000bce14d059 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -26,7 +26,6 @@
 #include <asm/apic.h>
 #include <asm/gart.h>
 #include <asm/x86_init.h>
-#include <asm/iommu_table.h>
 #include <asm/io_apic.h>
 #include <asm/irq_remapping.h>
 #include <asm/set_memory.h>
@@ -3235,11 +3234,6 @@ __setup("ivrs_ioapic",		parse_ivrs_ioapic);
 __setup("ivrs_hpet",		parse_ivrs_hpet);
 __setup("ivrs_acpihid",		parse_ivrs_acpihid);
 
-IOMMU_INIT_FINISH(amd_iommu_detect,
-		  gart_iommu_hole_init,
-		  NULL,
-		  NULL);
-
 bool amd_iommu_v2_supported(void)
 {
 	return amd_iommu_v2_present;
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 461f1844ed1fb..541a7b8315a12 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -1834,7 +1834,10 @@ void amd_iommu_domain_update(struct protection_domain *domain)
 
 static void __init amd_iommu_init_dma_ops(void)
 {
-	swiotlb = (iommu_default_passthrough() || sme_me_mask) ? 1 : 0;
+	if (iommu_default_passthrough() || sme_me_mask)
+		x86_swiotlb_enable = true;
+	else
+		x86_swiotlb_enable = false;
 }
 
 int __init amd_iommu_init_api(void)
diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index 915bff76fe965..29bee4b210c5b 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -30,7 +30,6 @@
 #include <linux/numa.h>
 #include <linux/limits.h>
 #include <asm/irq_remapping.h>
-#include <asm/iommu_table.h>
 #include <trace/events/intel_iommu.h>
 
 #include "../irq_remapping.h"
@@ -913,7 +912,7 @@ dmar_validate_one_drhd(struct acpi_dmar_header *entry, void *arg)
 	return 0;
 }
 
-int __init detect_intel_iommu(void)
+void __init detect_intel_iommu(void)
 {
 	int ret;
 	struct dmar_res_callback validate_drhd_cb = {
@@ -946,8 +945,6 @@ int __init detect_intel_iommu(void)
 		dmar_tbl = NULL;
 	}
 	up_write(&dmar_global_lock);
-
-	return ret ? ret : 1;
 }
 
 static void unmap_iommu(struct intel_iommu *iommu)
@@ -2165,7 +2162,6 @@ static int __init dmar_free_unused_resources(void)
 }
 
 late_initcall(dmar_free_unused_resources);
-IOMMU_INIT_POST(detect_intel_iommu);
 
 /*
  * DMAR Hotplug Support
diff --git a/include/linux/dmar.h b/include/linux/dmar.h
index 45e903d847335..cbd714a198a0a 100644
--- a/include/linux/dmar.h
+++ b/include/linux/dmar.h
@@ -121,7 +121,7 @@ extern int dmar_remove_dev_scope(struct dmar_pci_notify_info *info,
 				 u16 segment, struct dmar_dev_scope *devices,
 				 int count);
 /* Intel IOMMU detection */
-extern int detect_intel_iommu(void);
+void detect_intel_iommu(void);
 extern int enable_drhd_fault_handling(void);
 extern int dmar_device_add(acpi_handle handle);
 extern int dmar_device_remove(acpi_handle handle);
@@ -197,6 +197,10 @@ static inline bool dmar_platform_optin(void)
 	return false;
 }
 
+static inline void detect_intel_iommu(void)
+{
+}
+
 #endif /* CONFIG_DMAR_TABLE */
 
 struct irte {
-- 
2.30.2

