Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374045E012
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 18:55:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0QXL07TTz3djK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 04:55:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0QVB129Zz3c7X
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 04:53:53 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J0QTs10qjz9sSs;
 Thu, 25 Nov 2021 18:53:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6aAk9oeh5-y; Thu, 25 Nov 2021 18:53:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J0QTm735lz9sSx;
 Thu, 25 Nov 2021 18:53:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E18958B77E;
 Thu, 25 Nov 2021 18:53:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id J1-XXP08DUs7; Thu, 25 Nov 2021 18:53:32 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.227])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 33FB48B788;
 Thu, 25 Nov 2021 18:53:32 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1APHrLUa385547
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 18:53:21 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1APHrLjB385546;
 Thu, 25 Nov 2021 18:53:21 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, alex@ghiti.fr
Subject: [PATCH v2 rebased 9/9] powerpc: Simplify and move arch_randomize_brk()
Date: Thu, 25 Nov 2021 18:52:58 +0100
Message-Id: <27281d506c4c1705143516e5f2558f775c3cfbe3.1637862579.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637862579.git.christophe.leroy@csgroup.eu>
References: <cover.1637862579.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1637862777; l=4141; s=20211009;
 h=from:subject:message-id; bh=8tm/fqiMg9uYSM5VnoNA37ImSq9p8NMXx1XalKNqtIA=;
 b=nnGiMZN2zYzBJjmKb87nUq4f2ZbYOCT7sUIKO9hYgqY1U93QzgBna2Naf2IjYXEUt4FcTWppGRVA
 cExCkv8sBkS1D1BClajitXILblKt4husvxu/VKH4Lhb07+XyAFwd
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

arch_randomize_brk() is only needed for hash on book3s/64, for other
platforms the one provided by the default mmap layout is good enough.

Move it to hash_utils.c and use randomize_page() like the generic one.

And properly opt out the radix case instead of making an assumption
on mmu_highuser_ssize.

Also change to a 32M range like most other architectures instead of 8M.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: Add missing include <linux/elf-randomize.h>

v2: New
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/process.c         | 41 ---------------------------
 arch/powerpc/mm/book3s64/hash_utils.c | 19 +++++++++++++
 include/linux/sizes.h                 |  2 ++
 3 files changed, 21 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index a64cfbb85ca2..44c4bce5211d 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -34,10 +34,8 @@
 #include <linux/ftrace.h>
 #include <linux/kernel_stat.h>
 #include <linux/personality.h>
-#include <linux/random.h>
 #include <linux/hw_breakpoint.h>
 #include <linux/uaccess.h>
-#include <linux/elf-randomize.h>
 #include <linux/pkeys.h>
 #include <linux/seq_buf.h>
 
@@ -2310,42 +2308,3 @@ unsigned long arch_align_stack(unsigned long sp)
 		sp -= get_random_int() & ~PAGE_MASK;
 	return sp & ~0xf;
 }
-
-static inline unsigned long brk_rnd(void)
-{
-        unsigned long rnd = 0;
-
-	/* 8MB for 32bit, 1GB for 64bit */
-	if (is_32bit_task())
-		rnd = (get_random_long() % (1UL<<(23-PAGE_SHIFT)));
-	else
-		rnd = (get_random_long() % (1UL<<(30-PAGE_SHIFT)));
-
-	return rnd << PAGE_SHIFT;
-}
-
-unsigned long arch_randomize_brk(struct mm_struct *mm)
-{
-	unsigned long base = mm->brk;
-	unsigned long ret;
-
-#ifdef CONFIG_PPC_BOOK3S_64
-	/*
-	 * If we are using 1TB segments and we are allowed to randomise
-	 * the heap, we can put it above 1TB so it is backed by a 1TB
-	 * segment. Otherwise the heap will be in the bottom 1TB
-	 * which always uses 256MB segments and this may result in a
-	 * performance penalty.
-	 */
-	if (!radix_enabled() && !is_32bit_task() && (mmu_highuser_ssize == MMU_SEGSIZE_1T))
-		base = max_t(unsigned long, mm->brk, 1UL << SID_SHIFT_1T);
-#endif
-
-	ret = PAGE_ALIGN(base + brk_rnd());
-
-	if (ret < mm->brk)
-		return mm->brk;
-
-	return ret;
-}
-
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 7ecadf5e6bf9..68a5468b0f19 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -37,6 +37,8 @@
 #include <linux/cpu.h>
 #include <linux/pgtable.h>
 #include <linux/debugfs.h>
+#include <linux/random.h>
+#include <linux/elf-randomize.h>
 
 #include <asm/interrupt.h>
 #include <asm/processor.h>
@@ -2171,3 +2173,20 @@ void __init print_system_hash_info(void)
 	if (htab_hash_mask)
 		pr_info("htab_hash_mask    = 0x%lx\n", htab_hash_mask);
 }
+
+unsigned long arch_randomize_brk(struct mm_struct *mm)
+{
+	/*
+	 * If we are using 1TB segments and we are allowed to randomise
+	 * the heap, we can put it above 1TB so it is backed by a 1TB
+	 * segment. Otherwise the heap will be in the bottom 1TB
+	 * which always uses 256MB segments and this may result in a
+	 * performance penalty.
+	 */
+	if (is_32bit_task())
+		return randomize_page(mm->brk, SZ_32M);
+	else if (!radix_enabled() && mmu_highuser_ssize == MMU_SEGSIZE_1T)
+		return randomize_page(max_t(unsigned long, mm->brk, SZ_1T), SZ_1G);
+	else
+		return randomize_page(mm->brk, SZ_1G);
+}
diff --git a/include/linux/sizes.h b/include/linux/sizes.h
index 1ac79bcee2bb..84aa448d8bb3 100644
--- a/include/linux/sizes.h
+++ b/include/linux/sizes.h
@@ -47,6 +47,8 @@
 #define SZ_8G				_AC(0x200000000, ULL)
 #define SZ_16G				_AC(0x400000000, ULL)
 #define SZ_32G				_AC(0x800000000, ULL)
+
+#define SZ_1T				_AC(0x10000000000, ULL)
 #define SZ_64T				_AC(0x400000000000, ULL)
 
 #endif /* __LINUX_SIZES_H__ */
-- 
2.33.1

