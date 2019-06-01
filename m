Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9451831A7D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 10:09:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45GDWS0J43zDqdq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 18:09:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+47bfdebe920718d2a071+5760+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="XQVKDz+C"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45GD5l5xt7zDqcV
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2019 17:51:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=97NRNZJTOalruzbGdvLA7V2DJyb/i8oPJyqnau4LPgY=; b=XQVKDz+CV610V8QD2T/2sMgmxL
 3PmpOLfenLhTCKD3CG3pdzf10VRdlNAGVC6dc8LZABfeIDH28OKt2V1wKrDLxSCiCCjVYafZyayT7
 nHiRXnZVDVQNyiT9y+s8FJdyc0LvGcnsWoaojoRdb0KHQ3f2UA2AEmtXJgVZiXmMdDoC6SldENVhB
 4UizHZBwipyTZsLiw0HggPIH3p2dsL5yJzu/zqgNbYP8ET3g5hmtiOT4f73xaa1YMWRbkueSlKval
 LDJP6bh81n+44yW0HQyzbOnjBIcHR14Huh3OuDJ1DPPlBCsepLX2R4yZ2JhLZ3ypDqQK5EGaLgyHg
 ri8bVAbQ==;
Received: from 217-76-161-89.static.highway.a1.net ([217.76.161.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWymw-0007ok-72; Sat, 01 Jun 2019 07:50:51 +0000
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 12/16] mm: consolidate the get_user_pages* implementations
Date: Sat,  1 Jun 2019 09:49:55 +0200
Message-Id: <20190601074959.14036-13-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601074959.14036-1-hch@lst.de>
References: <20190601074959.14036-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-sh@vger.kernel.org, Andrey Konovalov <andreyknvl@google.com>,
 x86@kernel.org, linux-mips@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Khalid Aziz <khalid.aziz@oracle.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Always build mm/gup.c, and move the nommu versions and replace the
separate stubs for various functions by the default ones, with the _fast
version always falling back to the slow path because gup_fast_permitted
always returns false now if HAVE_FAST_GUP is not set, and we use the
nommu version of __get_user_pages while keeping all the wrappers common.

This also ensures the new put_user_pages* helpers are available for
nommu, as those are currently missing, which would create a problem as
soon as we actually grew users for it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/Kconfig  |   1 +
 mm/Makefile |   4 +-
 mm/gup.c    | 476 +++++++++++++++++++++++++++++-----------------------
 mm/nommu.c  |  88 ----------
 mm/util.c   |  47 ------
 5 files changed, 269 insertions(+), 347 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index 98dffb0f2447..5c41409557da 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -133,6 +133,7 @@ config HAVE_MEMBLOCK_PHYS_MAP
 	bool
 
 config HAVE_FAST_GUP
+	depends on MMU
 	bool
 
 config ARCH_KEEP_MEMBLOCK
diff --git a/mm/Makefile b/mm/Makefile
index ac5e5ba78874..dc0746ca1109 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -22,7 +22,7 @@ KCOV_INSTRUMENT_mmzone.o := n
 KCOV_INSTRUMENT_vmstat.o := n
 
 mmu-y			:= nommu.o
-mmu-$(CONFIG_MMU)	:= gup.o highmem.o memory.o mincore.o \
+mmu-$(CONFIG_MMU)	:= highmem.o memory.o mincore.o \
 			   mlock.o mmap.o mmu_gather.o mprotect.o mremap.o \
 			   msync.o page_vma_mapped.o pagewalk.o \
 			   pgtable-generic.o rmap.o vmalloc.o
@@ -39,7 +39,7 @@ obj-y			:= filemap.o mempool.o oom_kill.o fadvise.o \
 			   mm_init.o mmu_context.o percpu.o slab_common.o \
 			   compaction.o vmacache.o \
 			   interval_tree.o list_lru.o workingset.o \
-			   debug.o $(mmu-y)
+			   debug.o gup.o $(mmu-y)
 
 # Give 'page_alloc' its own module-parameter namespace
 page-alloc-y := page_alloc.o
diff --git a/mm/gup.c b/mm/gup.c
index a24f52292c7f..c8da7764de9c 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -134,6 +134,7 @@ void put_user_pages(struct page **pages, unsigned long npages)
 }
 EXPORT_SYMBOL(put_user_pages);
 
