Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5331C40BAB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 23:49:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8H6y0BTDz305K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 07:49:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IaMh1odM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=rm.skakun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IaMh1odM; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H86H655p9z2xtS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 01:10:42 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id h1so24509576ljl.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 08:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+K8MjtcnJXfpNCRFyMCdqNnPKrcaeccqs3rzyDDn0vU=;
 b=IaMh1odM3L3VhmQ1m9aeZoRN0SQqI1qWvuDoZWK+kGl0yYbfmDEi7D0j2oLe14UX2F
 rpjUo3lsxP5Ys1zoUPhUxacNkXBGHhKp/VWLcn3VaR1IZbD/wkmOEHytFa0NiO1XV0aE
 O1GlE5Y2v46M+6SUc2NpFvRok3ihp3e/rfYBP921FLdN2x2npuwD6bPz9uzlrrgVeYu9
 m+iuYgMs/d2E2Nt8Vhc0NLSoGg6tG917T7wzGKqoVsqJs2NYLv7TzW6UM3OszHB4dLXY
 pfJbHa0qySjo55aBIDzrsH27D5ycEHqJnZOlX1euImWJ1nEKFy+itmgG9ixUnlRxJzzs
 +oDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+K8MjtcnJXfpNCRFyMCdqNnPKrcaeccqs3rzyDDn0vU=;
 b=RBKYLMjX2wxZRBHmzAP5mvKAYm5UFDuoz6gEm6xSyLVBlWnKaO8hYEKafFQNnK3KLF
 MAbEI1oSSS9G6N5iqCHjhAGhPP9/sPUfOM49x1Vm5rxfuiuhQ9HS+0oAMK+rpIeOEse4
 otEm3TkIWirhGDsEyTMki4c8TnhUwB/6Q2QnBaVyI645r4OwdJ6FLLRj207qR4pozoKb
 6lmabcLFdx3Y3llnYtyZaEWRWVm02wj6EqTRvU45jbYASDY7BnQguEcsLYCbuwhlSu0Y
 Z2/r46Nm6Z/n2D1EHLOFTh3V3R+4jwV1eJdvPKN/MKP9svhVcjU4KWOip63m6DLJ5g2+
 tm9g==
X-Gm-Message-State: AOAM531s3EB/NSuJTr3EU/6URGA1QgafBbr3tVWn2qRpuxpuvXCq0xuc
 XUIbSbIhBujwxzum4QUFS6moyGrRU1mMcw==
X-Google-Smtp-Source: ABdhPJzf6vLVIOTdmCQu5RbgpN6oC/S/5GVuhLuSFjpLP9tVLZKCDmzH0tCMHS1catjmI7HUw5NlUA==
X-Received: by 2002:a05:651c:1410:: with SMTP id
 u16mr15749408lje.435.1631632239102; 
 Tue, 14 Sep 2021 08:10:39 -0700 (PDT)
Received: from localhost ([178.151.124.169])
 by smtp.gmail.com with ESMTPSA id z13sm1380486ljo.37.2021.09.14.08.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 08:10:38 -0700 (PDT)
From: Roman Skakun <rm.skakun@gmail.com>
X-Google-Original-From: Roman Skakun <Roman_Skakun@epam.com>
To: xen-devel@lists.xenproject.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: [PATCH] swiotlb: set IO TLB segment size via cmdline
Date: Tue, 14 Sep 2021 18:10:11 +0300
Message-Id: <20210914151016.3174924-1-Roman_Skakun@epam.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 15 Sep 2021 07:48:39 +1000
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
Cc: Roman Skakun <rm.skakun@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Hellwig <hch@lst.de>, "Paul E. McKenney" <paulmck@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Muchun Song <songmuchun@bytedance.com>, Thomas Gleixner <tglx@linutronix.de>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Andrii Anisov <andrii_anisov@epam.com>, Randy Dunlap <rdunlap@infradead.org>,
 Roman Skakun <roman_skakun@epam.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, Mike Rapoport <rppt@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Roman Skakun <roman_skakun@epam.com>

It is possible when default IO TLB size is not
enough to fit a long buffers as described here [1].

This patch makes a way to set this parameter
using cmdline instead of recompiling a kernel.

[1] https://www.xilinx.com/support/answers/72694.html

