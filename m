Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6F31C7951
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 20:24:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HQ3Y351czDqSR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 04:24:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HMxJ6tDTzDql9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 02:48:52 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49HMxD0N82z9v4kL;
 Wed,  6 May 2020 18:48:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Yg677AVl2HsJ; Wed,  6 May 2020 18:48:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49HMxC6kgyz9v4kH;
 Wed,  6 May 2020 18:48:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CB9198B7C5;
 Wed,  6 May 2020 18:48:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pJa51Go5bV6N; Wed,  6 May 2020 18:48:49 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 917618B777;
 Wed,  6 May 2020 18:48:49 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 5C34B65911; Wed,  6 May 2020 16:48:49 +0000 (UTC)
Message-Id: <5fa72631f2df024f73ae0d9a3f17d7e351a9764e.1588783498.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1588783498.git.christophe.leroy@csgroup.eu>
References: <cover.1588783498.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 43/45] powerpc/8xx: Implement dedicated kasan_init_region()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed,  6 May 2020 16:48:49 +0000 (UTC)
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

Implement a kasan_init_region() dedicated to 8xx that
allocates KASAN regions using huge pages.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/kasan/8xx.c    | 74 ++++++++++++++++++++++++++++++++++
 arch/powerpc/mm/kasan/Makefile |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 arch/powerpc/mm/kasan/8xx.c

diff --git a/arch/powerpc/mm/kasan/8xx.c b/arch/powerpc/mm/kasan/8xx.c
new file mode 100644
index 000000000000..db4ef44af22f
--- /dev/null
+++ b/arch/powerpc/mm/kasan/8xx.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define DISABLE_BRANCH_PROFILING
+
+#include <linux/kasan.h>
+#include <linux/memblock.h>
+#include <linux/hugetlb.h>
+#include <asm/pgalloc.h>
+
+static int __init
+kasan_init_shadow_8M(unsigned long k_start, unsigned long k_end, void *block)
+{
+	pmd_t *pmd = pmd_ptr_k(k_start);
+	unsigned long k_cur, k_next;
+
+	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pmd += 2, block += SZ_8M) {
+		pte_basic_t *new;
+
+		k_next = pgd_addr_end(k_cur, k_end);
+		k_next = pgd_addr_end(k_next, k_end);
+		if ((void *)pmd_page_vaddr(*pmd) != kasan_early_shadow_pte)
+			continue;
+
+		new = memblock_alloc(sizeof(pte_basic_t), SZ_4K);
+		if (!new)
+			return -ENOMEM;
+
+		*new = pte_val(pte_mkhuge(pfn_pte(PHYS_PFN(__pa(block)), PAGE_KERNEL)));
+
+		hugepd_populate_kernel((hugepd_t *)pmd, (pte_t *)new, PAGE_SHIFT_8M);
+		hugepd_populate_kernel((hugepd_t *)pmd + 1, (pte_t *)new, PAGE_SHIFT_8M);
+	}
+	return 0;
+}
+
+int __init kasan_init_region(void *start, size_t size)
+{
+	unsigned long k_start = (unsigned long)kasan_mem_to_shadow(start);
+	unsigned long k_end = (unsigned long)kasan_mem_to_shadow(start + size);
+	unsigned long k_cur;
+	int ret;
+	void *block;
+
+	block = memblock_alloc(k_end - k_start, SZ_8M);
+	if (!block)
+		return -ENOMEM;
+
+	if (IS_ALIGNED(k_start, SZ_8M)) {
+		kasan_init_shadow_8M(k_start, ALIGN_DOWN(k_end, SZ_8M), block);
+		k_cur = ALIGN_DOWN(k_end, SZ_8M);
+		if (k_cur == k_end)
+			goto finish;
+	} else {
+		k_cur = k_start;
+	}
+
+	ret = kasan_init_shadow_page_tables(k_start, k_end);
+	if (ret)
+		return ret;
+
+	for (; k_cur < k_end; k_cur += PAGE_SIZE) {
+		pmd_t *pmd = pmd_ptr_k(k_cur);
+		void *va = block + k_cur - k_start;
+		pte_t pte = pfn_pte(PHYS_PFN(__pa(va)), PAGE_KERNEL);
+
+		if (k_cur < ALIGN_DOWN(k_end, SZ_512K))
+			pte = pte_mkhuge(pte);
+
+		__set_pte_at(&init_mm, k_cur, pte_offset_kernel(pmd, k_cur), pte, 0);
+	}
+finish:
+	flush_tlb_kernel_range(k_start, k_end);
+	return 0;
+}
diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
index 6577897673dd..440038ea79f1 100644
--- a/arch/powerpc/mm/kasan/Makefile
+++ b/arch/powerpc/mm/kasan/Makefile
@@ -3,3 +3,4 @@
 KASAN_SANITIZE := n
 
 obj-$(CONFIG_PPC32)           += kasan_init_32.o
+obj-$(CONFIG_PPC_8xx)		+= 8xx.o
-- 
2.25.0

