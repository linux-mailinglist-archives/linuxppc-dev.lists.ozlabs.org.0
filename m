Return-Path: <linuxppc-dev+bounces-34-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB5C94F971
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 00:14:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iG9alS4E;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LsUwHmgy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjTLx4QGhz2xWT;
	Tue, 13 Aug 2024 08:14:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iG9alS4E;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LsUwHmgy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjN0f6jxJz2xQG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 04:12:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723486367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A/6PEtzQTa+drbYKkEnodTZuUMYm4tSA4vStMaJG0Ro=;
	b=iG9alS4EWoBZNdc4uHYF4dGaPrxdfXBfwyYJn5fbyJXH4W+O+fXGIa+w/q1/YPCTyNDfBP
	5u7l8TezQ/TB+wjMZHOwxhHkGiKaGyU9RYcvXnsxEP2qWErEWwNDducF2mlb2A9M/bgwt/
	ttK+XMGKdrIlQB+KzoQvMe2wFY0KtlA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723486368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A/6PEtzQTa+drbYKkEnodTZuUMYm4tSA4vStMaJG0Ro=;
	b=LsUwHmgySMm6mK2YuBCj95NSk3THe3p0E9aspsuhM4V3HIucDTCVMpn5OgtUJLB6SkQJGa
	4PmN2e9RBzUomBydl0grWlM1vuBy0Pfb6xPzbO9HpXdK4neDvol50kn2lBfWcIRTayo9KM
	7RLd7TeHItqADFMgts+MzqS0NA+/2ZI=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-TXggaF51MY6omMss3cvHeQ-1; Mon, 12 Aug 2024 14:12:45 -0400
X-MC-Unique: TXggaF51MY6omMss3cvHeQ-1
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-4928d06cfebso184721137.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 11:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723486364; x=1724091164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/6PEtzQTa+drbYKkEnodTZuUMYm4tSA4vStMaJG0Ro=;
        b=QQfbKXn0Jz+cBkbAvfjJbMaaQfdZrvrf9PpfFzQ5DnGEG86AALnVpbhEa0fbK3DBH6
         D0IY4MHHr3dwloDHJyRQjgNdGZoXojPa1PhJzUCvNCLq0r1cnR/fyG24iElCgm5iG94s
         yBKUX7R/n+z+mT8C0BCR0/l+1YoDhR4QuPupmIxJl8pG4xhMgK1D7hO6SXIMsBBdQzmX
         knok+M0Ze6JA8p7Xv/sbaywu7afyrRR+AkiHi9gSBCj827IA8y6MGY1Cu4iYY1oEUDXZ
         eq4e20chFIeD/hy0JNdUMhJ7j8caoGeQXg0K72jUz3rqaclNvuG/LGUurRTxTsaMA9qY
         sCkw==
X-Forwarded-Encrypted: i=1; AJvYcCVfjzQtAfUEQa/A8LrgGk6zOtIroZthqrSma1Goq2lDXOVdLcQ/a+UCEVl/pyNZXO8lfGRBYlXr64nR2Gg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzd7oMtZtl5F+FXtbNi7aICSQAUB7Q15XIW5ZuqlXEgKXOpbWLL
	mJvuSdlSJLuEraieVHqoWAADhYCMHMjbcQSZQXdvtUNSYHufAHaPB0au9oyWu4w/MLVRqCLwhJE
	qjG7GR6LSY9XX8Xr0XI1AyXFJgpZjUawrjajKiF1V++31zv2zsKUyLgQ4Xx7KdGI=
X-Received: by 2002:a05:6102:38d1:b0:493:31f9:d14e with SMTP id ada2fe7eead31-4974398cf6amr785262137.2.1723486364425;
        Mon, 12 Aug 2024 11:12:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGg++VQElyCH8BIocMaINRG5gLiISp0Xxb9L94RctCtM0eBivu+dVoRsXo8+SybwrNJQcpMw==
X-Received: by 2002:a05:6102:38d1:b0:493:31f9:d14e with SMTP id ada2fe7eead31-4974398cf6amr785238137.2.1723486364018;
        Mon, 12 Aug 2024 11:12:44 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7dee013sm268663985a.84.2024.08.12.11.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 11:12:43 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: "Kirill A . Shutemov" <kirill@shutemov.name>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	Huang Ying <ying.huang@intel.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	peterx@redhat.com,
	Vlastimil Babka <vbabka@suse.cz>,
	Rick P Edgecombe <rick.p.edgecombe@intel.com>,
	Hugh Dickins <hughd@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Rik van Riel <riel@surriel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linuxppc-dev@lists.ozlabs.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Oscar Salvador <osalvador@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v5 7/7] mm/mprotect: fix dax pud handlings
