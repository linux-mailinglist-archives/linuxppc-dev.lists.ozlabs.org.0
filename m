Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F030D45450
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 07:52:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Q8rt0WHnzDrQ4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 15:52:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="2EY4vCEf"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jNoiZEoM"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Q8q227bQzDr4d
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 15:50:53 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B5BAF220AB;
 Fri, 14 Jun 2019 01:50:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 14 Jun 2019 01:50:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=O1MGuxb4E3KY6lySswpapdh1f/
 wVb0DtMIWHPl2wjz4=; b=2EY4vCEfAFDSqr8oc+l9nO2hoQ+EeOdD8bhKbIRz7Y
 Gvd2HHhS7CDLPZl2cOm7t8AphOxPbZWJXd6Jz97EGHwfJsWZmG69rxOVBqwmxosw
 BnOEOPHSAZzJa8Wu+raFYhQOyWSfHjOkLrd3fKxU1t9X7X/KWb97GyTbXO9W60x8
 cinUgGTf7oD8y2Tm97jpc8V7a/dRNj2nHwlTZTCGpLNwyT8sHCTW7qCIw6ZMF8tn
 tDAXpu1U5Uj7h+9QVWKZAY/4uz+lyJEw5uZIT6dAaO8O8sv7Xrgr+La3STsFNi5G
 1OlhAXCsKHYTju6C7/rlItzmRRtZ/kyCccx9nixtZ+yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=O1MGuxb4E3KY6lySs
 wpapdh1f/wVb0DtMIWHPl2wjz4=; b=jNoiZEoMcROSEt8lwV3wGlX9EOzhRvP3s
 NQFiGkd/8kOJcRBZJUKRAaoKW4tJfcBgwVCOaVbJbeBS54ncsm6pQLrNzM+nYAcN
 BDf5WlWvflVindKCsscz8183MXZuHs8+w15fGx4gifE1myxXff4rZUfDGwNd0anr
 bPQ3nfkfkCNROfQ1iCPMq9UhuR3JeD7ugf3qIOc8nuzuC+5shhlJk6ctF0+cCcdB
 aGHMtzytmjd8kTrYpIDinUvuAadO+ePOB9iWiFfH5l3kVmiKMD2CgWbKYYM3oRFd
 OrjccBfjmdEfFq7vOBxeXTT4cOwz+tMz2JH0GQ3AfzxT394VyN8fg==
X-ME-Sender: <xms:sDUDXbp5E84MCO-YlEPLNL6zRjiAuxM3ZJ9Fsns4IGpSaY4OOAVHKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeitddguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdduhedmnecujfgurhephffvufffkffoggfgsedtkeertdertddt
 necuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhushhsvg
 hllhdrtggtqeenucfkphepuddvvddrleelrdekvddruddtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggtnecuvehluhhsthgvrhfuihiivg
 eptd
X-ME-Proxy: <xmx:sDUDXTE2-hOYf4beXrAh3G07SBRCG3xDw7iR99u9ORj7Jersqq8RNw>
 <xmx:sDUDXYLUtd_z31qT6EgloMBz9adEZaVgYwNuLjN8r1JqrejPrakCxA>
 <xmx:sDUDXQjgdKui6t8vtyDAVT_Te4Pje-S5cRao_0uJjgvA1uRZ7hqCww>
 <xmx:sDUDXeU-nVxv6XQYIsOSx4y_HpI7WRNtEiZTTJP1ATTKTX5Kt9STgA>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 25596380086;
 Fri, 14 Jun 2019 01:50:37 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/mm: Implement STRICT_MODULE_RWX
Date: Fri, 14 Jun 2019 15:50:13 +1000
Message-Id: <20190614055013.21014-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.22.0
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
Cc: Russell Currey <ruscur@russell.cc>, kernel-hardening@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Strict module RWX is just like strict kernel RWX, but for modules - so
loadable modules aren't marked both writable and executable at the same
time.  This is handled by the generic code in kernel/module.c, and
simply requires the architecture to implement the set_memory() set of
functions, declared with ARCH_HAS_SET_MEMORY.

There's nothing other than these functions required to turn
ARCH_HAS_STRICT_MODULE_RWX on, so turn that on too.

With STRICT_MODULE_RWX enabled, there are as many W+X pages at runtime
as there are with CONFIG_MODULES=n (none), so in Russel's testing it works
well on both Hash and Radix book3s64.

There's a TODO in the code for also applying the page permission changes
to the backing pages in the linear mapping: this is pretty simple for
Radix and (seemingly) a lot harder for Hash, so I've left it for now
since there's still a notable security benefit for the patch as-is.

