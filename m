Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0E41DFCC7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 06:21:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49V6V011JczDqfy
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 14:20:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=jrdr.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SKwou8TE; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49V6S93HK0zDqZj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 14:19:21 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id w20so1989710pga.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 May 2020 21:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=nI7E7mDYIZ61oHLf9W/arr0PR7H6a7nLS1eN6Z5GiPg=;
 b=SKwou8TE1YQ+4ESVLgMDigH9YD5+f2R5IBahu2GmE4moAfHfdvADANaFTY7lOCaD6k
 heHfbWB3VQzbQc4u8GE09NfCAOAxh6x/bFPMhkwMh4hriLnlv3xMg/dqD2EFwtgqi5a+
 5k5bSw+qfEUQ+V2qw2lktSJLUjzR66s14480r3A7GyvgjCWyJWd1KgoOcq9b5ARCaFTi
 0pg/6XdKUL0cT5CLfUNebadHwNfJjcUiEkpLdv5jYZRwpW3Jn+0i8TWXmepa5rFQQMNW
 HBlue3L/mbfsuRVCPA9/MPMfsK/HlZ0m2hKLVN/vsgo0nZlERPQYK7Nv5MUGmauMTyRR
 RJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nI7E7mDYIZ61oHLf9W/arr0PR7H6a7nLS1eN6Z5GiPg=;
 b=U6GcM6SsucuKEv3BDxCtghLtDBr2Xcle5bbZFXCnrvf8ZI+zdhxYnJXvGGrO9Qlftr
 XpOqgAcIRqtD8rLd0hd6Ap6wgEkYlmB2bQZns7mulDZrR6S63+EQZKqgYu0yz83zQCpm
 U3V5ymVLaunEWUCshwNHDkc8ssY4z/5Q2Dp2OVfuLjZb/yH0kTMI0Rd2ywJtkus87H0P
 XPSA5D83xwtrCP106VZIrDCQMSXfw8rBbSCPYz3G4Wjf+Y8ZwkMAMfvtPYzaedeczNsB
 kyeo0aqxxFDFPU93fLHKuRLhNdHWZuOJC2DvagCWeEQ6WJFASiIUq929HWWPN+fC89tZ
 pXmA==
X-Gm-Message-State: AOAM531zbYxzpOneq0PTOxdEgzvJzyjEaQGnf7zb6mNuz6lEK5h1l2cW
 bVTtBqJay2ia18QLgqh68ck=
X-Google-Smtp-Source: ABdhPJx76K603I8mK1DZzCQ6qFXjZ45wWgT8uW3UzUi5xHivw3zZc4RuAAi69DNQPRBXz6t6UrZ4OQ==
X-Received: by 2002:aa7:9f5a:: with SMTP id h26mr10894617pfr.51.1590293957683; 
 Sat, 23 May 2020 21:19:17 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.167.154.105])
 by smtp.gmail.com with ESMTPSA id z16sm9540613pfq.125.2020.05.23.21.19.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 23 May 2020 21:19:16 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: paulus@ozlabs.org, mpe@ellerman.id.au, benh@kernel.crashing.org,
 akpm@linux-foundation.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
 jolsa@redhat.com, namhyung@kernel.org, pbonzini@redhat.com,
 sfr@canb.auug.org.au, rppt@linux.ibm.com, aneesh.kumar@linux.ibm.com,
 msuchanek@suse.de
Subject: [linux-next RFC v2] mm/gup.c: Convert to use
 get_user_{page|pages}_fast_only()
Date: Sun, 24 May 2020 09:57:14 +0530
Message-Id: <1590294434-19125-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
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
Cc: Matthew Wilcox <willy@infradead.org>, kvm@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 Souptick Joarder <jrdr.linux@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

API __get_user_pages_fast() renamed to get_user_pages_fast_only()
to align with pin_user_pages_fast_only().

As part of this we will get rid of write parameter. Instead caller
will pass FOLL_WRITE to get_user_pages_fast_only(). This will not
change any existing functionality of the API.

All the callers are changed to pass FOLL_WRITE.

There are few places where 1 is passed to 2nd parameter of
__get_user_pages_fast() and return value is checked for 1
like [1]. Those are replaced with new inline
get_user_page_fast_only().

[1] if (__get_user_pages_fast(hva, 1, 1, &page) == 1)