Date: Mon, 12 Aug 2024 14:12:25 -0400
Message-ID: <20240812181225.1360970-8-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240812181225.1360970-1-peterx@redhat.com>
References: <20240812181225.1360970-1-peterx@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This is only relevant to the two archs that support PUD dax, aka, x86_64
and ppc64.  PUD THPs do not yet exist elsewhere, and hugetlb PUDs do not
count in this case.

DAX have had PUD mappings for years, but change protection path never
worked.  When the path is triggered in any form (a simple test program
would be: call mprotect() on a 1G dev_dax mapping), the kernel will report
"bad pud".  This patch should fix that.

The new change_huge_pud() tries to keep everything simple.  For example, it
doesn't optimize write bit as that will need even more PUD helpers.  It's
not too bad anyway to have one more write fault in the worst case once for
1G range; may be a bigger thing for each PAGE_SIZE, though.  Neither does
it support userfault-wp bits, as there isn't such PUD mappings that is
supported; file mappings always need a split there.

The same to TLB shootdown: the pmd path (which was for x86 only) has the
trick of using _ad() version of pmdp_invalidate*() which can avoid one
redundant TLB, but let's also leave that for later.  Again, the larger the
mapping, the smaller of such effect.

There's some difference on handling "retry" for change_huge_pud() (where it
can return 0): it isn't like change_huge_pmd(), as the pmd version is safe
with all conditions handled in change_pte_range() later, thanks to Hugh's
new pte_offset_map_lock().  In short, change_pte_range() is simply smarter.
For that, change_pud_range() will need proper retry if it races with
something else when a huge PUD changed from under us.

The last thing to mention is currently the PUD path ignores the huge pte
numa counter (NUMA_HUGE_PTE_UPDATES), not only because DAX is not
applicable to NUMA, but also that it's ambiguous on its own to decide how
to account pud in this case.  In one earlier version of this patchset I
proposed to remove the counter as it doesn't even look right to do the
accounting as of now [1], but then a further discussion suggests we can
leave that for later, as that doesn't block this series if we choose to
ignore that counter.  That's what this patch does, by ignoring it.

When at it, touch up the comment in pgtable_split_needed() to make it
generic to either pmd or pud file THPs.

[1] https://lore.kernel.org/all/20240715192142.3241557-3-peterx@redhat.com/
[2] https://lore.kernel.org/r/added2d0-b8be-4108-82ca-1367a388d0b1@redhat.com

Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Kirill A. Shutemov <kirill@shutemov.name>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: x86@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Fixes: a00cc7d9dd93 ("mm, x86: add support for PUD-sized transparent hugepages")
Fixes: 27af67f35631 ("powerpc/book3s64/mm: enable transparent pud hugepage")
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/huge_mm.h | 24 +++++++++++++++++++
 mm/huge_memory.c        | 52 +++++++++++++++++++++++++++++++++++++++++
 mm/mprotect.c           | 39 ++++++++++++++++++++++++-------
 3 files changed, 107 insertions(+), 8 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index ce44caa40eed..6370026689e0 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -342,6 +342,17 @@ void split_huge_pmd_address(struct vm_area_struct *vma, unsigned long address,
 void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
 		unsigned long address);
 
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+int change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
+		    pud_t *pudp, unsigned long addr, pgprot_t newprot,
+		    unsigned long cp_flags);
+#else
+static inline int
+change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
+		pud_t *pudp, unsigned long addr, pgprot_t newprot,
+		unsigned long cp_flags) { return 0; }
+#endif
+
 #define split_huge_pud(__vma, __pud, __address)				\
 	do {								\
 		pud_t *____pud = (__pud);				\
@@ -585,6 +596,19 @@ static inline int next_order(unsigned long *orders, int prev)
 {
 	return 0;
 }
+
+static inline void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
+				    unsigned long address)
+{
+}
+
+static inline int change_huge_pud(struct mmu_gather *tlb,
+				  struct vm_area_struct *vma, pud_t *pudp,
+				  unsigned long addr, pgprot_t newprot,
+				  unsigned long cp_flags)
+{
+	return 0;
+}
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 static inline int split_folio_to_list_to_order(struct folio *folio,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 81c5da0708ed..0aafd26d7a53 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2114,6 +2114,53 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	return ret;
 }
 