+#ifdef CONFIG_MMU
 static struct page *no_page_table(struct vm_area_struct *vma,
 		unsigned int flags)
 {
@@ -1099,86 +1100,6 @@ static __always_inline long __get_user_pages_locked(struct task_struct *tsk,
 	return pages_done;
 }
 
-/*
- * We can leverage the VM_FAULT_RETRY functionality in the page fault
- * paths better by using either get_user_pages_locked() or
- * get_user_pages_unlocked().
- *
- * get_user_pages_locked() is suitable to replace the form:
- *
- *      down_read(&mm->mmap_sem);
- *      do_something()
- *      get_user_pages(tsk, mm, ..., pages, NULL);
- *      up_read(&mm->mmap_sem);
- *
- *  to:
- *
- *      int locked = 1;
- *      down_read(&mm->mmap_sem);
- *      do_something()
- *      get_user_pages_locked(tsk, mm, ..., pages, &locked);
- *      if (locked)
- *          up_read(&mm->mmap_sem);
- */
-long get_user_pages_locked(unsigned long start, unsigned long nr_pages,
-			   unsigned int gup_flags, struct page **pages,
-			   int *locked)
-{
-	/*
-	 * FIXME: Current FOLL_LONGTERM behavior is incompatible with
-	 * FAULT_FLAG_ALLOW_RETRY because of the FS DAX check requirement on
-	 * vmas.  As there are no users of this flag in this call we simply
-	 * disallow this option for now.
-	 */
-	if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
-		return -EINVAL;
-
-	return __get_user_pages_locked(current, current->mm, start, nr_pages,
-				       pages, NULL, locked,
-				       gup_flags | FOLL_TOUCH);
-}
-EXPORT_SYMBOL(get_user_pages_locked);
-
-/*
- * get_user_pages_unlocked() is suitable to replace the form:
- *
- *      down_read(&mm->mmap_sem);
- *      get_user_pages(tsk, mm, ..., pages, NULL);
- *      up_read(&mm->mmap_sem);
- *
- *  with:
- *
- *      get_user_pages_unlocked(tsk, mm, ..., pages);
- *
- * It is functionally equivalent to get_user_pages_fast so
- * get_user_pages_fast should be used instead if specific gup_flags
- * (e.g. FOLL_FORCE) are not required.
- */
-long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
-			     struct page **pages, unsigned int gup_flags)
-{
-	struct mm_struct *mm = current->mm;
-	int locked = 1;
-	long ret;
-
-	/*
-	 * FIXME: Current FOLL_LONGTERM behavior is incompatible with
-	 * FAULT_FLAG_ALLOW_RETRY because of the FS DAX check requirement on
-	 * vmas.  As there are no users of this flag in this call we simply
-	 * disallow this option for now.
-	 */
-	if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
-		return -EINVAL;
-
-	down_read(&mm->mmap_sem);
-	ret = __get_user_pages_locked(current, mm, start, nr_pages, pages, NULL,
-				      &locked, gup_flags | FOLL_TOUCH);
-	if (locked)
-		up_read(&mm->mmap_sem);
-	return ret;
-}
-EXPORT_SYMBOL(get_user_pages_unlocked);
-
 /*
  * get_user_pages_remote() - pin user pages in memory
  * @tsk:	the task_struct to use for page fault accounting, or
@@ -1255,6 +1176,199 @@ long get_user_pages_remote(struct task_struct *tsk, struct mm_struct *mm,
 }
 EXPORT_SYMBOL(get_user_pages_remote);
 
+/**
+ * populate_vma_page_range() -  populate a range of pages in the vma.
+ * @vma:   target vma
+ * @start: start address
+ * @end:   end address
+ * @nonblocking:
+ *
+ * This takes care of mlocking the pages too if VM_LOCKED is set.
+ *
+ * return 0 on success, negative error code on error.
+ *
+ * vma->vm_mm->mmap_sem must be held.
+ *
+ * If @nonblocking is NULL, it may be held for read or write and will
+ * be unperturbed.
+ *
+ * If @nonblocking is non-NULL, it must held for read only and may be
+ * released.  If it's released, *@nonblocking will be set to 0.
+ */
+long populate_vma_page_range(struct vm_area_struct *vma,
+		unsigned long start, unsigned long end, int *nonblocking)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long nr_pages = (end - start) / PAGE_SIZE;
+	int gup_flags;
+
+	VM_BUG_ON(start & ~PAGE_MASK);
+	VM_BUG_ON(end   & ~PAGE_MASK);
+	VM_BUG_ON_VMA(start < vma->vm_start, vma);
+	VM_BUG_ON_VMA(end   > vma->vm_end, vma);
+	VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_sem), mm);
+
+	gup_flags = FOLL_TOUCH | FOLL_POPULATE | FOLL_MLOCK;
+	if (vma->vm_flags & VM_LOCKONFAULT)
+		gup_flags &= ~FOLL_POPULATE;
+	/*
+	 * We want to touch writable mappings with a write fault in order
+	 * to break COW, except for shared mappings because these don't COW
+	 * and we would not want to dirty them for nothing.
+	 */
+	if ((vma->vm_flags & (VM_WRITE | VM_SHARED)) == VM_WRITE)
+		gup_flags |= FOLL_WRITE;
+
+	/*
+	 * We want mlock to succeed for regions that have any permissions
+	 * other than PROT_NONE.
+	 */
+	if (vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC))
+		gup_flags |= FOLL_FORCE;
+
+	/*
+	 * We made sure addr is within a VMA, so the following will
+	 * not result in a stack expansion that recurses back here.
+	 */
+	return __get_user_pages(current, mm, start, nr_pages, gup_flags,
+				NULL, NULL, nonblocking);
+}
+
+/*
+ * __mm_populate - populate and/or mlock pages within a range of address space.
+ *
+ * This is used to implement mlock() and the MAP_POPULATE / MAP_LOCKED mmap
+ * flags. VMAs must be already marked with the desired vm_flags, and
+ * mmap_sem must not be held.
+ */
+int __mm_populate(unsigned long start, unsigned long len, int ignore_errors)
+{
+	struct mm_struct *mm = current->mm;
+	unsigned long end, nstart, nend;
+	struct vm_area_struct *vma = NULL;
+	int locked = 0;
+	long ret = 0;
+
+	end = start + len;
+
+	for (nstart = start; nstart < end; nstart = nend) {
+		/*
+		 * We want to fault in pages for [nstart; end) address range.
+		 * Find first corresponding VMA.
+		 */
+		if (!locked) {
+			locked = 1;
+			down_read(&mm->mmap_sem);
+			vma = find_vma(mm, nstart);
+		} else if (nstart >= vma->vm_end)
+			vma = vma->vm_next;
+		if (!vma || vma->vm_start >= end)
+			break;
+		/*
+		 * Set [nstart; nend) to intersection of desired address
+		 * range with the first VMA. Also, skip undesirable VMA types.
+		 */
+		nend = min(end, vma->vm_end);
+		if (vma->vm_flags & (VM_IO | VM_PFNMAP))
+			continue;
+		if (nstart < vma->vm_start)
+			nstart = vma->vm_start;
+		/*
+		 * Now fault in a range of pages. populate_vma_page_range()
+		 * double checks the vma flags, so that it won't mlock pages
+		 * if the vma was already munlocked.
+		 */
+		ret = populate_vma_page_range(vma, nstart, nend, &locked);
+		if (ret < 0) {
+			if (ignore_errors) {
+				ret = 0;
+				continue;	/* continue at next VMA */
+			}
+			break;
+		}
+		nend = nstart + ret * PAGE_SIZE;
+		ret = 0;
+	}
+	if (locked)
+		up_read(&mm->mmap_sem);
+	return ret;	/* 0 or negative error code */
+}
+
+/**
+ * get_dump_page() - pin user page in memory while writing it to core dump
+ * @addr: user address
+ *
+ * Returns struct page pointer of user page pinned for dump,
+ * to be freed afterwards by put_page().
+ *
+ * Returns NULL on any kind of failure - a hole must then be inserted into
+ * the corefile, to preserve alignment with its headers; and also returns
+ * NULL wherever the ZERO_PAGE, or an anonymous pte_none, has been found -
+ * allowing a hole to be left in the corefile to save diskspace.
+ *
+ * Called without mmap_sem, but after all other threads have been killed.
+ */
+#ifdef CONFIG_ELF_CORE
+struct page *get_dump_page(unsigned long addr)
+{
+	struct vm_area_struct *vma;
+	struct page *page;
+
+	if (__get_user_pages(current, current->mm, addr, 1,
+			     FOLL_FORCE | FOLL_DUMP | FOLL_GET, &page, &vma,
+			     NULL) < 1)
+		return NULL;
+	flush_cache_page(vma, addr, page_to_pfn(page));
+	return page;
+}
+#endif /* CONFIG_ELF_CORE */
+
+#else /* CONFIG_MMU */
+static long __get_user_pages_locked(struct task_struct *tsk,
+		struct mm_struct *mm, unsigned long start,
+		unsigned long nr_pages, struct page **pages,
+		struct vm_area_struct **vmas, int *locked,
+		unsigned int foll_flags)
+{
+	struct vm_area_struct *vma;
+	unsigned long vm_flags;
+	int i;
+
+	/* calculate required read or write permissions.
+	 * If FOLL_FORCE is set, we only require the "MAY" flags.
+	 */
+	vm_flags  = (foll_flags & FOLL_WRITE) ?
+			(VM_WRITE | VM_MAYWRITE) : (VM_READ | VM_MAYREAD);
+	vm_flags &= (foll_flags & FOLL_FORCE) ?
+			(VM_MAYREAD | VM_MAYWRITE) : (VM_READ | VM_WRITE);
+
+	for (i = 0; i < nr_pages; i++) {
+		vma = find_vma(mm, start);
+		if (!vma)
+			goto finish_or_fault;
+
+		/* protect what we can, including chardevs */
+		if ((vma->vm_flags & (VM_IO | VM_PFNMAP)) ||
+		    !(vm_flags & vma->vm_flags))
+			goto finish_or_fault;
+
+		if (pages) {
+			pages[i] = virt_to_page(start);
+			if (pages[i])
+				get_page(pages[i]);
+		}
+		if (vmas)
+			vmas[i] = vma;
+		start = (start + PAGE_SIZE) & PAGE_MASK;
+	}
+
+	return i;
+
+finish_or_fault:
+	return i ? : -EFAULT;
+}
+#endif /* !CONFIG_MMU */
+
 #if defined(CONFIG_FS_DAX) || defined (CONFIG_CMA)
 static bool check_dax_vmas(struct vm_area_struct **vmas, long nr_pages)
 {
@@ -1416,7 +1530,7 @@ static long check_and_migrate_cma_pages(struct task_struct *tsk,
 {
 	return nr_pages;
 }
-#endif
+#endif /* CONFIG_CMA */
 
 /*
  * __gup_longterm_locked() is a wrapper for __get_user_pages_locked which
@@ -1502,152 +1616,85 @@ long get_user_pages(unsigned long start, unsigned long nr_pages,
 }
 EXPORT_SYMBOL(get_user_pages);
 
-/**
- * populate_vma_page_range() -  populate a range of pages in the vma.
- * @vma:   target vma
- * @start: start address
- * @end:   end address
- * @nonblocking:
- *
- * This takes care of mlocking the pages too if VM_LOCKED is set.
+/*
+ * We can leverage the VM_FAULT_RETRY functionality in the page fault
+ * paths better by using either get_user_pages_locked() or
+ * get_user_pages_unlocked().
  *
- * return 0 on success, negative error code on error.
+ * get_user_pages_locked() is suitable to replace the form:
  *
- * vma->vm_mm->mmap_sem must be held.
+ *      down_read(&mm->mmap_sem);
+ *      do_something()
+ *      get_user_pages(tsk, mm, ..., pages, NULL);
+ *      up_read(&mm->mmap_sem);
  *
- * If @nonblocking is NULL, it may be held for read or write and will
- * be unperturbed.
+ *  to:
  *
- * If @nonblocking is non-NULL, it must held for read only and may be
- * released.  If it's released, *@nonblocking will be set to 0.
+ *      int locked = 1;
+ *      down_read(&mm->mmap_sem);
+ *      do_something()
+ *      get_user_pages_locked(tsk, mm, ..., pages, &locked);
+ *      if (locked)
+ *          up_read(&mm->mmap_sem);
  */
-long populate_vma_page_range(struct vm_area_struct *vma,
-		unsigned long start, unsigned long end, int *nonblocking)
+long get_user_pages_locked(unsigned long start, unsigned long nr_pages,
+			   unsigned int gup_flags, struct page **pages,
+			   int *locked)
 {
-	struct mm_struct *mm = vma->vm_mm;
-	unsigned long nr_pages = (end - start) / PAGE_SIZE;
-	int gup_flags;
-
-	VM_BUG_ON(start & ~PAGE_MASK);
-	VM_BUG_ON(end   & ~PAGE_MASK);
-	VM_BUG_ON_VMA(start < vma->vm_start, vma);
-	VM_BUG_ON_VMA(end   > vma->vm_end, vma);
-	VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_sem), mm);
-
-	gup_flags = FOLL_TOUCH | FOLL_POPULATE | FOLL_MLOCK;
-	if (vma->vm_flags & VM_LOCKONFAULT)
-		gup_flags &= ~FOLL_POPULATE;
-	/*
-	 * We want to touch writable mappings with a write fault in order
-	 * to break COW, except for shared mappings because these don't COW
-	 * and we would not want to dirty them for nothing.
-	 */
-	if ((vma->vm_flags & (VM_WRITE | VM_SHARED)) == VM_WRITE)
-		gup_flags |= FOLL_WRITE;
-
 	/*
-	 * We want mlock to succeed for regions that have any permissions
-	 * other than PROT_NONE.
+	 * FIXME: Current FOLL_LONGTERM behavior is incompatible with
+	 * FAULT_FLAG_ALLOW_RETRY because of the FS DAX check requirement on
+	 * vmas.  As there are no users of this flag in this call we simply
+	 * disallow this option for now.
 	 */
-	if (vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC))
-		gup_flags |= FOLL_FORCE;
+	if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
+		return -EINVAL;
 
