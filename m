Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A82E04FA9E6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 19:22:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbMPH5Q0Gz3bdp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 03:22:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbMKR0Tgqz3bxf
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 03:18:51 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KbMJt3rtxz9sTY;
 Sat,  9 Apr 2022 19:18:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZNHoKI69J5GF; Sat,  9 Apr 2022 19:18:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KbMJl6200z9sTZ;
 Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B37098B7A0;
 Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FU0Tuqr-rKQc; Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.53])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9790F8B79E;
 Sat,  9 Apr 2022 19:18:14 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 239HI9Ir833242
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 9 Apr 2022 19:18:09 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 239HI9MQ833241;
 Sat, 9 Apr 2022 19:18:09 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, akpm@linux-foundation.org
Subject: [PATCH v10 12/13] powerpc/mm: Convert to default topdown mmap layout
Date: Sat,  9 Apr 2022 19:17:36 +0200
Message-Id: <518f9def87d3c889d5958103e7463cf45a2f673d.1649523076.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649523076.git.christophe.leroy@csgroup.eu>
References: <cover.1649523076.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1649524640; l=5708; s=20211009;
 h=from:subject:message-id; bh=Km2WIuqEKAHDbwynBFlki5VDG2vS0gv6RnUqppzgUo4=;
 b=fFiZCZcYDEbQgmhBG7ojaBaWcZvgX1q52RPaTq4VBOoIdum/H3mzhyA2Xg4HE9G9OXBt26QQWrWA
 6xu4+fIKAjDlXe+5CQptObh1QbjHsKnP6Iu4VXbcv9VOnuiChina
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

Select CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT and
remove arch/powerpc/mm/mmap.c

This change reuses the generic framework added by
commit 67f3977f805b ("arm64, mm: move generic mmap layout
functions to mm") without any functional change.

Comparison between powerpc implementation and the generic one:
- mmap_is_legacy() is identical.
- arch_mmap_rnd() does exactly the same allthough it's written
slightly differently.
- MIN_GAP and MAX_GAP are identical.
- mmap_base() does the same but uses STACK_RND_MASK which provides
the same values as stack_maxrandom_size().
- arch_pick_mmap_layout() is identical.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                 |   2 +-
 arch/powerpc/include/asm/processor.h |   2 -
 arch/powerpc/mm/Makefile             |   2 +-
 arch/powerpc/mm/mmap.c               | 105 ---------------------------
 4 files changed, 2 insertions(+), 109 deletions(-)
 delete mode 100644 arch/powerpc/mm/mmap.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 174edabb74fa..145af02df3dc 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -118,7 +118,6 @@ config PPC
 	select ARCH_HAS_DEBUG_WX		if STRICT_KERNEL_RWX
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_DMA_MAP_DIRECT 		if PPC_PSERIES
-	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_HUGEPD			if HUGETLB_PAGE
@@ -154,6 +153,7 @@ config PPC
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS		if PPC_QUEUED_SPINLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS	if PPC_QUEUED_SPINLOCKS
+	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_LD_ORPHAN_WARN
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 39c25021030f..fdfaae194ddd 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -392,8 +392,6 @@ static inline void prefetchw(const void *x)
 
 #define spin_lock_prefetch(x)	prefetchw(x)
 
-#define HAVE_ARCH_PICK_MMAP_LAYOUT
-
 /* asm stubs */
 extern unsigned long isa300_idle_stop_noloss(unsigned long psscr_val);
 extern unsigned long isa300_idle_stop_mayloss(unsigned long psscr_val);
diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
index d4c20484dad9..503a6e249940 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -5,7 +5,7 @@
 
 ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
 
-obj-y				:= fault.o mem.o pgtable.o mmap.o maccess.o pageattr.o \
+obj-y				:= fault.o mem.o pgtable.o maccess.o pageattr.o \
 				   init_$(BITS).o pgtable_$(BITS).o \
 				   pgtable-frag.o ioremap.o ioremap_$(BITS).o \
 				   init-common.o mmu_context.o drmem.o \
diff --git a/arch/powerpc/mm/mmap.c b/arch/powerpc/mm/mmap.c
deleted file mode 100644
index d9eae456558a..000000000000
--- a/arch/powerpc/mm/mmap.c
+++ /dev/null
@@ -1,105 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  flexible mmap layout support
- *
- * Copyright 2003-2004 Red Hat Inc., Durham, North Carolina.
- * All Rights Reserved.
- *
- * Started by Ingo Molnar <mingo@elte.hu>
- */
-
-#include <linux/personality.h>
-#include <linux/mm.h>
-#include <linux/random.h>
-#include <linux/sched/signal.h>
-#include <linux/sched/mm.h>
-#include <linux/elf-randomize.h>
-#include <linux/security.h>
-#include <linux/mman.h>
-
-/*
- * Top of mmap area (just below the process stack).
- *
- * Leave at least a ~128 MB hole.
- */
-#define MIN_GAP (128*1024*1024)
-#define MAX_GAP (TASK_SIZE/6*5)
-
-static inline int mmap_is_legacy(struct rlimit *rlim_stack)
-{
-	if (current->personality & ADDR_COMPAT_LAYOUT)
-		return 1;
-
-	if (rlim_stack->rlim_cur == RLIM_INFINITY)
-		return 1;
-
-	return sysctl_legacy_va_layout;
-}
-
-unsigned long arch_mmap_rnd(void)
-{
-	unsigned long shift, rnd;
-
-	shift = mmap_rnd_bits;
-#ifdef CONFIG_COMPAT
-	if (is_32bit_task())
-		shift = mmap_rnd_compat_bits;
-#endif
-	rnd = get_random_long() % (1ul << shift);
-
-	return rnd << PAGE_SHIFT;
-}
-
-static inline unsigned long stack_maxrandom_size(void)
-{
-	if (!(current->flags & PF_RANDOMIZE))
-		return 0;
-
-	/* 8MB for 32bit, 1GB for 64bit */
-	if (is_32bit_task())
-		return (1<<23);
-	else
-		return (1<<30);
-}
-
-static inline unsigned long mmap_base(unsigned long rnd,
-				      struct rlimit *rlim_stack)
-{
-	unsigned long gap = rlim_stack->rlim_cur;
-	unsigned long pad = stack_maxrandom_size() + stack_guard_gap;
-
-	/* Values close to RLIM_INFINITY can overflow. */
-	if (gap + pad > gap)
-		gap += pad;
-
-	if (gap < MIN_GAP)
-		gap = MIN_GAP;
-	else if (gap > MAX_GAP)
-		gap = MAX_GAP;
-
-	return PAGE_ALIGN(DEFAULT_MAP_WINDOW - gap - rnd);
-}
-
-/*
- * This function, called very early during the creation of a new
- * process VM image, sets up which VM layout function to use:
- */
-void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
-{
-	unsigned long random_factor = 0UL;
-
-	if (current->flags & PF_RANDOMIZE)
-		random_factor = arch_mmap_rnd();
-
-	/*
-	 * Fall back to the standard layout if the personality
-	 * bit is set, or if the expected stack growth is unlimited:
-	 */
-	if (mmap_is_legacy(rlim_stack)) {
-		mm->mmap_base = TASK_UNMAPPED_BASE + random_factor;
-		mm->get_unmapped_area = arch_get_unmapped_area;
-	} else {
-		mm->mmap_base = mmap_base(random_factor, rlim_stack);
-		mm->get_unmapped_area = arch_get_unmapped_area_topdown;
-	}
-}
-- 
2.35.1

