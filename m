Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B918A3A0977
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 03:35:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G08nR13Ltz3c2G
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 11:35:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=iYiACtPa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iYiACtPa; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G08mS0837z2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 11:34:47 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id ei4so407274pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 18:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LppOElijB5Ey9uShbIoZAlXdXn6c2Aq5BiFzHVtpomc=;
 b=iYiACtPaZAaLRRcafWKetxZjLoCU7ZiG5swf4agk5Kz9wUZkZ8ESbiqQodOJKvuzum
 nRyWrgFmvr8X9Qtbm8cnvTFz3xRW4vg+SQjTXMoBqp/YSTEvBxg3bo/Nu2z8bw5TAskj
 J2cvffnbXpIGQgtWDe0tNqKJPLUlRXmsAIpcOwMm1jPpSlVnXxQGcUOsKKgiHY/8HpdS
 AafEpchdhY5iRnDf+7DsLi/Izasqf9OnnVNkNp7vW077PsXMeJc9QVQF4glKQRoRtIcg
 C5RHJmhhqmedUh9/zujltVybPlC56r9g8znBLEPdMVJSGNseUmia+ZNKMiKuwj5CHpkL
 IpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LppOElijB5Ey9uShbIoZAlXdXn6c2Aq5BiFzHVtpomc=;
 b=dc6Ga6ciwzct4PPaT82yQhLEM70V5Zw3vOw8um25BjRkrq0y9rrbMFaQNn+VKVSJWG
 tPIHNg+EWEgd2gqvm1050T9jiNyj7y37rm4JyQSl4KVDHcAuO2AeLHa2xbDn10LsIq2g
 bfZFjmK+rALG3HNajF9ilGzAkjOAoQNMyr+JzmzpfSdJxNGDzvfp5Is64plqHbE3lJyc
 roIkyRz+L+p5yI3BSe9bsZ5w76kSb0EItwJYhY5pQwJudLEDRdktImdosDvlNJqsLMJ3
 id9IcvBEp/RO4UgTnVqVgnrudPDpHBkj1hM5oAYpfzNTjT8LX/vOU8YfI9flNhUGkIGp
 VG/Q==
X-Gm-Message-State: AOAM533EkySic+fiiz3q8CVALOhCCMqx2s/V0K2nwR+A5MYY+oacMaEH
 7kS3/WN27ZIGxRQKe7Dnr09MuI1VAas=
X-Google-Smtp-Source: ABdhPJzGu4vzXXu6A+JfuLSS1mJna5Nj/M+jx51PnyI7YQex3AUw7V2N/+nIMC4ZI0hZnnhwW9IVkg==
X-Received: by 2002:a17:90b:902:: with SMTP id
 bo2mr29220808pjb.57.1623202484791; 
 Tue, 08 Jun 2021 18:34:44 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id s10sm11369406pfk.186.2021.06.08.18.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:34:44 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v15 1/9] powerpc/mm: Implement set_memory() routines
Date: Wed,  9 Jun 2021 11:34:23 +1000
Message-Id: <20210609013431.9805-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210609013431.9805-1-jniethe5@gmail.com>
References: <20210609013431.9805-1-jniethe5@gmail.com>
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
Cc: ajd@linux.ibm.com, cmr@codefail.de, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

The set_memory_{ro/rw/nx/x}() functions are required for
STRICT_MODULE_RWX, and are generally useful primitives to have.  This
implementation is designed to be generic across powerpc's many MMUs.
It's possible that this could be optimised to be faster for specific
MMUs.

This implementation does not handle cases where the caller is attempting
to change the mapping of the page it is executing from, or if another
CPU is concurrently using the page being altered.  These cases likely
shouldn't happen, but a more complex implementation with MMU-specific code
could safely handle them.

On hash, the linear mapping is not kept in the linux pagetable, so this
will not change the protection if used on that range. Currently these
functions are not used on the linear map so just WARN for now.

apply_to_existing_page_range() does not work on huge pages so for now
disallow changing the protection of huge pages.

Reviewed-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
[jpn: - Allow set memory functions to be used without Strict RWX
      - Hash: Disallow certain regions
      - Have change_page_attr() take function pointers to manipulate ptes
      - Radix: Add ptesync after set_pte_at()]
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v10: WARN if trying to change the hash linear map
v11: - Update copywrite dates
     - Allow set memory functions to be used without Strict RWX
     - Hash: Disallow certain regions and add comment explaining why
     - Have change_page_attr() take function pointers to manipulate ptes
     - Clarify change_page_attr()'s comment
     - Radix: Add ptesync after set_pte_at()
v12: - change_page_attr() back to taking an action value
     - disallow operating on huge pages