-	/*
-	 * We made sure addr is within a VMA, so the following will
-	 * not result in a stack expansion that recurses back here.
-	 */
-	return __get_user_pages(current, mm, start, nr_pages, gup_flags,
-				NULL, NULL, nonblocking);
+	return __get_user_pages_locked(current, current->mm, start, nr_pages,
+				       pages, NULL, locked,
+				       gup_flags | FOLL_TOUCH);
 }
+EXPORT_SYMBOL(get_user_pages_locked);
 
 /*
- * __mm_populate - populate and/or mlock pages within a range of address space.
+ * get_user_pages_unlocked() is suitable to replace the form:
  *
- * This is used to implement mlock() and the MAP_POPULATE / MAP_LOCKED mmap
- * flags. VMAs must be already marked with the desired vm_flags, and
- * mmap_sem must not be held.
+ *      down_read(&mm->mmap_sem);
+ *      get_user_pages(tsk, mm, ..., pages, NULL);
+ *      up_read(&mm->mmap_sem);
+ *
+ *  with:
+ *
+ *      get_user_pages_unlocked(tsk, mm, ..., pages);
+ *
+ * It is functionally equivalent to get_user_pages_fast so
+ * get_user_pages_fast should be used instead if specific gup_flags
+ * (e.g. FOLL_FORCE) are not required.
  */
