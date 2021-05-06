Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A523754CA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 15:32:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbZJS3lwYz3bVM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 23:32:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbZJ707Jcz300x
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 23:32:22 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FbZJ32qRxz9sYY;
 Thu,  6 May 2021 15:32:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jSUkJrLu2TXY; Thu,  6 May 2021 15:32:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FbZJ31wnHz9sYF;
 Thu,  6 May 2021 15:32:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E6B658B801;
 Thu,  6 May 2021 15:32:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id U8gQ-CHr9pXt; Thu,  6 May 2021 15:32:18 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 95BAC8B800;
 Thu,  6 May 2021 15:32:18 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 470946489F; Thu,  6 May 2021 13:32:18 +0000 (UTC)
Message-Id: <7f4aaa479569328a1e5b07c96c08fbca0cd7dd88.1620307890.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/32s: Remove asm/book3s/32/hash.h
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  6 May 2021 13:32:18 +0000 (UTC)
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

Move the PAGE bits into pgtable.h to be more similar to book3s/64.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/hash.h    | 45 --------------------
 arch/powerpc/include/asm/book3s/32/pgtable.h | 38 ++++++++++++++++-
 2 files changed, 37 insertions(+), 46 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/book3s/32/hash.h

diff --git a/arch/powerpc/include/asm/book3s/32/hash.h b/arch/powerpc/include/asm/book3s/32/hash.h
deleted file mode 100644
index 2a0a467d2985..000000000000
--- a/arch/powerpc/include/asm/book3s/32/hash.h
+++ /dev/null
@@ -1,45 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_BOOK3S_32_HASH_H
-#define _ASM_POWERPC_BOOK3S_32_HASH_H
-#ifdef __KERNEL__
-
-/*
- * The "classic" 32-bit implementation of the PowerPC MMU uses a hash
- * table containing PTEs, together with a set of 16 segment registers,
- * to define the virtual to physical address mapping.
- *
- * We use the hash table as an extended TLB, i.e. a cache of currently
- * active mappings.  We maintain a two-level page table tree, much
- * like that used by the i386, for the sake of the Linux memory
- * management code.  Low-level assembler code in hash_low_32.S
- * (procedure hash_page) is responsible for extracting ptes from the
- * tree and putting them into the hash table when necessary, and
- * updating the accessed and modified bits in the page table tree.
- */
-
-#define _PAGE_PRESENT	0x001	/* software: pte contains a translation */
-#define _PAGE_HASHPTE	0x002	/* hash_page has made an HPTE for this pte */
-#define _PAGE_USER	0x004	/* usermode access allowed */
-#define _PAGE_GUARDED	0x008	/* G: prohibit speculative access */
-#define _PAGE_COHERENT	0x010	/* M: enforce memory coherence (SMP systems) */
-#define _PAGE_NO_CACHE	0x020	/* I: cache inhibit */
-#define _PAGE_WRITETHRU	0x040	/* W: cache write-through */
-#define _PAGE_DIRTY	0x080	/* C: page changed */
-#define _PAGE_ACCESSED	0x100	/* R: page referenced */
-#define _PAGE_EXEC	0x200	/* software: exec allowed */
-#define _PAGE_RW	0x400	/* software: user write access allowed */
-#define _PAGE_SPECIAL	0x800	/* software: Special page */
-
-#ifdef CONFIG_PTE_64BIT
-/* We never clear the high word of the pte */
-#define _PTE_NONE_MASK	(0xffffffff00000000ULL | _PAGE_HASHPTE)
-#else
-#define _PTE_NONE_MASK	_PAGE_HASHPTE
-#endif
-
-#define _PMD_PRESENT	0
-#define _PMD_PRESENT_MASK (PAGE_MASK)
-#define _PMD_BAD	(~PAGE_MASK)
-
-#endif /* __KERNEL__ */
-#endif /* _ASM_POWERPC_BOOK3S_32_HASH_H */
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 83c65845a1a9..609c80f67194 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -4,7 +4,43 @@
 
 #include <asm-generic/pgtable-nopmd.h>
 
-#include <asm/book3s/32/hash.h>
+/*
+ * The "classic" 32-bit implementation of the PowerPC MMU uses a hash
+ * table containing PTEs, together with a set of 16 segment registers,
+ * to define the virtual to physical address mapping.
+ *
+ * We use the hash table as an extended TLB, i.e. a cache of currently
+ * active mappings.  We maintain a two-level page table tree, much
+ * like that used by the i386, for the sake of the Linux memory
+ * management code.  Low-level assembler code in hash_low_32.S
+ * (procedure hash_page) is responsible for extracting ptes from the
+ * tree and putting them into the hash table when necessary, and
+ * updating the accessed and modified bits in the page table tree.
+ */
+
+#define _PAGE_PRESENT	0x001	/* software: pte contains a translation */
+#define _PAGE_HASHPTE	0x002	/* hash_page has made an HPTE for this pte */
+#define _PAGE_USER	0x004	/* usermode access allowed */
+#define _PAGE_GUARDED	0x008	/* G: prohibit speculative access */
+#define _PAGE_COHERENT	0x010	/* M: enforce memory coherence (SMP systems) */
+#define _PAGE_NO_CACHE	0x020	/* I: cache inhibit */
+#define _PAGE_WRITETHRU	0x040	/* W: cache write-through */
+#define _PAGE_DIRTY	0x080	/* C: page changed */
+#define _PAGE_ACCESSED	0x100	/* R: page referenced */
+#define _PAGE_EXEC	0x200	/* software: exec allowed */
+#define _PAGE_RW	0x400	/* software: user write access allowed */
+#define _PAGE_SPECIAL	0x800	/* software: Special page */
+
+#ifdef CONFIG_PTE_64BIT
+/* We never clear the high word of the pte */
+#define _PTE_NONE_MASK	(0xffffffff00000000ULL | _PAGE_HASHPTE)
+#else
+#define _PTE_NONE_MASK	_PAGE_HASHPTE
+#endif
+
+#define _PMD_PRESENT	0
+#define _PMD_PRESENT_MASK (PAGE_MASK)
+#define _PMD_BAD	(~PAGE_MASK)
 
 /* And here we include common definitions */
 
-- 
2.25.0