+/*
+ * Returns:
+ *
+ * - 0: if pud leaf changed from under us
+ * - 1: if pud can be skipped
+ * - HPAGE_PUD_NR: if pud was successfully processed
+ */
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+int change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
+		    pud_t *pudp, unsigned long addr, pgprot_t newprot,
+		    unsigned long cp_flags)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	pud_t oldpud, entry;
+	spinlock_t *ptl;
+
+	tlb_change_page_size(tlb, HPAGE_PUD_SIZE);
+
+	/* NUMA balancing doesn't apply to dax */
+	if (cp_flags & MM_CP_PROT_NUMA)
+		return 1;
+
+	/*
+	 * Huge entries on userfault-wp only works with anonymous, while we
+	 * don't have anonymous PUDs yet.
+	 */
+	if (WARN_ON_ONCE(cp_flags & MM_CP_UFFD_WP_ALL))
+		return 1;
+
+	ptl = __pud_trans_huge_lock(pudp, vma);
+	if (!ptl)
+		return 0;
+
+	/*
+	 * Can't clear PUD or it can race with concurrent zapping.  See
+	 * change_huge_pmd().
+	 */
+	oldpud = pudp_invalidate(vma, addr, pudp);
+	entry = pud_modify(oldpud, newprot);
+	set_pud_at(mm, addr, pudp, entry);
+	tlb_flush_pud_range(tlb, addr, HPAGE_PUD_SIZE);
+
+	spin_unlock(ptl);
+	return HPAGE_PUD_NR;
+}
+#endif
+
 #ifdef CONFIG_USERFAULTFD
 /*
  * The PT lock for src_pmd and dst_vma/src_vma (for reading) are locked by
@@ -2344,6 +2391,11 @@ void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
 	spin_unlock(ptl);
 	mmu_notifier_invalidate_range_end(&range);
 }
+#else
+void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
+		unsigned long address)
+{
+}
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 
 static void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
diff --git a/mm/mprotect.c b/mm/mprotect.c
index d423080e6509..446f8e5f10d9 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -302,8 +302,9 @@ pgtable_split_needed(struct vm_area_struct *vma, unsigned long cp_flags)
 {
 	/*
 	 * pte markers only resides in pte level, if we need pte markers,
-	 * we need to split.  We cannot wr-protect shmem thp because file
-	 * thp is handled differently when split by erasing the pmd so far.
+	 * we need to split.  For example, we cannot wr-protect a file thp
+	 * (e.g. 2M shmem) because file thp is handled differently when
+	 * split by erasing the pmd so far.
 	 */
 	return (cp_flags & MM_CP_UFFD_WP) && !vma_is_anonymous(vma);
 }
@@ -430,31 +431,53 @@ static inline long change_pud_range(struct mmu_gather *tlb,
 		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
 {
 	struct mmu_notifier_range range;
-	pud_t *pud;
+	pud_t *pudp, pud;
 	unsigned long next;
 	long pages = 0, ret;
 
 	range.start = 0;
 
-	pud = pud_offset(p4d, addr);
+	pudp = pud_offset(p4d, addr);
 	do {
+again:
 		next = pud_addr_end(addr, end);
-		ret = change_prepare(vma, pud, pmd, addr, cp_flags);
+		ret = change_prepare(vma, pudp, pmd, addr, cp_flags);
 		if (ret) {
 			pages = ret;
 			break;
 		}
-		if (pud_none_or_clear_bad(pud))
+
+		pud = READ_ONCE(*pudp);
+		if (pud_none(pud))
 			continue;
+
 		if (!range.start) {
 			mmu_notifier_range_init(&range,
 						MMU_NOTIFY_PROTECTION_VMA, 0,
 						vma->vm_mm, addr, end);
 			mmu_notifier_invalidate_range_start(&range);
 		}
-		pages += change_pmd_range(tlb, vma, pud, addr, next, newprot,
+
+		if (pud_leaf(pud)) {
+			if ((next - addr != PUD_SIZE) ||
+			    pgtable_split_needed(vma, cp_flags)) {
+				__split_huge_pud(vma, pudp, addr);
+				goto again;
+			} else {
+				ret = change_huge_pud(tlb, vma, pudp,
+						      addr, newprot, cp_flags);
+				if (ret == 0)
+					goto again;
+				/* huge pud was handled */
+				if (ret == HPAGE_PUD_NR)
+					pages += HPAGE_PUD_NR;
+				continue;
+			}
+		}
+
+		pages += change_pmd_range(tlb, vma, pudp, addr, next, newprot,
 					  cp_flags);
-	} while (pud++, addr = next, addr != end);
+	} while (pudp++, addr = next, addr != end);
 
 	if (range.start)
 		mmu_notifier_invalidate_range_end(&range);
-- 
2.45.0


