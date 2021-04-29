Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2B436E391
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 05:17:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW0zK5QmQz30DN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 13:17:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=B67SvtJq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=B67SvtJq; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW0yt33yVz2y0N
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 13:16:37 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id md17so6473710pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 20:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IMQgOsq05TPE7kTgk0iHtKv4vFlBvlJtSrzQ55RZOfc=;
 b=B67SvtJqt53P3RFMz85G0/Nl2EcLZBG9c6nvHf6W3/M2kS46MhFkHcUEwAUh1PbspD
 pYZESoXCO7VQJw1Rh35d3g72Y6HxZbkpQQCLT0PTt8D8Czh68yr031CFjPLQBpJEaF6U
 xpn/7iljVSPglk7VpAPLive42Jbqp7dvPOxGUyFMmuHFoSVkT8mtRcZafEtp++SAeKSX
 VEBQT0uJUFLzG1fBrzw0NDYJfwqgOdC0rWjVlKNIYF+kD6hli7MjEd3cYkPWbl343GSl
 aAcaYgEBAaUsPVhQzKMifEviNnp2q6HR5BKCFnhO5N6Vbswi8jqBF/CczNmt4K+MGQ6E
 BfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IMQgOsq05TPE7kTgk0iHtKv4vFlBvlJtSrzQ55RZOfc=;
 b=YQlZI76gzGeHODakYrWIkLNu1GdbPWEfV8XNfyluivTwMdJ2Yk3bdFdKIm0k4KHonI
 1fr14EmsEvwrm9p7ZvNfda8dVdVwim/oHBNUR3laVsYsnm+ds+ZQ+GifHPqvZfdSxQkT
 rSjP1FsQGipx3iPcDGHxk0119U2k3pUR8FEX/YjkAGJ2G6tXEnWZfXgg7porO5oA1S0I
 eUHX4cuBHtLD8EnRBgNU/0JFrtnHVopl7V6Rya9wUJwJ3z6qZblN+ja7IkwsyR2yFsjm
 hTlB+cHTTDxcV+BsMEGqXj+TgLr3ERxlb2TYJ1yfrcdEeQHkqyFjusXAOk5uo+Audzvo
 0svg==
X-Gm-Message-State: AOAM531Y4NTg4URPCec/tGD1wibRUb/ZCiNffh8tQPi7dwKBAcuGYU3H
 chJGON1f2BHj6YcDVoPsXKDLXe4a8RM=
X-Google-Smtp-Source: ABdhPJyK98YNXIXKhLJi6q/SrvroA63MBAQFQNrqzH1x9VBenDKQdFuQ5rk6wiBDifHAP1gFsyw3SQ==
X-Received: by 2002:a17:90b:190f:: with SMTP id
 mp15mr4662804pjb.225.1619666195456; 
 Wed, 28 Apr 2021 20:16:35 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id l16sm3650742pjl.32.2021.04.28.20.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 20:16:35 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v11 1/9] powerpc/mm: Implement set_memory() routines
Date: Thu, 29 Apr 2021 13:15:54 +1000
Message-Id: <20210429031602.2606654-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429031602.2606654-1-jniethe5@gmail.com>
References: <20210429031602.2606654-1-jniethe5@gmail.com>
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
---
 arch/powerpc/Kconfig                  |   1 +
 arch/powerpc/include/asm/set_memory.h |  10 +++
 arch/powerpc/mm/Makefile              |   2 +-
 arch/powerpc/mm/pageattr.c            | 105 ++++++++++++++++++++++++++
 4 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/mm/pageattr.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index cb2d44ee4e38..94c34932a74b 100644
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
index 000000000000..d1cd69b1a43a
--- /dev/null
+++ b/arch/powerpc/include/asm/set_memory.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_SET_MEMORY_H
+#define _ASM_POWERPC_SET_MEMORY_H
+
+int set_memory_ro(unsigned long addr, int numpages);
+int set_memory_rw(unsigned long addr, int numpages);
+int set_memory_nx(unsigned long addr, int numpages);
+int set_memory_x(unsigned long addr, int numpages);
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
index 000000000000..3b4aa72e555e
--- /dev/null
+++ b/arch/powerpc/mm/pageattr.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * MMU-generic set_memory implementation for powerpc
+ *
+ * Copyright 2019-2021, IBM Corporation.
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
+ * Invalidating the pte means there are situations where this will not work
+ * when in theory it should.
+ * For example:
+ * - removing write from page whilst it is being executed
+ * - setting a page read-only whilst it is being read by another CPU
+ *
+ */
+static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
+{
+	pte_t (*fn)(pte_t) = data;
+	pte_t pte;
+
+	spin_lock(&init_mm.page_table_lock);
+
+	/* invalidate the PTE so it's safe to modify */
+	pte = ptep_get_and_clear(&init_mm, addr, ptep);
+	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+
+	/* modify the PTE bits as desired, then apply */
+	pte = fn(pte);
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
+static int change_memory_attr(unsigned long addr, int numpages, pte_t (*fn)(pte_t))
+{
+	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
+	unsigned long size = numpages * PAGE_SIZE;
+
+	if (!numpages)
+		return 0;
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
+					    change_page_attr, fn);
+}
+
+int set_memory_ro(unsigned long addr, int numpages)
+{
+	return change_memory_attr(addr, numpages, pte_wrprotect);
+}
+
+static pte_t pte_mkdirtywrite(pte_t pte)
+{
+	return pte_mkwrite(pte_mkdirty(pte));
+}
+
+int set_memory_rw(unsigned long addr, int numpages)
+{
+	return change_memory_attr(addr, numpages, pte_mkdirtywrite);
+}
+
+int set_memory_nx(unsigned long addr, int numpages)
+{
+	return change_memory_attr(addr, numpages, pte_exprotect);
+}
+
+int set_memory_x(unsigned long addr, int numpages)
+{
+	return change_memory_attr(addr, numpages, pte_mkexec);
+}
-- 
2.25.1

