Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9725B1CDC94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 16:05:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LN4m30kfzDq6N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 00:05:43 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LJXl1p49zDqgD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 21:26:15 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49LJXX0TWbz9ty3k;
 Mon, 11 May 2020 13:26:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 06hRKL3H4ikb; Mon, 11 May 2020 13:26:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49LJXW6sFgz9ty3g;
 Mon, 11 May 2020 13:26:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A2DB78B7AE;
 Mon, 11 May 2020 13:26:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cMnp7aswnbEZ; Mon, 11 May 2020 13:26:10 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6AEB58B7AD;
 Mon, 11 May 2020 13:26:10 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4BF3865A09; Mon, 11 May 2020 11:26:10 +0000 (UTC)
Message-Id: <4dda77ed725d679510c337ab936121ba2614d838.1589196133.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589196133.git.christophe.leroy@csgroup.eu>
References: <cover.1589196133.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 43/45] powerpc/8xx: Implement dedicated kasan_init_region()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 11 May 2020 11:26:10 +0000 (UTC)
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

