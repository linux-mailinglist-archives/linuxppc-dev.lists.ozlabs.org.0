Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB17382318
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 05:34:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk4W65WWJz3bwm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 13:34:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ECeJEuQr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ECeJEuQr; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk4V72YmVz2xZG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 13:33:35 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id 22so3632945pfv.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 20:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4IVi5T2xb7Q8tzYcYlA9sCQtJxuxd5mkqFUadleClqU=;
 b=ECeJEuQrwW4LE1uuAGObVWgfbp346ic58YNL1Q+BRDts4zVx6fpwzaU62/09w1TthQ
 i8EuQWFEm2rfo6rHEfPVEIYa43a5PNxZOlVo7M0bfiqpOeUClMrkT9tACK3XAPgW/OMk
 Aj05+INhBCliqS3J28aG8etF3/IWt4NWkENj+ECuMEDNbjfW3738ytbFx/5+tzrEiOPn
 UCM7qYk1n964VQ+3h3+KPq6+xClrVlyIzpRj8ajJLD+3v+BFF8jxQGIn4ZGHzYrj6PJM
 9nkbP0lug97VH7i3xbaqNQ1Y3Ova0EqPqKNG5g/LOPIHasd/hkQaR/2NXmsuLxmnZCao
 vDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4IVi5T2xb7Q8tzYcYlA9sCQtJxuxd5mkqFUadleClqU=;
 b=Jytyc90OZh2L705gDHvyMScv9J5Qr/MUapixSjb84+y4/gSvnNxSQ15IvccC+xGcJD
 JBAPz5WUjR7LQNhiqxH1d32/m5og0FyQBP8GUn9ON6gXu+wpKl8JrTOlm1mgSJRNL5VH
 xtKjAPP0OIK0EoZm1PwMS/UUl+nKMBM3RAUsFE3AS5Zh1XtZOuXwC/ecclXAI9rMz9q9
 SnteYeUe5N9YtcUqzGORUSw5wTEqYPBPv2J/bMdL/dp1opiKZAns1EeN4m3p4R4GB0fk
 +GD/eWyTxkJFh712XUHsTokuoZEEoxaG29vXrywRDHgLSHHgg6zj962tW9pf5bM6g1kC
 8wqg==
X-Gm-Message-State: AOAM532HZSDlJHgWfeIGx4gdlsGFmUbDKxkPfBz+pFNob1x9jIdI5iK2
 /35T1k9O5lzFy7i0g9jqi2vsFOzm8lg=
X-Google-Smtp-Source: ABdhPJwTqamZladg24+oDQX4LPxNqduY9rAWIWfCQrWzwMpmhz03dIG9o0qRK/ABEr7POX/bS6UaXQ==
X-Received: by 2002:a05:6a00:d41:b029:2db:1549:219e with SMTP id
 n1-20020a056a000d41b02902db1549219emr5227816pfv.71.1621222412580; 
 Sun, 16 May 2021 20:33:32 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id s3sm9785418pgs.62.2021.05.16.20.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 20:33:32 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v14 1/9] powerpc/mm: Implement set_memory() routines
Date: Mon, 17 May 2021 13:28:02 +1000
Message-Id: <20210517032810.129949-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517032810.129949-1-jniethe5@gmail.com>
References: <20210517032810.129949-1-jniethe5@gmail.com>
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
index 3f863dd21374..cce0a137b046 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -138,6 +138,7 @@ config PPC
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

