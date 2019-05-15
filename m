Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B8C1E6B6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 03:32:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453cV73Bg0zDqR6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 11:31:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="gzCpwp5U"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="W/PNyCGq"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453cSb3cMhzDqNJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 11:30:38 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 2C2C024D32;
 Tue, 14 May 2019 21:30:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 14 May 2019 21:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=FJoChZCH2P4U4j6vjtOKrzOl3S
 tCxizAPafeY2sv1+Q=; b=gzCpwp5UqOsdq/CwiMo1dzaEUrVd+0Mlf93jepasH0
 xO0tInng3mcMVItblAvAE47Gb4uiIdzWbzwD+HmfApPcmAEbiyV4cVOjLM97E460
 PaPLOseirszLaqQHRXdkqpsIWcZAF5avpIwqMhm4Gw4fjHh2MMD39H1KsfXtGjBw
 81g2HPZRkZmhvxtrMs6L3XCBhU1N3SBqJPi+rEsB4FzVrzIbCFivMrEJX7EIT2Cz
 4X8QKRH1b7x7y1PE1M/P+cd4tXoew7llAa+VDEVgzYhoCoan7ojmW4K9KturnXLK
 aPJYkDqb/SI3XW8QsxcHU+SpRVtp0EiDU2l6VIx84A1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FJoChZCH2P4U4j6vj
 tOKrzOl3StCxizAPafeY2sv1+Q=; b=W/PNyCGqID62gY83WHaX3cq8SKV1JbEGe
 XqIkEAArpc4G+6Xcp4lt9iq24iL0J0yu+7QEq6XJU9adoJNULrLe1ZEph+FR01hq
 /FKYZYikgCZnbaW9pEC4zGqiXeLs2g17+luZd3I6ElqLBxXkmMihvTdqfjXLD3YP
 jjX/GB7k248I+MyEoEa7hMcf5mUQukLWbFp/1kPJoAfoYCbny5caGjQhpwpsxOJw
 e2AS7JMg3nnmWejuZEfFB2x7l442hnw8Dl4+u+ttb+wl5EMPd1jtQjdnHxBX43Vo
 vTdSmEN24H/8zIBcxjfK8tBwyDo2ORvJM8g0qJKwNtobe67fEV9fQ==
X-ME-Sender: <xms:umvbXHmwWr8qwQc-xeloF-_U-cdGulJRQkFP6bdJo1xvh7UEaP5jxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrleejgdegjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvuf
 ffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicu
 oehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvvddrleelrdekvddrud
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggt
 necuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:umvbXGVkfdR2WM5hcTQhW32YceMfBzr9s-9xnfMveeuQg03mhP3Aog>
 <xmx:umvbXCvM1KeK8kNVz6ZoP_RFnTm_C592X5vxuBBeSPaTQNrZn7p1fg>
 <xmx:umvbXOhcP6jETmPYNGAAemLaOHdleN-xaMuX4ZLP_JywkL5lLJab5g>
 <xmx:u2vbXKckSXMVQ4waFz6QGge5YloIjnyRR3f0gjUf9v7v5e8d_tlC2g>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 670E480059;
 Tue, 14 May 2019 21:30:33 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/mm/book3s64: Implement STRICT_MODULE_RWX
Date: Wed, 15 May 2019 11:30:00 +1000
Message-Id: <20190515013000.16085-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.21.0
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
Cc: Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Strict module RWX is just like strict kernel RWX, but for modules - so
loadable modules aren't marked both writable and executable at the same
time.  This is handled by the generic code in kernel/module.c, and
simply requires the architecture to implement the set_memory() set of
functions, declared with ARCH_HAS_SET_MEMORY.

The set_memory() family of functions are implemented for book3s64
MMUs (so Hash and Radix), however they could likely be adapted to work
for other platforms as well and made more generic.  I did it this way
since they're the platforms I have the most understanding of and ability
to test.

There's nothing other than these functions required to turn
ARCH_HAS_STRICT_MODULE_RWX on, so turn that on too.

With STRICT_MODULE_RWX enabled, there are as many W+X pages at runtime
as there are with CONFIG_MODULES=n (none), so in my testing it works
well on both Hash and Radix.

There's a TODO in the code for also applying the page permission changes
to the backing pages in the linear mapping: this is pretty simple for
Radix and (seemingly) a lot harder for Hash, so I've left it for now
since there's still a notable security benefit for the patch as-is.

Technically can be enabled without STRICT_KERNEL_RWX, but I don't think
that gets you a whole lot, so I think we should leave it off by default
until we can get STRICT_KERNEL_RWX to the point where it's enabled by
default.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/Kconfig                  |   2 +
 arch/powerpc/include/asm/set_memory.h |  12 +++
 arch/powerpc/mm/book3s64/Makefile     |   2 +-
 arch/powerpc/mm/book3s64/pageattr.c   | 106 ++++++++++++++++++++++++++
 4 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/mm/book3s64/pageattr.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d7996cfaceca..9e1bfa81bc5a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -131,7 +131,9 @@ config PPC
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC64
+	select ARCH_HAS_SET_MEMORY		if PPC_BOOK3S_64
 	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