Technically can be enabled without STRICT_KERNEL_RWX, but
that doesn't gets you a whole lot, so we should leave it off by default
until we can get STRICT_KERNEL_RWX to the point where it's enabled by
default.

Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
Changes from v1 (sent by Christophe):
 - return if VM_FLUSH_RESET_PERMS is set

 arch/powerpc/Kconfig                  |  2 +
 arch/powerpc/include/asm/set_memory.h | 32 ++++++++++
 arch/powerpc/mm/Makefile              |  2 +-
 arch/powerpc/mm/pageattr.c            | 85 +++++++++++++++++++++++++++
 4 files changed, 120 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/mm/pageattr.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8c1c636308c8..3d98240ce965 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -131,7 +131,9 @@ config PPC
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC64
+	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
+	select ARCH_HAS_STRICT_MODULE_RWX	if PPC_BOOK3S_64 || PPC32
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE	if PPC64
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
new file mode 100644
index 000000000000..4b9683f3b3dd
--- /dev/null
+++ b/arch/powerpc/include/asm/set_memory.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+#ifndef _ASM_POWERPC_SET_MEMORY_H
+#define _ASM_POWERPC_SET_MEMORY_H
+
+#define SET_MEMORY_RO	1
+#define SET_MEMORY_RW	2
+#define SET_MEMORY_NX	3
+#define SET_MEMORY_X	4
+
+int change_memory(unsigned long addr, int numpages, int action);
+
+static inline int set_memory_ro(unsigned long addr, int numpages)
+{
+	return change_memory(addr, numpages, SET_MEMORY_RO);
+}
+
+static inline int set_memory_rw(unsigned long addr, int numpages)
+{
+	return change_memory(addr, numpages, SET_MEMORY_RW);
+}
+
+static inline int set_memory_nx(unsigned long addr, int numpages)
+{
+	return change_memory(addr, numpages, SET_MEMORY_NX);
+}
+
+static inline int set_memory_x(unsigned long addr, int numpages)
+{
+	return change_memory(addr, numpages, SET_MEMORY_X);
+}
+
+#endif
diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
index 0f499db315d6..b683d1c311b3 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -7,7 +7,7 @@ ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
 
 obj-y				:= fault.o mem.o pgtable.o mmap.o \
 				   init_$(BITS).o pgtable_$(BITS).o \
-				   pgtable-frag.o \
+				   pgtable-frag.o pageattr.o \
 				   init-common.o mmu_context.o drmem.o
 obj-$(CONFIG_PPC_MMU_NOHASH)	+= nohash/
 obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s32/
diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
new file mode 100644
index 000000000000..41baf92f632b
--- /dev/null
+++ b/arch/powerpc/mm/pageattr.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Page attribute and set_memory routines
+ *
+ * Derived from the arm64 implementation.
+ *
+ * Author: Russell Currey <ruscur@russell.cc>
+ *
+ * Copyright 2019, IBM Corporation.
+ *
+ */
+
+#include <linux/mm.h>
+#include <linux/set_memory.h>
+#include <linux/vmalloc.h>
+
+#include <asm/mmu.h>
+#include <asm/page.h>
+#include <asm/pgtable.h>
+
+static int change_page_ro(pte_t *ptep, pgtable_t token, unsigned long addr, void *data)
+{
+	set_pte_at(&init_mm, addr, ptep, pte_wrprotect(READ_ONCE(*ptep)));
+	return 0;
+}
+
+static int change_page_rw(pte_t *ptep, pgtable_t token, unsigned long addr, void *data)
+{
+	set_pte_at(&init_mm, addr, ptep, pte_mkwrite(READ_ONCE(*ptep)));
+	return 0;
+}
+
+static int change_page_nx(pte_t *ptep, pgtable_t token, unsigned long addr, void *data)
+{
+	set_pte_at(&init_mm, addr, ptep, pte_exprotect(READ_ONCE(*ptep)));
+	return 0;
+}
+
+static int change_page_x(pte_t *ptep, pgtable_t token, unsigned long addr, void *data)
+{
+	set_pte_at(&init_mm, addr, ptep, pte_mkexec(READ_ONCE(*ptep)));
+	return 0;
+}
+
+int change_memory(unsigned long addr, int numpages, int action)
+{
+	unsigned long size = numpages * PAGE_SIZE;
+	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
+	unsigned long end = start + size;
+	struct vm_struct *area;
+	int ret;
+
+	if (!numpages)
+		return 0;
+
+	// only operate on VM areas for now
+	area = find_vm_area((void *)addr);
+	if (!area || end > (unsigned long)area->addr + area->size ||
+	    !(area->flags & VM_ALLOC) || (area->flags & VM_FLUSH_RESET_PERMS))
+		return -EINVAL;
+
+	// TODO: also apply change to the backing pages in the linear mapping
+
+	switch (action) {
+	case SET_MEMORY_RO:
+		ret = apply_to_page_range(&init_mm, start, size, change_page_ro, NULL);
+		break;
+	case SET_MEMORY_RW:
+		ret = apply_to_page_range(&init_mm, start, size, change_page_rw, NULL);
+		break;
+	case SET_MEMORY_NX:
+		ret = apply_to_page_range(&init_mm, start, size, change_page_nx, NULL);
+		break;
+	case SET_MEMORY_X:
+		ret = apply_to_page_range(&init_mm, start, size, change_page_x, NULL);
+		break;
+	default:
+		WARN_ON(true);
+		return -EINVAL;
+	}
+
+	flush_tlb_kernel_range(start, end);
+	return ret;
+}
-- 
2.22.0