v14: - only check is_vm_area_hugepages() for virtual memory
---
 arch/powerpc/Kconfig                  |   1 +
 arch/powerpc/include/asm/set_memory.h |  32 ++++++++
 arch/powerpc/mm/Makefile              |   2 +-
 arch/powerpc/mm/pageattr.c            | 101 ++++++++++++++++++++++++++
 4 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/mm/pageattr.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 36ba413f49d3..abfe2e9225fa 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -140,6 +140,7 @@ config PPC
 	select ARCH_HAS_PTE_DEVMAP		if PPC_BOOK3S_64
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
+	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !HIBERNATION)
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
new file mode 100644
index 000000000000..64011ea444b4
--- /dev/null
+++ b/arch/powerpc/include/asm/set_memory.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_SET_MEMORY_H
+#define _ASM_POWERPC_SET_MEMORY_H
+
+#define SET_MEMORY_RO	0
+#define SET_MEMORY_RW	1
+#define SET_MEMORY_NX	2
+#define SET_MEMORY_X	3
+
+int change_memory_attr(unsigned long addr, int numpages, long action);
+
+static inline int set_memory_ro(unsigned long addr, int numpages)
+{
+	return change_memory_attr(addr, numpages, SET_MEMORY_RO);
+}
+
+static inline int set_memory_rw(unsigned long addr, int numpages)
+{
+	return change_memory_attr(addr, numpages, SET_MEMORY_RW);
+}
+
+static inline int set_memory_nx(unsigned long addr, int numpages)
+{
+	return change_memory_attr(addr, numpages, SET_MEMORY_NX);
+}
+
+static inline int set_memory_x(unsigned long addr, int numpages)
+{
+	return change_memory_attr(addr, numpages, SET_MEMORY_X);
+}
+
+#endif
diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
index c3df3a8501d4..9142cf1fb0d5 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -5,7 +5,7 @@
 
 ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
 
-obj-y				:= fault.o mem.o pgtable.o mmap.o maccess.o \
+obj-y				:= fault.o mem.o pgtable.o mmap.o maccess.o pageattr.o \
 				   init_$(BITS).o pgtable_$(BITS).o \
 				   pgtable-frag.o ioremap.o ioremap_$(BITS).o \
 				   init-common.o mmu_context.o drmem.o \
diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
new file mode 100644
index 000000000000..5e5ae50a7f23
--- /dev/null
+++ b/arch/powerpc/mm/pageattr.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * MMU-generic set_memory implementation for powerpc
+ *
+ * Copyright 2019-2021, IBM Corporation.
+ */
+
+#include <linux/mm.h>
+#include <linux/vmalloc.h>
+#include <linux/set_memory.h>
+
+#include <asm/mmu.h>
+#include <asm/page.h>
+#include <asm/pgtable.h>
+
+
+/*
+ * Updates the attributes of a page in three steps:
+ *
+ * 1. invalidate the page table entry
+ * 2. flush the TLB
+ * 3. install the new entry with the updated attributes
+ *
+ * Invalidating the pte means there are situations where this will not work
+ * when in theory it should.
+ * For example:
+ * - removing write from page whilst it is being executed
+ * - setting a page read-only whilst it is being read by another CPU
+ *
+ */
+static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
+{
+	long action = (long)data;
+	pte_t pte;
+
+	spin_lock(&init_mm.page_table_lock);
+
+	/* invalidate the PTE so it's safe to modify */
+	pte = ptep_get_and_clear(&init_mm, addr, ptep);
+	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+
+	/* modify the PTE bits as desired, then apply */
+	switch (action) {
+	case SET_MEMORY_RO:
+		pte = pte_wrprotect(pte);
+		break;
+	case SET_MEMORY_RW:
+		pte = pte_mkwrite(pte_mkdirty(pte));
+		break;
+	case SET_MEMORY_NX:
+		pte = pte_exprotect(pte);
+		break;
+	case SET_MEMORY_X:
+		pte = pte_mkexec(pte);
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		break;
+	}
+
+	set_pte_at(&init_mm, addr, ptep, pte);
+
+	/* See ptesync comment in radix__set_pte_at() */
+	if (radix_enabled())
+		asm volatile("ptesync": : :"memory");
+	spin_unlock(&init_mm.page_table_lock);
+
+	return 0;
+}
+
+int change_memory_attr(unsigned long addr, int numpages, long action)
+{
+	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
+	unsigned long size = numpages * PAGE_SIZE;
+
+	if (!numpages)
+		return 0;
+
+	if (WARN_ON_ONCE(is_vmalloc_or_module_addr((void *)addr) &&
+			 is_vm_area_hugepages((void *)addr)))
+		return -EINVAL;
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	/*
+	 * On hash, the linear mapping is not in the Linux page table so
+	 * apply_to_existing_page_range() will have no effect. If in the future
+	 * the set_memory_* functions are used on the linear map this will need
+	 * to be updated.
+	 */
+	if (!radix_enabled()) {
+		int region = get_region_id(addr);
+
+		if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
+			return -EINVAL;
+	}
+#endif
+
+	return apply_to_existing_page_range(&init_mm, start, size,
+					    change_page_attr, (void *)action);
+}
-- 
2.25.1

