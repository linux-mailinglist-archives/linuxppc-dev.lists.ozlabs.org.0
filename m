Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D34458ABA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 09:50:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyLZD5cVpz3c6G
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 19:50:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyLXt47gnz301j
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 19:49:02 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HyLXf26fvz9sSP;
 Mon, 22 Nov 2021 09:48:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BKp-NtUlD4Pi; Mon, 22 Nov 2021 09:48:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HyLXc0nS8z9sSm;
 Mon, 22 Nov 2021 09:48:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 05E898B787;
 Mon, 22 Nov 2021 09:48:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3F2pnbczwszx; Mon, 22 Nov 2021 09:48:47 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A7E358B77A;
 Mon, 22 Nov 2021 09:48:47 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1AM8meSh631720
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 09:48:40 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1AM8meK6631719;
 Mon, 22 Nov 2021 09:48:40 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, alex@ghiti.fr
Subject: [PATCH 3/8] powerpc/mm: Remove asm/slice.h
Date: Mon, 22 Nov 2021 09:48:23 +0100
Message-Id: <a4943516369e465480948a867d0539eb19cbdc8c.1637570556.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637570556.git.christophe.leroy@csgroup.eu>
References: <cover.1637570556.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1637570906; l=4295; s=20211009;
 h=from:subject:message-id; bh=pCjWbm/6i4DsGWKoGQCBa7BOgwjRuzeKkXX4A957v14=;
 b=kgoCPzN+agQfltGFjADSaz/iRb+fubzHaC5xjnbbYCj7R4pYjqXcU+72xfe9KP0Ny6RLdetFm3zt
 BgdXw9NtC0RmXF5kBBDzsJ6Q0/gWGXg6G/wKXo8ZO9LKEiwjRcIb
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

Move necessary stuff in asm/book3s/64/slice.h and
remove asm/slice.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/hash.h     |  3 ++
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |  1 +
 arch/powerpc/include/asm/book3s/64/slice.h    | 18 +++++++++
 arch/powerpc/include/asm/page.h               |  1 -
 arch/powerpc/include/asm/slice.h              | 37 -------------------
 5 files changed, 22 insertions(+), 38 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/slice.h

diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index 25f8e90985eb..27be22e6f848 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -99,6 +99,9 @@
  * Defines the address of the vmemap area, in its own region on
  * hash table CPUs.
  */
+#ifdef CONFIG_HUGETLB_PAGE
+#define HAVE_ARCH_HUGETLB_UNMAPPED_AREA
+#endif
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
 
diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index 3004f3323144..b4b2ca111f75 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -18,6 +18,7 @@
  * complete pgtable.h but only a portion of it.
  */
 #include <asm/book3s/64/pgtable.h>
+#include <asm/book3s/64/slice.h>
 #include <asm/task_size_64.h>
 #include <asm/cpu_has_feature.h>
 
diff --git a/arch/powerpc/include/asm/book3s/64/slice.h b/arch/powerpc/include/asm/book3s/64/slice.h
index f0d3194ba41b..5b0f7105bc8b 100644
--- a/arch/powerpc/include/asm/book3s/64/slice.h
+++ b/arch/powerpc/include/asm/book3s/64/slice.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_POWERPC_BOOK3S_64_SLICE_H
 #define _ASM_POWERPC_BOOK3S_64_SLICE_H
 
+#ifndef __ASSEMBLY__
+
 #define SLICE_LOW_SHIFT		28
 #define SLICE_LOW_TOP		(0x100000000ul)
 #define SLICE_NUM_LOW		(SLICE_LOW_TOP >> SLICE_LOW_SHIFT)
@@ -13,4 +15,20 @@
 
 #define SLB_ADDR_LIMIT_DEFAULT	DEFAULT_MAP_WINDOW_USER64
 
+struct mm_struct;
+
+unsigned long slice_get_unmapped_area(unsigned long addr, unsigned long len,
+				      unsigned long flags, unsigned int psize,
+				      int topdown);
+
+unsigned int get_slice_psize(struct mm_struct *mm, unsigned long addr);
+
+void slice_set_range_psize(struct mm_struct *mm, unsigned long start,
+			   unsigned long len, unsigned int psize);
+
+void slice_init_new_context_exec(struct mm_struct *mm);
+void slice_setup_new_exec(void);
+
+#endif /* __ASSEMBLY__ */
+
 #endif /* _ASM_POWERPC_BOOK3S_64_SLICE_H */
diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index 254687258f42..62e0c6f12869 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -329,6 +329,5 @@ static inline unsigned long kaslr_offset(void)
 
 #include <asm-generic/memory_model.h>
 #endif /* __ASSEMBLY__ */
-#include <asm/slice.h>
 
 #endif /* _ASM_POWERPC_PAGE_H */
diff --git a/arch/powerpc/include/asm/slice.h b/arch/powerpc/include/asm/slice.h
deleted file mode 100644
index be4acc52e8ec..000000000000
--- a/arch/powerpc/include/asm/slice.h
+++ /dev/null
@@ -1,37 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_SLICE_H
-#define _ASM_POWERPC_SLICE_H
-
-#ifdef CONFIG_PPC_BOOK3S_64
-#include <asm/book3s/64/slice.h>
-#endif
-
-#ifndef __ASSEMBLY__
-
-struct mm_struct;
-
-#ifdef CONFIG_PPC_BOOK3S_64
-
-#ifdef CONFIG_HUGETLB_PAGE
-#define HAVE_ARCH_HUGETLB_UNMAPPED_AREA
-#endif
-#define HAVE_ARCH_UNMAPPED_AREA
-#define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
-
-unsigned long slice_get_unmapped_area(unsigned long addr, unsigned long len,
-				      unsigned long flags, unsigned int psize,
-				      int topdown);
-
-unsigned int get_slice_psize(struct mm_struct *mm, unsigned long addr);
-
-void slice_set_range_psize(struct mm_struct *mm, unsigned long start,
-			   unsigned long len, unsigned int psize);
-
-void slice_init_new_context_exec(struct mm_struct *mm);
-void slice_setup_new_exec(void);
-
-#endif /* CONFIG_PPC_BOOK3S_64 */
-
-#endif /* __ASSEMBLY__ */
-
-#endif /* _ASM_POWERPC_SLICE_H */
-- 
2.33.1

