Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1A11E839
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 08:21:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453kwW3Wh6zDqQH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 16:21:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="BU1cJkg5"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453kv258SzzDqP5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 16:20:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 453ktt3LDPz9vDbS;
 Wed, 15 May 2019 08:20:22 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=BU1cJkg5; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 95-jRXc61RUu; Wed, 15 May 2019 08:20:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 453ktt2Brtz9vDbR;
 Wed, 15 May 2019 08:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557901222; bh=pbPsZWHgsG18WLzIgAsalkAzc3NcABdvO82mAnSRanI=;
 h=From:Subject:To:Cc:Date:From;
 b=BU1cJkg5nRmsWyhdQYUxNb+jq1ORO3+xcCtJoNkPnL93K6khYka3V2AzbTA9wU1gl
 tcr8GLdCk0Vg91WWlDKBGxVhkRbBVOLzJ7F0BV8Ipd6wXaVxJtY566aG5WqHBrb+9e
 LYukW5Mle0KWlljVxpk+yOoI9DpjL0/VvQuQIxA8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 30D358B77A;
 Wed, 15 May 2019 08:20:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TLvEQgxFveHK; Wed, 15 May 2019 08:20:23 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 067538B756;
 Wed, 15 May 2019 08:20:23 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id CF744682A6; Wed, 15 May 2019 06:20:22 +0000 (UTC)
Message-Id: <df502ffe07caa38c46b0144fc824fff447f4105b.1557901092.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH] powerpc/mm: Implement STRICT_MODULE_RWX
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Russell Currey <ruscur@russell.cc>
Date: Wed, 15 May 2019 06:20:22 +0000 (UTC)
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
 Generic implementation based on Russel's patch ("powerpc/mm/book3s64: Implement STRICT_MODULE_RWX")
 Untested

 arch/powerpc/Kconfig                  |  2 +
 arch/powerpc/include/asm/set_memory.h | 32 +++++++++++++
 arch/powerpc/mm/Makefile              |  2 +-
 arch/powerpc/mm/pageattr.c            | 85 +++++++++++++++++++++++++++++++++++
 4 files changed, 120 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/mm/pageattr.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d7996cfaceca..1f1423e3d818 100644
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
index 000000000000..3e8f2c203a00
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
+	    !(area->flags & VM_ALLOC))
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
2.13.3

