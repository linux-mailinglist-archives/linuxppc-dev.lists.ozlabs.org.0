Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4983949F7F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 12:10:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlZVt1ln1z3cCr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 22:10:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JlZVS60Qtz2ybD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 22:09:50 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6554113E;
 Fri, 28 Jan 2022 03:09:47 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.45.35])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F246B3F766;
 Fri, 28 Jan 2022 03:09:41 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH V3 1/2] mm/migration: Add trace events for THP migrations
Date: Fri, 28 Jan 2022 16:39:41 +0530
Message-Id: <1643368182-9588-2-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643368182-9588-1-git-send-email-anshuman.khandual@arm.com>
References: <1643368182-9588-1-git-send-email-anshuman.khandual@arm.com>
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
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Matthew Wilcox <willy@infradead.org>,
 Zi Yan <ziy@nvidia.com>, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds two trace events for PMD based THP migration without split. These
events closely follow the implementation details like setting and removing
of PMD migration entries, which are essential operations for THP migration.
This moves CREATE_TRACE_POINTS into generic THP from powerpc for these new
trace events to be available on other platforms as well.

Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/powerpc/mm/book3s64/trace.c |  1 -
 include/trace/events/thp.h       | 27 +++++++++++++++++++++++++++
 mm/huge_memory.c                 |  5 +++++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/trace.c b/arch/powerpc/mm/book3s64/trace.c
index b86e7b906257..ccd64b5e6cac 100644
--- a/arch/powerpc/mm/book3s64/trace.c
+++ b/arch/powerpc/mm/book3s64/trace.c
@@ -3,6 +3,5 @@
  * This file is for defining trace points and trace related helpers.
  */
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-#define CREATE_TRACE_POINTS
 #include <trace/events/thp.h>
 #endif
diff --git a/include/trace/events/thp.h b/include/trace/events/thp.h
index ca3f2767828a..202b3e3e67ff 100644
--- a/include/trace/events/thp.h
+++ b/include/trace/events/thp.h
@@ -48,6 +48,33 @@ TRACE_EVENT(hugepage_update,
 	    TP_printk("hugepage update at addr 0x%lx and pte = 0x%lx clr = 0x%lx, set = 0x%lx", __entry->addr, __entry->pte, __entry->clr, __entry->set)
 );
 
+DECLARE_EVENT_CLASS(migration_pmd,
+
+		TP_PROTO(unsigned long addr, unsigned long pmd),
+
+		TP_ARGS(addr, pmd),
+
+		TP_STRUCT__entry(
+			__field(unsigned long, addr)
+			__field(unsigned long, pmd)
+		),
+
+		TP_fast_assign(
+			__entry->addr = addr;
+			__entry->pmd = pmd;
+		),
+		TP_printk("addr=%lx, pmd=%lx", __entry->addr, __entry->pmd)
+);
+
+DEFINE_EVENT(migration_pmd, set_migration_pmd,
+	TP_PROTO(unsigned long addr, unsigned long pmd),
+	TP_ARGS(addr, pmd)
+);
+
+DEFINE_EVENT(migration_pmd, remove_migration_pmd,
+	TP_PROTO(unsigned long addr, unsigned long pmd),
+	TP_ARGS(addr, pmd)
+);
 #endif /* _TRACE_THP_H */
 
 /* This part must be outside protection */
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 406a3c28c026..ab49f9a3e420 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -39,6 +39,9 @@
 #include <asm/pgalloc.h>
 #include "internal.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/thp.h>
+
 /*
  * By default, transparent hugepage support is disabled in order to avoid
  * risking an increased memory footprint for applications that are not
@@ -3173,6 +3176,7 @@ void set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
 	set_pmd_at(mm, address, pvmw->pmd, pmdswp);
 	page_remove_rmap(page, true);
 	put_page(page);
+	trace_set_migration_pmd(address, pmd_val(pmdswp));
 }
 
 void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
@@ -3206,5 +3210,6 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 	if ((vma->vm_flags & VM_LOCKED) && !PageDoubleMap(new))
 		mlock_vma_page(new);
 	update_mmu_cache_pmd(vma, address, pvmw->pmd);
+	trace_remove_migration_pmd(address, pmd_val(pmde));
 }
 #endif
-- 
2.25.1

