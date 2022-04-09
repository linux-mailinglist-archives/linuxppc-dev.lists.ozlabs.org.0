Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 448A14FA9E2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 19:21:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbMMy2grQz3dqG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 03:21:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbMKB41nsz3bbj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 03:18:38 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KbMJq18KFz9sT3;
 Sat,  9 Apr 2022 19:18:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S02IfVex6DSb; Sat,  9 Apr 2022 19:18:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KbMJl53WPz9sTW;
 Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9A54D8B76D;
 Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SFXpMaUsSCof; Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.53])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8EEDC8B76E;
 Sat,  9 Apr 2022 19:18:14 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 239HI74Y833210
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 9 Apr 2022 19:18:07 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 239HI7WO833209;
 Sat, 9 Apr 2022 19:18:07 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, akpm@linux-foundation.org
Subject: [PATCH v10 04/13] mm: Add len and flags parameters to
 arch_get_mmap_end()
Date: Sat,  9 Apr 2022 19:17:28 +0200
Message-Id: <b556daabe7d2bdb2361c4d6130280da7c1ba2c14.1649523076.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649523076.git.christophe.leroy@csgroup.eu>
References: <cover.1649523076.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1649524639; l=3998; s=20211009;
 h=from:subject:message-id; bh=3Bhxej7OCnv28c8lqtsHOrn0Gd/Xg0/Tq6nj5slIOu4=;
 b=3irWqdKhDGyXUJnpMBZ6Y7nCb5wEWgqEzKLo5XBVZgWsGQoKnjCy4wRFJsExnzyp2UD5OdpAQZQy
 Vp3JlPKNCyHmwButnVvAs0bC3g00uFCUb0/aX6wCHCJCarJuamD0
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
Cc: Will Deacon <will@kernel.org>, Steve Capper <steve.capper@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Powerpc needs flags and len to make decision on arch_get_mmap_end().

So add them as parameters to arch_get_mmap_end().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Andrew Morton <akpm@linux-foundation.org>
---
 arch/arm64/include/asm/processor.h | 4 ++--
 fs/hugetlbfs/inode.c               | 6 +++---
 include/linux/sched/mm.h           | 2 +-
 mm/mmap.c                          | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 73e38d9a540c..bd22d94e844d 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -92,8 +92,8 @@
 #endif /* CONFIG_COMPAT */
 
 #ifndef CONFIG_ARM64_FORCE_52BIT
-#define arch_get_mmap_end(addr) ((addr > DEFAULT_MAP_WINDOW) ? TASK_SIZE :\
-				DEFAULT_MAP_WINDOW)
+#define arch_get_mmap_end(addr, len, flags) \
+		(((addr) > DEFAULT_MAP_WINDOW) ? TASK_SIZE : DEFAULT_MAP_WINDOW)
 
 #define arch_get_mmap_base(addr, base) ((addr > DEFAULT_MAP_WINDOW) ? \
 					base + TASK_SIZE - DEFAULT_MAP_WINDOW :\
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index ec611c7de9e3..6f863497bd69 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -205,7 +205,7 @@ hugetlb_get_unmapped_area_bottomup(struct file *file, unsigned long addr,
 	info.flags = 0;
 	info.length = len;
 	info.low_limit = current->mm->mmap_base;
-	info.high_limit = arch_get_mmap_end(addr);
+	info.high_limit = arch_get_mmap_end(addr, len, flags);
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
 	info.align_offset = 0;
 	return vm_unmapped_area(&info);
@@ -236,7 +236,7 @@ hugetlb_get_unmapped_area_topdown(struct file *file, unsigned long addr,
 		VM_BUG_ON(addr != -ENOMEM);
 		info.flags = 0;
 		info.low_limit = current->mm->mmap_base;
-		info.high_limit = arch_get_mmap_end(addr);
+		info.high_limit = arch_get_mmap_end(addr, len, flags);
 		addr = vm_unmapped_area(&info);
 	}
 
@@ -251,7 +251,7 @@ generic_hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
 	struct hstate *h = hstate_file(file);
-	const unsigned long mmap_end = arch_get_mmap_end(addr);
+	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
 
 	if (len & ~huge_page_mask(h))
 		return -EINVAL;
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index da3a32d05b34..8cd975a8bfeb 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -137,7 +137,7 @@ static inline void mm_update_next_owner(struct mm_struct *mm)
 
 #ifdef CONFIG_MMU
 #ifndef arch_get_mmap_end
-#define arch_get_mmap_end(addr)	(TASK_SIZE)
+#define arch_get_mmap_end(addr, len, flags)	(TASK_SIZE)
 #endif
 
 #ifndef arch_get_mmap_base
diff --git a/mm/mmap.c b/mm/mmap.c
index d2b6c3fbfb8c..e9b7d74e58bc 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2136,7 +2136,7 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma, *prev;
 	struct vm_unmapped_area_info info;
-	const unsigned long mmap_end = arch_get_mmap_end(addr);
+	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
 
 	if (len > mmap_end - mmap_min_addr)
 		return -ENOMEM;
@@ -2184,7 +2184,7 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 	struct vm_area_struct *vma, *prev;
 	struct mm_struct *mm = current->mm;
 	struct vm_unmapped_area_info info;
-	const unsigned long mmap_end = arch_get_mmap_end(addr);
+	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
 
 	/* requested length too big for entire address space */
 	if (len > mmap_end - mmap_min_addr)
-- 
2.35.1