-int __mm_populate(unsigned long start, unsigned long len, int ignore_errors)
+long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
+			     struct page **pages, unsigned int gup_flags)
 {
 	struct mm_struct *mm = current->mm;
-	unsigned long end, nstart, nend;
-	struct vm_area_struct *vma = NULL;
-	int locked = 0;
-	long ret = 0;
+	int locked = 1;
+	long ret;
 
-	end = start + len;
+	/*
+	 * FIXME: Current FOLL_LONGTERM behavior is incompatible with
+	 * FAULT_FLAG_ALLOW_RETRY because of the FS DAX check requirement on
+	 * vmas.  As there are no users of this flag in this call we simply
+	 * disallow this option for now.
+	 */
+	if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
+		return -EINVAL;
 
-	for (nstart = start; nstart < end; nstart = nend) {
-		/*
-		 * We want to fault in pages for [nstart; end) address range.
-		 * Find first corresponding VMA.
-		 */
-		if (!locked) {
-			locked = 1;
-			down_read(&mm->mmap_sem);
-			vma = find_vma(mm, nstart);
-		} else if (nstart >= vma->vm_end)
-			vma = vma->vm_next;
-		if (!vma || vma->vm_start >= end)
-			break;
-		/*
-		 * Set [nstart; nend) to intersection of desired address
-		 * range with the first VMA. Also, skip undesirable VMA types.
-		 */
-		nend = min(end, vma->vm_end);
-		if (vma->vm_flags & (VM_IO | VM_PFNMAP))
-			continue;
-		if (nstart < vma->vm_start)
-			nstart = vma->vm_start;
-		/*
-		 * Now fault in a range of pages. populate_vma_page_range()
-		 * double checks the vma flags, so that it won't mlock pages
-		 * if the vma was already munlocked.
-		 */
-		ret = populate_vma_page_range(vma, nstart, nend, &locked);
-		if (ret < 0) {
-			if (ignore_errors) {
-				ret = 0;
-				continue;	/* continue at next VMA */
-			}
-			break;
-		}
-		nend = nstart + ret * PAGE_SIZE;
-		ret = 0;
-	}
+	down_read(&mm->mmap_sem);
+	ret = __get_user_pages_locked(current, mm, start, nr_pages, pages, NULL,
+				      &locked, gup_flags | FOLL_TOUCH);
 	if (locked)
 		up_read(&mm->mmap_sem);
-	return ret;	/* 0 or negative error code */
-}
-
-/**
- * get_dump_page() - pin user page in memory while writing it to core dump
- * @addr: user address
- *
- * Returns struct page pointer of user page pinned for dump,
- * to be freed afterwards by put_page().
- *
- * Returns NULL on any kind of failure - a hole must then be inserted into
- * the corefile, to preserve alignment with its headers; and also returns
- * NULL wherever the ZERO_PAGE, or an anonymous pte_none, has been found -
- * allowing a hole to be left in the corefile to save diskspace.
- *
- * Called without mmap_sem, but after all other threads have been killed.
- */
-#ifdef CONFIG_ELF_CORE
-struct page *get_dump_page(unsigned long addr)
-{
-	struct vm_area_struct *vma;
-	struct page *page;
-
-	if (__get_user_pages(current, current->mm, addr, 1,
-			     FOLL_FORCE | FOLL_DUMP | FOLL_GET, &page, &vma,
-			     NULL) < 1)
-		return NULL;
-	flush_cache_page(vma, addr, page_to_pfn(page));
-	return page;
+	return ret;
 }
