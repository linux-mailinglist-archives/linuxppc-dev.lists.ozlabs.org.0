Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E907C4FA9EB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 19:23:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbMQl6MFXz3fJ6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 03:23:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbMKg0vhSz3bky
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 03:19:02 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KbMJx1gTQz9sTV;
 Sat,  9 Apr 2022 19:18:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Onhhv0E-bO6P; Sat,  9 Apr 2022 19:18:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KbMJl6bphz9sTf;
 Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D7D7F8B76E;
 Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hcfUE2lB8wuj; Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.53])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 936048B79C;
 Sat,  9 Apr 2022 19:18:14 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 239HI6a3833198
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 9 Apr 2022 19:18:06 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 239HI6kB833197;
 Sat, 9 Apr 2022 19:18:06 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, akpm@linux-foundation.org
Subject: [PATCH v10 01/13] mm, hugetlbfs: Allow for "high" userspace addresses
Date: Sat,  9 Apr 2022 19:17:25 +0200
Message-Id: <8b82565b407d04b6e6c4a564423a4e68bde6e39d.1649523076.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649523076.git.christophe.leroy@csgroup.eu>
References: <cover.1649523076.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1649524639; l=5228; s=20211009;
 h=from:subject:message-id; bh=CCh2OX6N7Y1n5DdZLfyOCuZvZy71MVE8ItuPNEEWiA4=;
 b=4KPmkp+0oL7WG3iHYQB04+LR58xcFOyWVfRozKYxfHOYBdT42nVH07dEk/UmFWeVMovQQRvYSOdN
 GJ8VTZmWBy1RChBDWL0SgYritavpzzHezB5isAvfbzQdsU1pMShE
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
Cc: Steve Capper <steve.capper@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a complement of f6795053dac8 ("mm: mmap: Allow for "high"
userspace addresses") for hugetlb.

This patch adds support for "high" userspace addresses that are
optionally supported on the system and have to be requested via a hint
mechanism ("high" addr parameter to mmap).

Architectures such as powerpc and x86 achieve this by making changes to
their architectural versions of hugetlb_get_unmapped_area() function.
However, arm64 uses the generic version of that function.

So take into account arch_get_mmap_base() and arch_get_mmap_end() in
hugetlb_get_unmapped_area(). To allow that, move those two macros
out of mm/mmap.c into include/linux/sched/mm.h

If these macros are not defined in architectural code then they default
to (TASK_SIZE) and (base) so should not introduce any behavioural
changes to architectures that do not define them.

For the time being, only ARM64 is affected by this change.

From Catalin (ARM64):
  We should have fixed hugetlb_get_unmapped_area() as well when we
added support for 52-bit VA. The reason for commit f6795053dac8 was to
prevent normal mmap() from returning addresses above 48-bit by default
as some user-space had hard assumptions about this.

It's a slight ABI change if you do this for hugetlb_get_unmapped_area()
but I doubt anyone would notice. It's more likely that the current
behaviour would cause issues, so I'd rather have them consistent.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Fixes: f6795053dac8 ("mm: mmap: Allow for "high" userspace addresses")
Cc: <stable@vger.kernel.org> # 5.0.x
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Andrew Morton <akpm@linux-foundation.org>
---
v10:
- Moved as first patch of the series so that it can be applied
separately as a flag and be easily applied back on stable.
- Added text from Catalin explaining why it is a fixup.
---
 fs/hugetlbfs/inode.c     | 9 +++++----
 include/linux/sched/mm.h | 8 ++++++++
 mm/mmap.c                | 8 --------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 99c7477cee5c..dd3a088db11d 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -206,7 +206,7 @@ hugetlb_get_unmapped_area_bottomup(struct file *file, unsigned long addr,
 	info.flags = 0;
 	info.length = len;
 	info.low_limit = current->mm->mmap_base;
-	info.high_limit = TASK_SIZE;
+	info.high_limit = arch_get_mmap_end(addr);
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
 	info.align_offset = 0;
 	return vm_unmapped_area(&info);
@@ -222,7 +222,7 @@ hugetlb_get_unmapped_area_topdown(struct file *file, unsigned long addr,
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
 	info.low_limit = max(PAGE_SIZE, mmap_min_addr);
-	info.high_limit = current->mm->mmap_base;
+	info.high_limit = arch_get_mmap_base(addr, current->mm->mmap_base);
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
 	info.align_offset = 0;
 	addr = vm_unmapped_area(&info);
@@ -237,7 +237,7 @@ hugetlb_get_unmapped_area_topdown(struct file *file, unsigned long addr,
 		VM_BUG_ON(addr != -ENOMEM);
 		info.flags = 0;
 		info.low_limit = current->mm->mmap_base;
-		info.high_limit = TASK_SIZE;
+		info.high_limit = arch_get_mmap_end(addr);
 		addr = vm_unmapped_area(&info);
 	}
 
@@ -251,6 +251,7 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
 	struct hstate *h = hstate_file(file);
+	const unsigned long mmap_end = arch_get_mmap_end(addr);
 
 	if (len & ~huge_page_mask(h))
 		return -EINVAL;
@@ -266,7 +267,7 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 	if (addr) {
 		addr = ALIGN(addr, huge_page_size(h));
 		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
+		if (mmap_end - len >= addr &&
 		    (!vma || addr + len <= vm_start_gap(vma)))
 			return addr;
 	}
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index a80356e9dc69..1ad1f4bfa025 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -136,6 +136,14 @@ static inline void mm_update_next_owner(struct mm_struct *mm)
 #endif /* CONFIG_MEMCG */
 
 #ifdef CONFIG_MMU
+#ifndef arch_get_mmap_end
+#define arch_get_mmap_end(addr)	(TASK_SIZE)
+#endif
+
+#ifndef arch_get_mmap_base
+#define arch_get_mmap_base(addr, base) (base)
+#endif
+
 extern void arch_pick_mmap_layout(struct mm_struct *mm,
 				  struct rlimit *rlim_stack);
 extern unsigned long
diff --git a/mm/mmap.c b/mm/mmap.c
index 3aa839f81e63..313b57d55a63 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2117,14 +2117,6 @@ unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
 	return addr;
 }
 
-#ifndef arch_get_mmap_end
-#define arch_get_mmap_end(addr)	(TASK_SIZE)
-#endif
-
-#ifndef arch_get_mmap_base
-#define arch_get_mmap_base(addr, base) (base)
-#endif
-
 /* Get an address range which is currently unmapped.
  * For shmat() with addr=0.
  *
-- 
2.35.1

