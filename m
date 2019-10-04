Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D981CB58C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 09:57:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l2KT3ZJQzDqBy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 17:57:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="WmvP+8v0"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mFPAc+GO"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l2BZ6TsPzDqbk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 17:51:28 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 00FCA51D;
 Fri,  4 Oct 2019 03:51:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 04 Oct 2019 03:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=2+HlUQKeP5NUw
 AG28BrzwAWEjn5cqHZMQi5EL+7gFgI=; b=WmvP+8v0jgZcuNaAlcJ6vUahsqOck
 MhIQq74GDHHI7SQX1b7KQs0zuqXg/q7mdAq4glTHM99tGdtRk048KRC8UyP3YwjK
 IOWySHExsPmJN53eGgEEOCYfTSp2XMliZyzKXIsysOkE5TvYduu959rDFF4FffIR
 0BQcP2qSMwOkF+sE8qd/x2BjBX2p2nlkEB+cPdYvuJMUnVGdeVTHOsChSk1d2n46
 2q9N7EsF/5yGMBr1B74vDNOyuNktYlpYmVM5YRLAg9mxN3gc4/NfPVY0CvD0RwVJ
 YbsS6LNHN+aMUCGSWgfYWZuJYTM9jA8FsILKXxEcfhKSUbtBDCPGAaMyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=2+HlUQKeP5NUwAG28BrzwAWEjn5cqHZMQi5EL+7gFgI=; b=mFPAc+GO
 xU/bI5PvCOwzRDoAtnv8dV+B6WhaXKj9Z9cDY5qqRVJ/G7bnHtwm8hCVA842u38+
 L1WqY3ARCLxh3SWwrckfp17W/z11cQkfD+HBC6JHMXzEARKmZcB625VqYfjoW4sP
 DV8E82bK9oOxRwWn52J75jY+BYMJZURqfKTHe5SC1Z0Gk/1Dikpg4JcGzWwSo6Po
 ZvRfhJUPGz/l7g40sjaA4B7FASlORMIIv7Xhm8gjPROd+8fRte07Mq140rnQ2xwk
 0HCyQ8frSgJzCZcv5/phqwmKnD7eMPJq6Fy5FeP5WiIWmegHkl2vFucXbTUf8v19
 ipfvQWqPRS1NLA==
X-ME-Sender: <xms:_fmWXdpa-5eDqM7To9dCYqikEbSXHcdXrZuJgGFai9eptyz0ni4Aag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrhedtgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvuf
 ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
 hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvvddrleelrdekvd
 druddtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdr
 tggtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:_fmWXYl_TzwZ8NWSPU4tNqdTNKnLJ1_-p94JC66TDZNGLvWy8duQUQ>
 <xmx:_fmWXS-JNuEGbVYHNsGARooA3NrypNEqtTGuczEc52aZoztCfolRHQ>
 <xmx:_fmWXcC9Vkf5nPIogen53p8YXt5Emo45QENixqNUwkjLes2anCoTlw>
 <xmx:_fmWXWc-_-gq8QkMVEaDHikKpLlA8sQXc1tLuzk6iE1dmHsjZOjFzQ>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 776BE80061;
 Fri,  4 Oct 2019 03:51:22 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/4] powerpc/mm: Implement set_memory() routines
Date: Fri,  4 Oct 2019 17:50:47 +1000
Message-Id: <20191004075050.73327-2-ruscur@russell.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191004075050.73327-1-ruscur@russell.cc>
References: <20191004075050.73327-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, joel@jms.id.au,
 Russell Currey <ruscur@russell.cc>, rashmica.g@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The set_memory_{ro/rw/nx/x}() functions are required for STRICT_MODULE_RWX,
and are generally useful primitives to have.  This implementation is
designed to be completely generic across powerpc's many MMUs.

It's possible that this could be optimised to be faster for specific
MMUs, but the focus is on having a generic and safe implementation for
now.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/Kconfig                  |  1 +
 arch/powerpc/include/asm/set_memory.h | 32 ++++++++++++++
 arch/powerpc/mm/Makefile              |  1 +
 arch/powerpc/mm/pageattr.c            | 60 +++++++++++++++++++++++++++
 4 files changed, 94 insertions(+)
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/mm/pageattr.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 3e56c9c2f16e..8f7005f0d097 100644
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
index 000000000000..fe3ecbfb8e10
--- /dev/null
+++ b/arch/powerpc/mm/pageattr.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * MMU-generic set_memory implementation for powerpc
+ *
+ * Author: Russell Currey <ruscur@russell.cc>
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
+static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
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
2.23.0