Updated the documentation of the API.

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>
---
v2:
	Updated the subject line and change log.
	Address Matthew's comment to fix a bug and added
	new inline get_user_page_fast_only().

 arch/powerpc/kvm/book3s_64_mmu_hv.c    |  2 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  2 +-
 arch/powerpc/perf/callchain_64.c       |  4 +---
 include/linux/mm.h                     | 10 ++++++++--
 kernel/events/core.c                   |  4 ++--
 mm/gup.c                               | 29 ++++++++++++++++-------------
 virt/kvm/kvm_main.c                    |  8 +++-----
 7 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 18aed97..ddfc4c9 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -581,7 +581,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	 * We always ask for write permission since the common case
 	 * is that the page is writable.
 	 */
-	if (__get_user_pages_fast(hva, 1, 1, &page) == 1) {
+	if (get_user_page_fast_only(hva, FOLL_WRITE, &page)) {
 		write_ok = true;
 	} else {
 		/* Call KVM generic code to do the slow-path check */
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 3248f78..5d4c087 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -795,7 +795,7 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 	 * is that the page is writable.
 	 */
 	hva = gfn_to_hva_memslot(memslot, gfn);
-	if (!kvm_ro && __get_user_pages_fast(hva, 1, 1, &page) == 1) {
+	if (!kvm_ro && get_user_page_fast_only(hva, FOLL_WRITE, &page)) {
 		upgrade_write = true;
 	} else {
 		unsigned long pfn;
diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
index 1bff896d..814d1c2 100644
--- a/arch/powerpc/perf/callchain_64.c
+++ b/arch/powerpc/perf/callchain_64.c
@@ -29,11 +29,9 @@ int read_user_stack_slow(void __user *ptr, void *buf, int nb)
 	unsigned long addr = (unsigned long) ptr;
 	unsigned long offset;
 	struct page *page;
-	int nrpages;
 	void *kaddr;
 
-	nrpages = __get_user_pages_fast(addr, 1, 1, &page);
-	if (nrpages == 1) {
+	if (get_user_page_fast_only(addr, FOLL_WRITE, &page)) {
 		kaddr = page_address(page);
 
 		/* align address to page boundary */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 93d93bd..8d4597f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1817,10 +1817,16 @@ extern int mprotect_fixup(struct vm_area_struct *vma,
 /*
  * doesn't attempt to fault and will return short.
  */
-int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
-			  struct page **pages);
+int get_user_pages_fast_only(unsigned long start, int nr_pages,
+			unsigned int gup_flags, struct page **pages);
 int pin_user_pages_fast_only(unsigned long start, int nr_pages,
 			     unsigned int gup_flags, struct page **pages);
+
+static inline bool get_user_page_fast_only(unsigned long addr,
+			unsigned int gup_flags, struct page **pagep)
+{
+	return get_user_pages_fast_only(addr, 1, gup_flags, pagep) == 1;
+}
 /*
  * per-process(per-mm_struct) statistics.
  */
diff --git a/kernel/events/core.c b/kernel/events/core.c
index c94eb27..856d98c 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6934,12 +6934,12 @@ static u64 perf_virt_to_phys(u64 virt)
 		 * Walking the pages tables for user address.
 		 * Interrupts are disabled, so it prevents any tear down
 		 * of the page tables.
-		 * Try IRQ-safe __get_user_pages_fast first.
+		 * Try IRQ-safe get_user_page_fast_only first.
 		 * If failed, leave phys_addr as 0.
 		 */
 		if (current->mm != NULL) {
 			pagefault_disable();
-			if (__get_user_pages_fast(virt, 1, 0, &p) == 1)
+			if (get_user_page_fast_only(virt, 0, &p))
 				phys_addr = page_to_phys(p) + virt % PAGE_SIZE;
 			pagefault_enable();
 		}
diff --git a/mm/gup.c b/mm/gup.c
index 80f51a36..bb59f5c 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2278,7 +2278,7 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
  * to be special.
  *
  * For a futex to be placed on a THP tail page, get_futex_key requires a
- * __get_user_pages_fast implementation that can pin pages. Thus it's still
+ * get_user_pages_fast_only implementation that can pin pages. Thus it's still
  * useful to have gup_huge_pmd even if we can't operate on ptes.
  */
 static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
@@ -2683,7 +2683,7 @@ static inline void gup_pgd_range(unsigned long addr, unsigned long end,
 
 #ifndef gup_fast_permitted
 /*
- * Check if it's allowed to use __get_user_pages_fast() for the range, or
+ * Check if it's allowed to use get_user_pages_fast_only() for the range, or
  * we need to fall back to the slow version:
  */
 static bool gup_fast_permitted(unsigned long start, unsigned long end)
@@ -2776,8 +2776,14 @@ static int internal_get_user_pages_fast(unsigned long start, int nr_pages,
 
 	return ret;
 }
-
-/*
+/**
+ * get_user_pages_fast_only() - pin user pages in memory
+ * @start:      starting user address
+ * @nr_pages:   number of pages from start to pin
+ * @gup_flags:  flags modifying pin behaviour
+ * @pages:      array that receives pointers to the pages pinned.
+ *              Should be at least nr_pages long.
+ *
  * Like get_user_pages_fast() except it's IRQ-safe in that it won't fall back to
  * the regular GUP.
  * Note a difference with get_user_pages_fast: this always returns the
@@ -2786,8 +2792,8 @@ static int internal_get_user_pages_fast(unsigned long start, int nr_pages,
  * If the architecture does not support this function, simply return with no
  * pages pinned.
  */
-int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
-			  struct page **pages)
+int get_user_pages_fast_only(unsigned long start, int nr_pages,
+			unsigned int gup_flags, struct page **pages)
 {
 	int nr_pinned;
 	/*
@@ -2797,10 +2803,7 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 	 * FOLL_FAST_ONLY is required in order to match the API description of
 	 * this routine: no fall back to regular ("slow") GUP.
 	 */
-	unsigned int gup_flags = FOLL_GET | FOLL_FAST_ONLY;
-
-	if (write)
-		gup_flags |= FOLL_WRITE;
+	gup_flags |= FOLL_GET | FOLL_FAST_ONLY;
 
 	nr_pinned = internal_get_user_pages_fast(start, nr_pages, gup_flags,
 						 pages);
@@ -2815,7 +2818,7 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 
 	return nr_pinned;
 }
-EXPORT_SYMBOL_GPL(__get_user_pages_fast);
+EXPORT_SYMBOL_GPL(get_user_pages_fast_only);
 
 /**
  * get_user_pages_fast() - pin user pages in memory
@@ -2886,8 +2889,8 @@ int pin_user_pages_fast(unsigned long start, int nr_pages,
 EXPORT_SYMBOL_GPL(pin_user_pages_fast);
 
 /*
- * This is the FOLL_PIN equivalent of __get_user_pages_fast(). Behavior is the
- * same, except that this one sets FOLL_PIN instead of FOLL_GET.
+ * This is the FOLL_PIN equivalent of get_user_pages_fast_only(). Behavior
+ * is the same, except that this one sets FOLL_PIN instead of FOLL_GET.
  *
  * The API rules are the same, too: no negative values may be returned.
  */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fc38d63..b62ea62 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1740,7 +1740,6 @@ static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
 			    bool *writable, kvm_pfn_t *pfn)
 {
 	struct page *page[1];
-	int npages;
 
 	/*
 	 * Fast pin a writable pfn only if it is a write fault request
@@ -1750,8 +1749,7 @@ static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
 	if (!(write_fault || writable))
 		return false;
 
-	npages = __get_user_pages_fast(addr, 1, 1, page);
-	if (npages == 1) {
+	if (get_user_page_fast_only(addr, FOLL_WRITE, page)) {
 		*pfn = page_to_pfn(page[0]);
 
 		if (writable)
@@ -1791,7 +1789,7 @@ static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
 	if (unlikely(!write_fault) && writable) {
 		struct page *wpage;
 
-		if (__get_user_pages_fast(addr, 1, 1, &wpage) == 1) {
+		if (get_user_page_fast_only(addr, FOLL_WRITE, &wpage)) {
 			*writable = true;
 			put_page(page);
 			page = wpage;
@@ -1998,7 +1996,7 @@ int gfn_to_page_many_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
 	if (entry < nr_pages)
 		return 0;
 
-	return __get_user_pages_fast(addr, nr_pages, 1, pages);
+	return get_user_pages_fast_only(addr, nr_pages, FOLL_WRITE, pages);
 }
 EXPORT_SYMBOL_GPL(gfn_to_page_many_atomic);
 
-- 
1.9.1

