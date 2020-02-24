Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD477169D61
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 06:07:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48QqnH1D06zDqSW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 16:07:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48Qqj00mJjzDqHn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 16:03:47 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F6531FB;
 Sun, 23 Feb 2020 21:03:45 -0800 (PST)
Received: from p8cg001049571a15.blr.arm.com (p8cg001049571a15.blr.arm.com
 [10.162.16.95])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 29D923F534;
 Sun, 23 Feb 2020 21:03:38 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/4] mm/vma: Make vma_is_accessible() available for general
 use
Date: Mon, 24 Feb 2020 10:33:11 +0530
Message-Id: <1582520593-30704-3-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582520593-30704-1-git-send-email-anshuman.khandual@arm.com>
References: <1582520593-30704-1-git-send-email-anshuman.khandual@arm.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Guo Ren <guoren@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mel Gorman <mgorman@suse.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lets move vma_is_accessible() helper to include/linux/mm.h which makes it
available for general use. While here, this replaces all remaining open
encodings for VMA access check with vma_is_accessible().

Cc: Guo Ren <guoren@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Mel Gorman <mgorman@suse.de>
Cc: linux-kernel@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-sh@vger.kernel.org
Cc: linux-mm@kvack.org
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/csky/mm/fault.c    | 2 +-
 arch/m68k/mm/fault.c    | 2 +-
 arch/mips/mm/fault.c    | 2 +-
 arch/powerpc/mm/fault.c | 2 +-
 arch/sh/mm/fault.c      | 2 +-
 arch/x86/mm/fault.c     | 2 +-
 include/linux/mm.h      | 5 +++++
 kernel/sched/fair.c     | 2 +-
 mm/gup.c                | 2 +-
 mm/memory.c             | 5 -----
 mm/mempolicy.c          | 3 +--
 mm/mmap.c               | 5 ++---
 12 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/arch/csky/mm/fault.c b/arch/csky/mm/fault.c
index f76618b630f9..4b3511b8298d 100644
--- a/arch/csky/mm/fault.c
+++ b/arch/csky/mm/fault.c
@@ -137,7 +137,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long write,
 		if (!(vma->vm_flags & VM_WRITE))
 			goto bad_area;
 	} else {
-		if (!(vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC)))
+		if (!vma_is_accessible(vma))
 			goto bad_area;
 	}
 
diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
index e9b1d7585b43..d5131ec5d923 100644
--- a/arch/m68k/mm/fault.c
+++ b/arch/m68k/mm/fault.c
@@ -125,7 +125,7 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 		case 1:		/* read, present */
 			goto acc_err;
 		case 0:		/* read, not present */
-			if (!(vma->vm_flags & (VM_READ | VM_EXEC | VM_WRITE)))
+			if (!vma_is_accessible(vma))
 				goto acc_err;
 	}
 
diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
index 1e8d00793784..5b9f947bfa32 100644
--- a/arch/mips/mm/fault.c
+++ b/arch/mips/mm/fault.c
@@ -142,7 +142,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 				goto bad_area;
 			}
 		} else {
-			if (!(vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC)))
+			if (!vma_is_accessible(vma))
 				goto bad_area;
 		}
 	}
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 8db0507619e2..71a3658c516b 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -314,7 +314,7 @@ static bool access_error(bool is_write, bool is_exec,
 		return false;
 	}
 
-	if (unlikely(!(vma->vm_flags & (VM_READ | VM_EXEC | VM_WRITE))))
+	if (unlikely(!vma_is_accessible(vma)))
 		return true;
 	/*
 	 * We should ideally do the vma pkey access check here. But in the
diff --git a/arch/sh/mm/fault.c b/arch/sh/mm/fault.c
index 5f51456f4fc7..a8c4253f37d7 100644
--- a/arch/sh/mm/fault.c
+++ b/arch/sh/mm/fault.c
@@ -355,7 +355,7 @@ static inline int access_error(int error_code, struct vm_area_struct *vma)
 		return 1;
 
 	/* read, not present: */
