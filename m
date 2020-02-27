Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A25A1710CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 07:03:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Shsy20R5zDqwN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 17:03:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48ShkR6TYBzDqq3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 16:56:31 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A66431B;
 Wed, 26 Feb 2020 21:56:29 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.1.119])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF98C3F73B;
 Wed, 26 Feb 2020 21:56:25 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH V2 2/3] mm/vma: Make vma_is_foreign() available for general use
Date: Thu, 27 Feb 2020 11:26:04 +0530
Message-Id: <1582782965-3274-3-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582782965-3274-1-git-send-email-anshuman.khandual@arm.com>
References: <1582782965-3274-1-git-send-email-anshuman.khandual@arm.com>
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
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 vbabka@suse.cz
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Idea of a foreign VMA with respect to the present context is very generic.
But currently there are two identical definitions for this in powerpc and
x86 platforms. Lets consolidate those redundant definitions while making
vma_is_foreign() available for general use later. This should not cause
any functional change.

Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: x86@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/powerpc/mm/book3s64/pkeys.c   | 12 ------------
 arch/x86/include/asm/mmu_context.h | 15 ---------------
 include/linux/mm.h                 | 11 +++++++++++
 3 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 59e0ebbd8036..07527f1ed108 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -381,18 +381,6 @@ bool arch_pte_access_permitted(u64 pte, bool write, bool execute)
  * So do not enforce things if the VMA is not from the current mm, or if we are
  * in a kernel thread.
  */
-static inline bool vma_is_foreign(struct vm_area_struct *vma)
-{
-	if (!current->mm)
-		return true;
-
-	/* if it is not our ->mm, it has to be foreign */
-	if (current->mm != vma->vm_mm)
-		return true;
-
-	return false;
-}
-
 bool arch_vma_access_permitted(struct vm_area_struct *vma, bool write,
 			       bool execute, bool foreign)
 {
diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
index b538d9ddee9c..4e55370e48e8 100644
--- a/arch/x86/include/asm/mmu_context.h
+++ b/arch/x86/include/asm/mmu_context.h
@@ -213,21 +213,6 @@ static inline void arch_unmap(struct mm_struct *mm, unsigned long start,
  * So do not enforce things if the VMA is not from the current
  * mm, or if we are in a kernel thread.
  */
-static inline bool vma_is_foreign(struct vm_area_struct *vma)
-{
-	if (!current->mm)
-		return true;
-	/*
-	 * Should PKRU be enforced on the access to this VMA?  If
-	 * the VMA is from another process, then PKRU has no
-	 * relevance and should not be enforced.
-	 */
-	if (current->mm != vma->vm_mm)
-		return true;
-
-	return false;
-}
-
 static inline bool arch_vma_access_permitted(struct vm_area_struct *vma,
 		bool write, bool execute, bool foreign)
 {
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7cb7a5c564fb..c5d2fd889bdf 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -27,6 +27,7 @@
 #include <linux/memremap.h>
 #include <linux/overflow.h>
 #include <linux/sizes.h>
+#include <linux/sched.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -543,6 +544,16 @@ static inline bool vma_is_anonymous(struct vm_area_struct *vma)
 	return !vma->vm_ops;
 }
 
+static inline bool vma_is_foreign(struct vm_area_struct *vma)
+{
+	if (!current->mm)
+		return true;
+
+	if (current->mm != vma->vm_mm)
+		return true;
+
+	return false;
+}
 #ifdef CONFIG_SHMEM
 /*
  * The vma_is_shmem is not inline because it is used only by slow
-- 
2.20.1

