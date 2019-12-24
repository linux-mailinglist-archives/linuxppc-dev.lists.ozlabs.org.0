Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A863129DFA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 06:59:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hlsy3kzLzDqMg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 16:59:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="eHLEmCQ7"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Do92WA0M"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hlnq388szDqN6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 16:55:58 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 80A6522036;
 Tue, 24 Dec 2019 00:55:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 24 Dec 2019 00:55:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=/ZAqtJdy+ln43
 ioqFQJBYAV6EX+9TBgNroal6pRoyiA=; b=eHLEmCQ7ftwOduXWG7E5KB3TYj48d
 Z2dQiqLAAZmDIfCgqpdc2aS2mu+rQ2z6PLq+XYNc9diFsNjqHdBayz6p+An8UfoF
 czoGB/PpWP29dl10Qcz56zJ7FgH2WMPRAQt0pUEnmgiX7jeuEdTgFzBYU+fL0+8u
 YfGZcMtKBlxNEQ0xnQmVpIMl/UZndWwPZrEIRoydU+5G/3TEHVla5wqPpn6Kw+l6
 bKivtbXlMEhzKbnZJryUODf9KuDY6y2QLxftceEo63ARFHge4/YucWk4oO7YYhHi
 N3GHMyUD5J/KrrP02OoB0Gdr0i+vGJ5qWwRGcMJfJK0v2RRpqqXlIRbbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=/ZAqtJdy+ln43ioqFQJBYAV6EX+9TBgNroal6pRoyiA=; b=Do92WA0M
 93EFff069P0gAjD/+Cu/Fv7+7sesresmXxESFxKwcs4Ymdaau352pSlJdCwD6M11
 Xo6c760BAfA4MKjUTSrm5XY9HiIjLOLg9Ws2DM8QvQ8QhVtP4oZ4xy+TNwLYfLee
 hrZM09F8070WA4+A0y6ZXFFxT5+aOhaydomRqjyWltQS4Nq7kIxPgdjgX3YkZW3i
 ZUqr41G7UN2hrUA6SUzzCU9eagXu+0ks/4b7vlM0mCFGKPEHP/q3UlcPsD14UNi0
 pC3J613TeVsKVP0hiDixbB8HSXs0EdhwFy0YdxaJPe0xpUZAqzlhfTkR1AB/trT7
 qi7LPOZ/Y/lXCQ==
X-ME-Sender: <xms:bKgBXkO2pPr9s1Jhnj0Wl1HCzRUUD0NBaQvPL87VmCgaNepYEp0DGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddvuddgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
 fufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
 vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecukfhppeduvddvrdelledrke
 dvrddutdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhl
 rdgttgenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:bKgBXuygWhvpFV2nGZHTj6Ciq75xkz-xKToFEZEAdkeZZZpNmhhjdQ>
 <xmx:bKgBXkXsB2agVORYohmu81jCBxw05fyNbFcyiB1seFhBvxgPWvtehg>
 <xmx:bKgBXgPzG6ktni5Z7F1HDnU0rFr_KOCEpW7NDIyQaEXXpOf1tzYoRA>
 <xmx:bKgBXroP5jXEeTw5TrqJU4twjI1xNlVkeHm827YIktWaIapWdrDs7w>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8299C30609A0;
 Tue, 24 Dec 2019 00:55:53 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 1/5] powerpc/mm: Implement set_memory() routines
Date: Tue, 24 Dec 2019 16:55:41 +1100
Message-Id: <20191224055545.178462-2-ruscur@russell.cc>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191224055545.178462-1-ruscur@russell.cc>
References: <20191224055545.178462-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au, Russell Currey <ruscur@russell.cc>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The set_memory_{ro/rw/nx/x}() functions are required for STRICT_MODULE_RWX,
and are generally useful primitives to have.  This implementation is
designed to be completely generic across powerpc's many MMUs.

It's possible that this could be optimised to be faster for specific
MMUs, but the focus is on having a generic and safe implementation for
now.

This implementation does not handle cases where the caller is attempting
to change the mapping of the page it is executing from, or if another
CPU is concurrently using the page being altered.  These cases likely
shouldn't happen, but a more complex implementation with MMU-specific code
could safely handle them, so that is left as a TODO for now.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/Kconfig                  |  1 +
 arch/powerpc/include/asm/set_memory.h | 32 +++++++++++
 arch/powerpc/mm/Makefile              |  1 +
 arch/powerpc/mm/pageattr.c            | 83 +++++++++++++++++++++++++++
 4 files changed, 117 insertions(+)
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/mm/pageattr.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1ec34e16ed65..f0b9b47b5353 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -133,6 +133,7 @@ config PPC
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
+	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
new file mode 100644
index 000000000000..5230ddb2fefd
--- /dev/null
+++ b/arch/powerpc/include/asm/set_memory.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_SET_MEMORY_H
+#define _ASM_POWERPC_SET_MEMORY_H
+
+#define SET_MEMORY_RO	1
+#define SET_MEMORY_RW	2
+#define SET_MEMORY_NX	3
+#define SET_MEMORY_X	4
+
+int change_memory_attr(unsigned long addr, int numpages, int action);
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
index 5e147986400d..d0a0bcbc9289 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -20,3 +20,4 @@ obj-$(CONFIG_HIGHMEM)		+= highmem.o
 obj-$(CONFIG_PPC_COPRO_BASE)	+= copro_fault.o
 obj-$(CONFIG_PPC_PTDUMP)	+= ptdump/
 obj-$(CONFIG_KASAN)		+= kasan/
+obj-$(CONFIG_ARCH_HAS_SET_MEMORY) += pageattr.o
diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
new file mode 100644
index 000000000000..15d5fb04f531
--- /dev/null
+++ b/arch/powerpc/mm/pageattr.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * MMU-generic set_memory implementation for powerpc
+ *
+ * Copyright 2019, IBM Corporation.
+ */
+
+#include <linux/mm.h>
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
+ * This is unsafe if the caller is attempting to change the mapping of the
+ * page it is executing from, or if another CPU is concurrently using the
+ * page being altered.
+ *
+ * TODO make the implementation resistant to this.
+ */
+static int __change_page_attr(pte_t *ptep, unsigned long addr, void *data)
+{
+	int action = *((int *)data);
+	pte_t pte_val;
+
+	// invalidate the PTE so it's safe to modify
+	pte_val = ptep_get_and_clear(&init_mm, addr, ptep);
+	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+
+	// modify the PTE bits as desired, then apply
+	switch (action) {
+	case SET_MEMORY_RO:
+		pte_val = pte_wrprotect(pte_val);
+		break;
+	case SET_MEMORY_RW:
+		pte_val = pte_mkwrite(pte_val);
+		break;
+	case SET_MEMORY_NX:
+		pte_val = pte_exprotect(pte_val);
+		break;
+	case SET_MEMORY_X:
+		pte_val = pte_mkexec(pte_val);
+		break;
+	default:
+		WARN_ON(true);
+		return -EINVAL;
+	}
+
+	set_pte_at(&init_mm, addr, ptep, pte_val);
+
+	return 0;
+}
+
+static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
+{
+	int ret;
+
+	spin_lock(&init_mm.page_table_lock);
+	ret = __change_page_attr(ptep, addr, data);
+	spin_unlock(&init_mm.page_table_lock);
+
+	return ret;
+}
+
+int change_memory_attr(unsigned long addr, int numpages, int action)
+{
+	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
+	unsigned long size = numpages * PAGE_SIZE;
+
+	if (!numpages)
+		return 0;
+
+	return apply_to_page_range(&init_mm, start, size, change_page_attr, &action);
+}
-- 
2.24.1