+	select ARCH_HAS_STRICT_MODULE_RWX	if PPC_BOOK3S_64
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE	if PPC64
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
new file mode 100644
index 000000000000..5323a8b06f98
--- /dev/null
+++ b/arch/powerpc/include/asm/set_memory.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+#ifndef _ASM_POWERPC_SET_MEMORY_H
+#define _ASM_POWERPC_SET_MEMORY_H
+
+#ifdef CONFIG_PPC_BOOK3S_64
+int set_memory_ro(unsigned long addr, int numpages);
+int set_memory_rw(unsigned long addr, int numpages);
+int set_memory_nx(unsigned long addr, int numpages);
+int set_memory_x(unsigned long addr, int numpages);
+#endif
+
+#endif
diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index 974b4fc19f4f..09c5afadf235 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -5,7 +5,7 @@ ccflags-y	:= $(NO_MINIMAL_TOC)
 CFLAGS_REMOVE_slb.o = $(CC_FLAGS_FTRACE)
 
 obj-y				+= hash_pgtable.o hash_utils.o slb.o \
-				   mmu_context.o pgtable.o hash_tlb.o
+				   mmu_context.o pgtable.o hash_tlb.o pageattr.o
 obj-$(CONFIG_PPC_NATIVE)	+= hash_native.o
 obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_pgtable.o radix_tlb.o
 obj-$(CONFIG_PPC_4K_PAGES)	+= hash_4k.o
diff --git a/arch/powerpc/mm/book3s64/pageattr.c b/arch/powerpc/mm/book3s64/pageattr.c
new file mode 100644
index 000000000000..d6afa89fb407
--- /dev/null
+++ b/arch/powerpc/mm/book3s64/pageattr.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Page attribute and set_memory routines for Radix and Hash MMUs
+ *
+ * Derived from the arm64 implementation.
+ *
+ * Author: Russell Currey <ruscur@russell.cc>
+ *
+ * Copyright 2019, IBM Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or (at your
+ * option) any later version.
+ */
+
+#include <linux/mm.h>
+#include <linux/vmalloc.h>
+
+#include <asm/mmu.h>
+#include <asm/page.h>
+#include <asm/pgtable.h>
+
+// we need this to have a single pointer to pass into apply_to_page_range()
+struct page_change_data {
+	pgprot_t set_mask;
+	pgprot_t clear_mask;
+};
+
+static pte_t clear_pte_bit(pte_t pte, pgprot_t prot)
+{
+	return __pte(pte_val(pte) & ~pgprot_val(prot));
+}
+
+static pte_t set_pte_bit(pte_t pte, pgprot_t prot)
+{
+	return __pte(pte_val(pte) | pgprot_val(prot));
+}
+
+static int change_page_range(pte_t *ptep, pgtable_t token, unsigned long addr,
+			     void *data)
+{
+	struct page_change_data *cdata = data;
+	pte_t pte = READ_ONCE(*ptep);
+
+	pte = clear_pte_bit(pte, cdata->clear_mask);
+	pte = set_pte_bit(pte, cdata->set_mask);
+
+	set_pte_at(&init_mm, addr, ptep, pte);
+	return 0;
+}
+
+static int change_memory(unsigned long addr, int numpages, pgprot_t set_mask,
+			 pgprot_t clear_mask)
+{
+	unsigned long size = numpages * PAGE_SIZE;
+	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
+	unsigned long end = PAGE_ALIGN(start + size);
+	struct page_change_data data;
+	struct vm_struct *area;
+	int ret;
+
+	if (!numpages)
+		return 0;
+
+	// only operate on VM areas for now
+	area = find_vm_area((void *)addr);
+	if (!area || end > (unsigned long)area->addr + area->size ||
+	    !(area->flags & VM_ALLOC))
+		return -EINVAL;
+
+	// TODO: also apply change to the backing pages in the linear mapping
+	data.set_mask = set_mask;
+	data.clear_mask = clear_mask;
+
+	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
+				  &data);
+
+	flush_tlb_kernel_range(start, end);
+	return ret;
+}
+
+int set_memory_ro(unsigned long addr, int numpages)
+{
+	return change_memory(addr, numpages,
+			     __pgprot(0), __pgprot(_PAGE_WRITE));
+}
+
+int set_memory_rw(unsigned long addr, int numpages)
+{
+	return change_memory(addr, numpages,
+			     __pgprot(_PAGE_RW), __pgprot(0));
+}
+
+int set_memory_nx(unsigned long addr, int numpages)
+{
+	return change_memory(addr, numpages,
+			     __pgprot(0), __pgprot(_PAGE_EXEC));
+}
+
+int set_memory_x(unsigned long addr, int numpages)
+{
+	return change_memory(addr, numpages,
+			     __pgprot(_PAGE_EXEC), __pgprot(0));
+}
-- 
2.21.0