Signed-off-by: Roman Skakun <roman_skakun@epam.com>
---
 .../admin-guide/kernel-parameters.txt         |  5 +-
 arch/mips/cavium-octeon/dma-octeon.c          |  2 +-
 arch/powerpc/platforms/pseries/svm.c          |  2 +-
 drivers/xen/swiotlb-xen.c                     |  7 +--
 include/linux/swiotlb.h                       |  1 +
 kernel/dma/swiotlb.c                          | 51 ++++++++++++++-----
 6 files changed, 48 insertions(+), 20 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 91ba391f9b32..f842a523a485 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5558,8 +5558,9 @@
 			it if 0 is given (See Documentation/admin-guide/cgroup-v1/memory.rst)
 
 	swiotlb=	[ARM,IA-64,PPC,MIPS,X86]
-			Format: { <int> | force | noforce }
-			<int> -- Number of I/O TLB slabs
+			Format: { <slabs> [,<io_tlb_segment_size>] [,force | noforce]​ }
+			<slabs> -- Number of I/O TLB slabs
+			<io_tlb_segment_size> -- Max IO TLB segment size
 			force -- force using of bounce buffers even if they
 			         wouldn't be automatically used by the kernel
 			noforce -- Never use bounce buffers (for debugging)
diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
index df70308db0e6..446c73bc936e 100644
--- a/arch/mips/cavium-octeon/dma-octeon.c
+++ b/arch/mips/cavium-octeon/dma-octeon.c
@@ -237,7 +237,7 @@ void __init plat_swiotlb_setup(void)
 		swiotlbsize = 64 * (1<<20);
 #endif
 	swiotlb_nslabs = swiotlbsize >> IO_TLB_SHIFT;
-	swiotlb_nslabs = ALIGN(swiotlb_nslabs, IO_TLB_SEGSIZE);
+	swiotlb_nslabs = ALIGN(swiotlb_nslabs, swiotlb_io_seg_size());
 	swiotlbsize = swiotlb_nslabs << IO_TLB_SHIFT;
 
 	octeon_swiotlb = memblock_alloc_low(swiotlbsize, PAGE_SIZE);
diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 87f001b4c4e4..2a1f09c722ac 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -47,7 +47,7 @@ void __init svm_swiotlb_init(void)
 	unsigned long bytes, io_tlb_nslabs;
 
 	io_tlb_nslabs = (swiotlb_size_or_default() >> IO_TLB_SHIFT);
-	io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+	io_tlb_nslabs = ALIGN(io_tlb_nslabs, swiotlb_io_seg_size());
 
 	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
 
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 643fe440c46e..0fc9c6cb6815 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -110,12 +110,13 @@ static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 	int dma_bits;
 	dma_addr_t dma_handle;
 	phys_addr_t p = virt_to_phys(buf);
+	unsigned long tlb_segment_size = swiotlb_io_seg_size();
 
-	dma_bits = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT) + PAGE_SHIFT;
+	dma_bits = get_order(tlb_segment_size << IO_TLB_SHIFT) + PAGE_SHIFT;
 
 	i = 0;
 	do {
-		int slabs = min(nslabs - i, (unsigned long)IO_TLB_SEGSIZE);
+		int slabs = min(nslabs - i, (unsigned long)tlb_segment_size);
 
 		do {
 			rc = xen_create_contiguous_region(
@@ -153,7 +154,7 @@ static const char *xen_swiotlb_error(enum xen_swiotlb_err err)
 	return "";
 }
 
-#define DEFAULT_NSLABS		ALIGN(SZ_64M >> IO_TLB_SHIFT, IO_TLB_SEGSIZE)
+#define DEFAULT_NSLABS		ALIGN(SZ_64M >> IO_TLB_SHIFT, swiotlb_io_seg_size())
 
 int __ref xen_swiotlb_init(void)
 {
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index b0cb2a9973f4..35c3ffeda9fa 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -59,6 +59,7 @@ void swiotlb_sync_single_for_cpu(struct device *dev, phys_addr_t tlb_addr,
 		size_t size, enum dma_data_direction dir);
 dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
 		size_t size, enum dma_data_direction dir, unsigned long attrs);
+unsigned long swiotlb_io_seg_size(void);
 
 #ifdef CONFIG_SWIOTLB
 extern enum swiotlb_force swiotlb_force;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 87c40517e822..6b505206fc13 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -72,6 +72,11 @@ enum swiotlb_force swiotlb_force;
 
 struct io_tlb_mem io_tlb_default_mem;
 
+/*
+ * Maximum IO TLB segment size.
+ */
+static unsigned long io_tlb_seg_size = IO_TLB_SEGSIZE;
+
 /*
  * Max segment that we can provide which (if pages are contingous) will
  * not be bounced (unless SWIOTLB_FORCE is set).
@@ -81,15 +86,30 @@ static unsigned int max_segment;
 static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
 
 static int __init
-setup_io_tlb_npages(char *str)
+setup_io_tlb_params(char *str)
 {
+	unsigned long tmp;
+
 	if (isdigit(*str)) {
-		/* avoid tail segment of size < IO_TLB_SEGSIZE */
-		default_nslabs =
-			ALIGN(simple_strtoul(str, &str, 0), IO_TLB_SEGSIZE);
+		default_nslabs = simple_strtoul(str, &str, 0);
 	}
 	if (*str == ',')
 		++str;
+
+	/* get max IO TLB segment size */
+	if (isdigit(*str)) {
+		tmp = simple_strtoul(str, &str, 0);
+		if (tmp)
+			io_tlb_seg_size = ALIGN(tmp, IO_TLB_SEGSIZE);
+	}
+	if (*str == ',')
+		++str;
+
+	/* update io_tlb_nslabs after applying a new segment size and
+	 * avoid tail segment of size < IO TLB segment size
+	 */
+	default_nslabs = ALIGN(default_nslabs, io_tlb_seg_size);
+
 	if (!strcmp(str, "force"))
 		swiotlb_force = SWIOTLB_FORCE;
 	else if (!strcmp(str, "noforce"))
@@ -97,7 +117,7 @@ setup_io_tlb_npages(char *str)
 
 	return 0;
 }
