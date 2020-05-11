Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 302A31CDCBF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 16:13:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LNF51dT5zDqF3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 00:12:57 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LJXm26HczDqgL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 21:26:16 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49LJXZ12xkz9ty3l;
 Mon, 11 May 2020 13:26:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jjG6-7I3oC-h; Mon, 11 May 2020 13:26:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49LJXZ0GdRz9ty3g;
 Mon, 11 May 2020 13:26:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B5E088B7AE;
 Mon, 11 May 2020 13:26:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id R-ATr0yYLvil; Mon, 11 May 2020 13:26:12 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 78E7D8B7AD;
 Mon, 11 May 2020 13:26:12 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5B57465A09; Mon, 11 May 2020 11:26:12 +0000 (UTC)
Message-Id: <cd24ae9437183388376db1b936a5c14b8bf027a6.1589196133.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589196133.git.christophe.leroy@csgroup.eu>
References: <cover.1589196133.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 45/45] powerpc/32s: Implement dedicated kasan_init_region()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 11 May 2020 11:26:12 +0000 (UTC)
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

Implement a kasan_init_region() dedicated to book3s/32 that
allocates KASAN regions using BATs.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/kasan.h      |  1 +
 arch/powerpc/mm/kasan/Makefile        |  1 +
 arch/powerpc/mm/kasan/book3s_32.c     | 57 +++++++++++++++++++++++++++
 arch/powerpc/mm/kasan/kasan_init_32.c |  2 +-
 4 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/mm/kasan/book3s_32.c

diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index 107a24c3f7b3..be85c7005fb1 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -34,6 +34,7 @@ static inline void kasan_init(void) { }
 static inline void kasan_late_init(void) { }
 #endif
 
+void kasan_update_early_region(unsigned long k_start, unsigned long k_end, pte_t pte);
 int kasan_init_shadow_page_tables(unsigned long k_start, unsigned long k_end);
 int kasan_init_region(void *start, size_t size);
 
diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
index 440038ea79f1..bb1a5408b86b 100644
--- a/arch/powerpc/mm/kasan/Makefile
+++ b/arch/powerpc/mm/kasan/Makefile
@@ -4,3 +4,4 @@ KASAN_SANITIZE := n
 
 obj-$(CONFIG_PPC32)           += kasan_init_32.o
 obj-$(CONFIG_PPC_8xx)		+= 8xx.o
+obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s_32.o
diff --git a/arch/powerpc/mm/kasan/book3s_32.c b/arch/powerpc/mm/kasan/book3s_32.c
new file mode 100644
index 000000000000..4bc491a4a1fd
--- /dev/null
+++ b/arch/powerpc/mm/kasan/book3s_32.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define DISABLE_BRANCH_PROFILING
+
+#include <linux/kasan.h>
+#include <linux/memblock.h>
+#include <asm/pgalloc.h>
+#include <mm/mmu_decl.h>
+
+int __init kasan_init_region(void *start, size_t size)
+{
+	unsigned long k_start = (unsigned long)kasan_mem_to_shadow(start);
+	unsigned long k_end = (unsigned long)kasan_mem_to_shadow(start + size);
+	unsigned long k_cur = k_start;
+	int k_size = k_end - k_start;
+	int k_size_base = 1 << (ffs(k_size) - 1);
+	int ret;
+	void *block;
+
+	block = memblock_alloc(k_size, k_size_base);
+
+	if (block && k_size_base >= SZ_128K && k_start == ALIGN(k_start, k_size_base)) {
+		int k_size_more = 1 << (ffs(k_size - k_size_base) - 1);
+
+		setbat(-1, k_start, __pa(block), k_size_base, PAGE_KERNEL);
+		if (k_size_more >= SZ_128K)
+			setbat(-1, k_start + k_size_base, __pa(block) + k_size_base,
+			       k_size_more, PAGE_KERNEL);
+		if (v_block_mapped(k_start))
+			k_cur = k_start + k_size_base;
+		if (v_block_mapped(k_start + k_size_base))
+			k_cur = k_start + k_size_base + k_size_more;
+
+		update_bats();
+	}
+
+	if (!block)
+		block = memblock_alloc(k_size, PAGE_SIZE);
+	if (!block)
+		return -ENOMEM;
+
+	ret = kasan_init_shadow_page_tables(k_start, k_end);
+	if (ret)
+		return ret;
+
+	kasan_update_early_region(k_start, k_cur, __pte(0));
+
+	for (; k_cur < k_end; k_cur += PAGE_SIZE) {
+		pmd_t *pmd = pmd_ptr_k(k_cur);
+		void *va = block + k_cur - k_start;
+		pte_t pte = pfn_pte(PHYS_PFN(__pa(va)), PAGE_KERNEL);
+
+		__set_pte_at(&init_mm, k_cur, pte_offset_kernel(pmd, k_cur), pte, 0);
+	}
+	flush_tlb_kernel_range(k_start, k_end);
+	return 0;
+}
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index 76d418af4ce8..c42085801c04 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -79,7 +79,7 @@ int __init __weak kasan_init_region(void *start, size_t size)
 	return 0;
 }
 
-static void __init
+void __init
 kasan_update_early_region(unsigned long k_start, unsigned long k_end, pte_t pte)
 {
 	unsigned long k_cur;
-- 
2.25.0