-#endif /* CONFIG_ELF_CORE */
+EXPORT_SYMBOL(get_user_pages_unlocked);
 
 /*
  * Fast GUP
@@ -1682,7 +1729,7 @@ struct page *get_dump_page(unsigned long addr)
  *
  * This code is based heavily on the PowerPC implementation by Nick Piggin.
  */
-#ifdef CONFIG_HAVE_FAST_GUP
+#if defined(CONFIG_MMU) && defined(CONFIG_HAVE_FAST_GUP)
 #ifdef CONFIG_GUP_GET_PTE_LOW_HIGH
 /*
  * WARNING: only to be used in the get_user_pages_fast() implementation.
@@ -2159,6 +2206,12 @@ static void gup_pgd_range(unsigned long addr, unsigned long end,
 			return;
 	} while (pgdp++, addr = next, addr != end);
 }
+#else
+static inline void gup_pgd_range(unsigned long addr, unsigned long end,
+		unsigned int flags, struct page **pages, int *nr)
+{
+}
+#endif /* CONFIG_HAVE_FAST_GUP */
 
 #ifndef gup_fast_permitted
 /*
@@ -2167,7 +2220,7 @@ static void gup_pgd_range(unsigned long addr, unsigned long end,
  */
 static bool gup_fast_permitted(unsigned long start, unsigned long end)
 {
-	return true;
+	return IS_ENABLED(CONFIG_HAVE_FAST_GUP) ? true : false;
 }
 #endif
 