-early_param("swiotlb", setup_io_tlb_npages);
+early_param("swiotlb", setup_io_tlb_params);
 
 unsigned int swiotlb_max_segment(void)
 {
@@ -118,6 +138,11 @@ unsigned long swiotlb_size_or_default(void)
 	return default_nslabs << IO_TLB_SHIFT;
 }
 
+unsigned long swiotlb_io_seg_size(void)
+{
+	return io_tlb_seg_size;
+}
+
 void __init swiotlb_adjust_size(unsigned long size)
 {
 	/*
@@ -128,7 +153,7 @@ void __init swiotlb_adjust_size(unsigned long size)
 	if (default_nslabs != IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT)
 		return;
 	size = ALIGN(size, IO_TLB_SIZE);
-	default_nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
+	default_nslabs = ALIGN(size >> IO_TLB_SHIFT, io_tlb_seg_size);
 	pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
 }
 
@@ -147,7 +172,7 @@ void swiotlb_print_info(void)
 
 static inline unsigned long io_tlb_offset(unsigned long val)
 {
-	return val & (IO_TLB_SEGSIZE - 1);
+	return val & (io_tlb_seg_size - 1);
 }
 
 static inline unsigned long nr_slots(u64 val)
@@ -192,7 +217,7 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 
 	spin_lock_init(&mem->lock);
 	for (i = 0; i < mem->nslabs; i++) {
-		mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
+		mem->slots[i].list = io_tlb_seg_size - io_tlb_offset(i);
 		mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
 		mem->slots[i].alloc_size = 0;
 	}
@@ -261,7 +286,7 @@ int
 swiotlb_late_init_with_default_size(size_t default_size)
 {
 	unsigned long nslabs =
-		ALIGN(default_size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
+		ALIGN(default_size >> IO_TLB_SHIFT, io_tlb_seg_size);
 	unsigned long bytes;
 	unsigned char *vstart = NULL;
 	unsigned int order;
@@ -522,7 +547,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
 			alloc_size - (offset + ((i - index) << IO_TLB_SHIFT));
 	}
 	for (i = index - 1;
-	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
+	     io_tlb_offset(i) != io_tlb_seg_size - 1 &&
 	     mem->slots[i].list; i--)
 		mem->slots[i].list = ++count;
 
@@ -600,7 +625,7 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 	 * with slots below and above the pool being returned.
 	 */
 	spin_lock_irqsave(&mem->lock, flags);
-	if (index + nslots < ALIGN(index + 1, IO_TLB_SEGSIZE))
+	if (index + nslots < ALIGN(index + 1, io_tlb_seg_size))
 		count = mem->slots[index + nslots].list;
 	else
 		count = 0;
@@ -620,7 +645,7 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 	 * available (non zero)
 	 */
 	for (i = index - 1;
-	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 && mem->slots[i].list;
+	     io_tlb_offset(i) != io_tlb_seg_size - 1 && mem->slots[i].list;
 	     i--)
 		mem->slots[i].list = ++count;
 	mem->used -= nslots;
@@ -698,7 +723,7 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
 
 size_t swiotlb_max_mapping_size(struct device *dev)
 {
-	return ((size_t)IO_TLB_SIZE) * IO_TLB_SEGSIZE;
+	return ((size_t)IO_TLB_SIZE) * io_tlb_seg_size;
 }
 
 bool is_swiotlb_active(struct device *dev)
-- 
2.27.0