-	if (unlikely(!(vma->vm_flags & (VM_READ | VM_EXEC | VM_WRITE))))
+	if (unlikely(!vma_is_accessible(vma)))
 		return 1;
 
 	return 0;
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index fa4ea09593ab..c461eaab0306 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1200,7 +1200,7 @@ access_error(unsigned long error_code, struct vm_area_struct *vma)
 		return 1;
 
 	/* read, not present: */
-	if (unlikely(!(vma->vm_flags & (VM_READ | VM_EXEC | VM_WRITE))))
+	if (unlikely(!vma_is_accessible(vma)))
 		return 1;
 
 	return 0;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 52269e56c514..b0e53ef13ff1 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -541,6 +541,11 @@ static inline bool vma_is_anonymous(struct vm_area_struct *vma)
 	return !vma->vm_ops;
 }
 
+static inline bool vma_is_accessible(struct vm_area_struct *vma)
+{
+	return vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC);
+}
+
 #ifdef CONFIG_SHMEM
 /*
  * The vma_is_shmem is not inline because it is used only by slow
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 3c8a379c357e..bf15cc72695e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -2573,7 +2573,7 @@ static void task_numa_work(struct callback_head *work)
 		 * Skip inaccessible VMAs to avoid any confusion between
 		 * PROT_NONE and NUMA hinting ptes
 		 */
-		if (!(vma->vm_flags & (VM_READ | VM_EXEC | VM_WRITE)))
+		if (!vma_is_accessible(vma))
 			continue;
 
 		do {
diff --git a/mm/gup.c b/mm/gup.c
index 1b521e0ac1de..c8ffe2e61f03 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1171,7 +1171,7 @@ long populate_vma_page_range(struct vm_area_struct *vma,
 	 * We want mlock to succeed for regions that have any permissions
 	 * other than PROT_NONE.
 	 */
-	if (vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC))
+	if (vma_is_accessible(vma))
 		gup_flags |= FOLL_FORCE;
 
 	/*
diff --git a/mm/memory.c b/mm/memory.c
index 0bccc622e482..2f07747612b7 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3942,11 +3942,6 @@ static inline vm_fault_t wp_huge_pmd(struct vm_fault *vmf, pmd_t orig_pmd)
 	return VM_FAULT_FALLBACK;
 }
 
-static inline bool vma_is_accessible(struct vm_area_struct *vma)
-{
-	return vma->vm_flags & (VM_READ | VM_EXEC | VM_WRITE);
-}
-
 static vm_fault_t create_huge_pud(struct vm_fault *vmf)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 977c641f78cf..91c1ad6ab8ea 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -649,8 +649,7 @@ static int queue_pages_test_walk(unsigned long start, unsigned long end,
 
 	if (flags & MPOL_MF_LAZY) {
 		/* Similar to task_numa_work, skip inaccessible VMAs */
-		if (!is_vm_hugetlb_page(vma) &&
-			(vma->vm_flags & (VM_READ | VM_EXEC | VM_WRITE)) &&
+		if (!is_vm_hugetlb_page(vma) && vma_is_accessible(vma) &&
 			!(vma->vm_flags & VM_MIXEDMAP))
 			change_prot_numa(vma, start, endvma);
 		return 1;
diff --git a/mm/mmap.c b/mm/mmap.c
index d681a20eb4ea..0d295f49b24d 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2334,8 +2334,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
 		gap_addr = TASK_SIZE;
 
 	next = vma->vm_next;
-	if (next && next->vm_start < gap_addr &&
-			(next->vm_flags & (VM_WRITE|VM_READ|VM_EXEC))) {
+	if (next && next->vm_start < gap_addr && vma_is_accessible(next)) {
 		if (!(next->vm_flags & VM_GROWSUP))
 			return -ENOMEM;
 		/* Check that both stack segments have the same anon_vma? */
@@ -2416,7 +2415,7 @@ int expand_downwards(struct vm_area_struct *vma,
 	prev = vma->vm_prev;
 	/* Check that both stack segments have the same anon_vma? */
 	if (prev && !(prev->vm_flags & VM_GROWSDOWN) &&
-			(prev->vm_flags & (VM_WRITE|VM_READ|VM_EXEC))) {
+			vma_is_accessible(prev)) {
 		if (address - prev->vm_end < stack_guard_gap)
 			return -ENOMEM;
 	}
-- 
2.20.1

