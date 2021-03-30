Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D3F34E056
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 06:52:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8cWW0C3fz3bmm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 15:52:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pjgBhei5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pjgBhei5; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8cVc3rdmz302T
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 15:51:52 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id k8so1680459pgf.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 21:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yrcmuHSFIVUiGAurtLkv3PPesy3ExZcTZxT9rXmJUV0=;
 b=pjgBhei52hhA07CXT2MzbGmNGa5moRs7zkDiE1m39Yu5+G9v1LawAq+8j6Qdrs0qNs
 egO7A5XeZ89NQ2UfmvznYE/FzbNgxd0UyYigK8LZZPd3hWwm3xIep8zNvIGypAXOA48e
 lotBpQPvrKyalgEPis213eLfC1jIu8IfrqzCfTxtBYgF35DmGVIWsYV8CSngbDlz/dCE
 U2NKsMSP1MFiScn00J995qWRZvpD79K0YGIfK74S/0gR5z4bYGFP+LVuGVrA/SraOKJ4
 itoeVTiY6JK+b0OqUjn7S2HfgCkAs7L8Lg6sRQgdytaXRnLq3o4dsxVsaxoL+ZNIYN2B
 7b8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yrcmuHSFIVUiGAurtLkv3PPesy3ExZcTZxT9rXmJUV0=;
 b=fmZBMmy1UDo/Vc+LCaiCqAY9R8Ul5h04kVYornh9jybdzbmBHA//+hGJzFCNklOfig
 W4J//njT9FX7LyPsrSnK0sMhjMcI9NmAfOwra9H7sB29QQBNByb3cJjrhaYWyHRpoO3P
 revQDNqyywHbfuuwLmCkto6Zn90Y+/V9jGZ8Tw8ZtJhQsjd9vLpWXo2lxL2Wn2Cf88UX
 qvrnNsf8wbtKiYkyeK0wXXWkbTXm4yxpN2yaQGroY93i18XN0HEXCJoQxJ+8URiHRevh
 HiHOFu+PhRUzbvpWybrEYov+L8GbiZNd2tEnigG4HRhKXCS2ovQ0LI25e0z8MvX0BGhQ
 OQkg==
X-Gm-Message-State: AOAM533yyi9CaNLEiCQ35E7IAAAIEtad3gRef8chggEABcjThZ6XVRBW
 aFInxdPIysKyMUxMR2uMyi6g+tL6hK/mKA==
X-Google-Smtp-Source: ABdhPJxDO0Mc0lkXVCOukDEnL40XQ2PxjTnxbIMCqm7do1b55NCC/HRpOG296QBZlSNyOKfiWtYHlA==
X-Received: by 2002:a63:ec50:: with SMTP id r16mr26195502pgj.451.1617079910172; 
 Mon, 29 Mar 2021 21:51:50 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id a18sm14136574pfa.18.2021.03.29.21.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 21:51:49 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 01/10] powerpc/mm: Implement set_memory() routines
Date: Tue, 30 Mar 2021 15:51:23 +1100
Message-Id: <20210330045132.722243-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330045132.722243-1-jniethe5@gmail.com>
References: <20210330045132.722243-1-jniethe5@gmail.com>
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
 naveen.n.rao@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

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

On hash the linear mapping is not kept in the linux pagetable, so this
will not change the protection if used on that range. Currently these
functions are not used on the linear map so just WARN for now.

These functions do nothing if STRICT_KERNEL_RWX is not enabled.

Reviewed-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
[jpn: -rebase on next plus "powerpc/mm/64s: Allow STRICT_KERNEL_RWX again"
      - WARN on hash linear map]
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v10: WARN if trying to change the hash linear map
---
 arch/powerpc/Kconfig                  |  1 +
 arch/powerpc/include/asm/set_memory.h | 32 ++++++++++
 arch/powerpc/mm/Makefile              |  2 +-
 arch/powerpc/mm/pageattr.c            | 88 +++++++++++++++++++++++++++
 4 files changed, 122 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/mm/pageattr.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index fc7f5c5933e6..4498a27ac9db 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -135,6 +135,7 @@ config PPC
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
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
index 3b4e9e4e25ea..d8a08abde1ae 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -5,7 +5,7 @@
 
 ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
 
-obj-y				:= fault.o mem.o pgtable.o mmap.o maccess.o \
+obj-y				:= fault.o mem.o pgtable.o mmap.o maccess.o pageattr.o \
 				   init_$(BITS).o pgtable_$(BITS).o \
 				   pgtable-frag.o ioremap.o ioremap_$(BITS).o \
 				   init-common.o mmu_context.o drmem.o
diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
new file mode 100644
index 000000000000..9efcb01088da
--- /dev/null
+++ b/arch/powerpc/mm/pageattr.c
@@ -0,0 +1,88 @@
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
+ *
+ * NOTE: can be dangerous to call without STRICT_KERNEL_RWX
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
+		pte = pte_mkwrite(pte);
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
+	spin_unlock(&init_mm.page_table_lock);
+
+	return 0;
+}
+
+int change_memory_attr(unsigned long addr, int numpages, long action)
+{
+	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
+	unsigned long sz = numpages * PAGE_SIZE;
+
+	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
+		return 0;
+
+	if (numpages <= 0)
+		return 0;
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (WARN_ON_ONCE(!radix_enabled() &&
+		     get_region_id(addr) == LINEAR_MAP_REGION_ID)) {
+		return -1;
+	}
+#endif
+
+	return apply_to_existing_page_range(&init_mm, start, sz,
+					    change_page_attr, (void *)action);
+}
-- 
2.25.1