@@ -2176,6 +2229,9 @@ static bool gup_fast_permitted(unsigned long start, unsigned long end)
  * the regular GUP.
  * Note a difference with get_user_pages_fast: this always returns the
  * number of pages pinned, 0 if no pages were pinned.
+ *
+ * If the architecture does not support this function, simply return with no
+ * pages pinned.
  */
 int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 			  struct page **pages)
@@ -2213,6 +2269,7 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 
 	return nr;
 }
+EXPORT_SYMBOL_GPL(__get_user_pages_fast);
 
 static int __gup_longterm_unlocked(unsigned long start, int nr_pages,
 				   unsigned int gup_flags, struct page **pages)
@@ -2295,5 +2352,4 @@ int get_user_pages_fast(unsigned long start, int nr_pages,
 
 	return ret;
 }
-
-#endif /* CONFIG_HAVE_GENERIC_GUP */
+EXPORT_SYMBOL_GPL(get_user_pages_fast);
diff --git a/mm/nommu.c b/mm/nommu.c
index d8c02fbe03b5..07165ad2e548 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -111,94 +111,6 @@ unsigned int kobjsize(const void *objp)
 	return PAGE_SIZE << compound_order(page);
 }
 
-static long __get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
-		      unsigned long start, unsigned long nr_pages,
-		      unsigned int foll_flags, struct page **pages,
-		      struct vm_area_struct **vmas, int *nonblocking)
-{
-	struct vm_area_struct *vma;
-	unsigned long vm_flags;
-	int i;
-
-	/* calculate required read or write permissions.
-	 * If FOLL_FORCE is set, we only require the "MAY" flags.
-	 */
-	vm_flags  = (foll_flags & FOLL_WRITE) ?
-			(VM_WRITE | VM_MAYWRITE) : (VM_READ | VM_MAYREAD);
-	vm_flags &= (foll_flags & FOLL_FORCE) ?
-			(VM_MAYREAD | VM_MAYWRITE) : (VM_READ | VM_WRITE);
-
-	for (i = 0; i < nr_pages; i++) {
-		vma = find_vma(mm, start);
-		if (!vma)
-			goto finish_or_fault;
-
-		/* protect what we can, including chardevs */
-		if ((vma->vm_flags & (VM_IO | VM_PFNMAP)) ||
-		    !(vm_flags & vma->vm_flags))
-			goto finish_or_fault;
-
-		if (pages) {
-			pages[i] = virt_to_page(start);
-			if (pages[i])
-				get_page(pages[i]);
-		}
-		if (vmas)
-			vmas[i] = vma;
-		start = (start + PAGE_SIZE) & PAGE_MASK;
-	}
-
-	return i;
-
-finish_or_fault:
-	return i ? : -EFAULT;
-}
-
-/*
- * get a list of pages in an address range belonging to the specified process
- * and indicate the VMA that covers each page
- * - this is potentially dodgy as we may end incrementing the page count of a
- *   slab page or a secondary page from a compound page
- * - don't permit access to VMAs that don't support it, such as I/O mappings
- */
-long get_user_pages(unsigned long start, unsigned long nr_pages,
-		    unsigned int gup_flags, struct page **pages,
-		    struct vm_area_struct **vmas)
-{
-	return __get_user_pages(current, current->mm, start, nr_pages,
-				gup_flags, pages, vmas, NULL);
-}
-EXPORT_SYMBOL(get_user_pages);
-
-long get_user_pages_locked(unsigned long start, unsigned long nr_pages,
-			    unsigned int gup_flags, struct page **pages,
-			    int *locked)
-{
-	return get_user_pages(start, nr_pages, gup_flags, pages, NULL);
-}
-EXPORT_SYMBOL(get_user_pages_locked);
-
-static long __get_user_pages_unlocked(struct task_struct *tsk,
-			struct mm_struct *mm, unsigned long start,
-			unsigned long nr_pages, struct page **pages,
-			unsigned int gup_flags)
-{
-	long ret;
-	down_read(&mm->mmap_sem);
-	ret = __get_user_pages(tsk, mm, start, nr_pages, gup_flags, pages,
-				NULL, NULL);
-	up_read(&mm->mmap_sem);
-	return ret;
-}
-
-long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
-			     struct page **pages, unsigned int gup_flags)
-{
-	return __get_user_pages_unlocked(current, current->mm, start, nr_pages,
-					 pages, gup_flags);
-}
-EXPORT_SYMBOL(get_user_pages_unlocked);
-
 /**
  * follow_pfn - look up PFN at a user virtual address
  * @vma: memory mapping
diff --git a/mm/util.c b/mm/util.c
index 91682a2090ee..d58f5b0eb669 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -300,53 +300,6 @@ void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
 }
 #endif
 
-/*
- * Like get_user_pages_fast() except its IRQ-safe in that it won't fall
- * back to the regular GUP.
- * Note a difference with get_user_pages_fast: this always returns the
- * number of pages pinned, 0 if no pages were pinned.
- * If the architecture does not support this function, simply return with no
- * pages pinned.
- */
-int __weak __get_user_pages_fast(unsigned long start,
-				 int nr_pages, int write, struct page **pages)
-{
-	return 0;
-}
-EXPORT_SYMBOL_GPL(__get_user_pages_fast);
-
-/**
- * get_user_pages_fast() - pin user pages in memory
- * @start:	starting user address
- * @nr_pages:	number of pages from start to pin
- * @gup_flags:	flags modifying pin behaviour
- * @pages:	array that receives pointers to the pages pinned.
- *		Should be at least nr_pages long.
- *
- * get_user_pages_fast provides equivalent functionality to get_user_pages,
- * operating on current and current->mm, with force=0 and vma=NULL. However
- * unlike get_user_pages, it must be called without mmap_sem held.
- *
- * get_user_pages_fast may take mmap_sem and page table locks, so no
- * assumptions can be made about lack of locking. get_user_pages_fast is to be
- * implemented in a way that is advantageous (vs get_user_pages()) when the
- * user memory area is already faulted in and present in ptes. However if the
- * pages have to be faulted in, it may turn out to be slightly slower so
- * callers need to carefully consider what to use. On many architectures,
- * get_user_pages_fast simply falls back to get_user_pages.
- *
- * Return: number of pages pinned. This may be fewer than the number
- * requested. If nr_pages is 0 or negative, returns 0. If no pages
- * were pinned, returns -errno.
- */
-int __weak get_user_pages_fast(unsigned long start,
-				int nr_pages, unsigned int gup_flags,
-				struct page **pages)
-{
-	return get_user_pages_unlocked(start, nr_pages, pages, gup_flags);
-}
-EXPORT_SYMBOL_GPL(get_user_pages_fast);
-
 unsigned long vm_mmap_pgoff(struct file *file, unsigned long addr,
 	unsigned long len, unsigned long prot,
 	unsigned long flag, unsigned long pgoff)
-- 
2.20.1

