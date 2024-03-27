Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA4088E1A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 14:08:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cxRuqt1x;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cxRuqt1x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4Rmh1ccMz3vhG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 00:08:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cxRuqt1x;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cxRuqt1x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4RkL5QQwz2xLW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 00:06:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711544760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrn9kFJbDhptD+S1tnth6zQ8+0LvX0E75pC+GEdWFic=;
	b=cxRuqt1xrXQvYRUKt3SPpzPnjMpwePLe+8b2i2y0DLtcuS0QOTaR6aWVT9mjJpgk/vh2m/
	3ldCIMWDVB0yi5BYzrr2Goa8X5Es14vVHkOpsg/Jpa9ZLOnDkYg1bSQUV8LHTb57AP7sxU
	rTmrODDDymyQgr3wV4Qtt4du7KZLPec=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711544760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrn9kFJbDhptD+S1tnth6zQ8+0LvX0E75pC+GEdWFic=;
	b=cxRuqt1xrXQvYRUKt3SPpzPnjMpwePLe+8b2i2y0DLtcuS0QOTaR6aWVT9mjJpgk/vh2m/
	3ldCIMWDVB0yi5BYzrr2Goa8X5Es14vVHkOpsg/Jpa9ZLOnDkYg1bSQUV8LHTb57AP7sxU
	rTmrODDDymyQgr3wV4Qtt4du7KZLPec=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-487-F585njHMOPem4QDiszjVOg-1; Wed,
 27 Mar 2024 09:05:56 -0400
X-MC-Unique: F585njHMOPem4QDiszjVOg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2EF23801FEE;
	Wed, 27 Mar 2024 13:05:55 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.193.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 662221C060D4;
	Wed, 27 Mar 2024 13:05:51 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 2/3] mm/treewide: rename CONFIG_HAVE_FAST_GUP to CONFIG_HAVE_GUP_FAST
Date: Wed, 27 Mar 2024 14:05:37 +0100
Message-ID: <20240327130538.680256-3-david@redhat.com>
In-Reply-To: <20240327130538.680256-1-david@redhat.com>
References: <20240327130538.680256-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, Peter Xu <peterx@redhat.com>, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nowadays, we call it "GUP-fast", the external interface includes
functions like "get_user_pages_fast()", and we renamed all internal
functions to reflect that as well.

Let's make the config option reflect that.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/arm/Kconfig       | 2 +-
 arch/arm64/Kconfig     | 2 +-
 arch/loongarch/Kconfig | 2 +-
 arch/mips/Kconfig      | 2 +-
 arch/powerpc/Kconfig   | 2 +-
 arch/s390/Kconfig      | 2 +-
 arch/sh/Kconfig        | 2 +-
 arch/x86/Kconfig       | 2 +-
 include/linux/rmap.h   | 8 ++++----
 kernel/events/core.c   | 4 ++--
 mm/Kconfig             | 2 +-
 mm/gup.c               | 6 +++---
 mm/internal.h          | 2 +-
 13 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b14aed3a17ab..817918f6635a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -99,7 +99,7 @@ config ARM
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS if (CPU_V6 || CPU_V6K || CPU_V7) && MMU
 	select HAVE_EXIT_THREAD
-	select HAVE_FAST_GUP if ARM_LPAE
+	select HAVE_GUP_FAST if ARM_LPAE
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_TRACER
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7b11c98b3e84..de076a191e9f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -205,7 +205,7 @@ config ARM64
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
-	select HAVE_FAST_GUP
+	select HAVE_GUP_FAST
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_FUNCTION_TRACER
 	select HAVE_FUNCTION_ERROR_INJECTION
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index a5f300ec6f28..cd642eefd9e5 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -119,7 +119,7 @@ config LOONGARCH
 	select HAVE_EBPF_JIT
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS if !ARCH_STRICT_ALIGN
 	select HAVE_EXIT_THREAD
-	select HAVE_FAST_GUP
+	select HAVE_GUP_FAST
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_ERROR_INJECTION
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 06ef440d16ce..10f7c6d88163 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -68,7 +68,7 @@ config MIPS
 	select HAVE_DYNAMIC_FTRACE
 	select HAVE_EBPF_JIT if !CPU_MICROMIPS
 	select HAVE_EXIT_THREAD
-	select HAVE_FAST_GUP
+	select HAVE_GUP_FAST
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1c4be3373686..e42cc8cd415f 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -236,7 +236,7 @@ config PPC
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS	if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
 	select HAVE_EBPF_JIT
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
-	select HAVE_FAST_GUP
+	select HAVE_GUP_FAST
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_DESCRIPTORS	if PPC64_ELF_ABI_V1
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 8f01ada6845e..d9aed4c93ee6 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -174,7 +174,7 @@ config S390
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS
 	select HAVE_EBPF_JIT if HAVE_MARCH_Z196_FEATURES
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
-	select HAVE_FAST_GUP
+	select HAVE_GUP_FAST
 	select HAVE_FENTRY
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_FUNCTION_ARG_ACCESS_API
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 2ad3e29f0ebe..7292542f75e8 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -38,7 +38,7 @@ config SUPERH
 	select HAVE_DEBUG_BUGVERBOSE
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DYNAMIC_FTRACE
-	select HAVE_FAST_GUP if MMU
+	select HAVE_GUP_FAST if MMU
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
 	select HAVE_FTRACE_MCOUNT_RECORD
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 39886bab943a..f82171292cf3 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -221,7 +221,7 @@ config X86
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_EISA
 	select HAVE_EXIT_THREAD
-	select HAVE_FAST_GUP
+	select HAVE_GUP_FAST
 	select HAVE_FENTRY			if X86_64 || DYNAMIC_FTRACE
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_FUNCTION_GRAPH_RETVAL	if HAVE_FUNCTION_GRAPH_TRACER
diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index b7944a833668..9bf9324214fc 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -284,7 +284,7 @@ static inline int hugetlb_try_share_anon_rmap(struct folio *folio)
 	VM_WARN_ON_FOLIO(!PageAnonExclusive(&folio->page), folio);
 
 	/* Paired with the memory barrier in try_grab_folio(). */
-	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP))
+	if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
 		smp_mb();
 
 	if (unlikely(folio_maybe_dma_pinned(folio)))
@@ -295,7 +295,7 @@ static inline int hugetlb_try_share_anon_rmap(struct folio *folio)
 	 * This is conceptually a smp_wmb() paired with the smp_rmb() in
 	 * gup_must_unshare().
 	 */
-	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP))
+	if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
 		smp_mb__after_atomic();
 	return 0;
 }
@@ -541,7 +541,7 @@ static __always_inline int __folio_try_share_anon_rmap(struct folio *folio,
 	 */
 
 	/* Paired with the memory barrier in try_grab_folio(). */
-	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP))
+	if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
 		smp_mb();
 
 	if (unlikely(folio_maybe_dma_pinned(folio)))
@@ -552,7 +552,7 @@ static __always_inline int __folio_try_share_anon_rmap(struct folio *folio,
 	 * This is conceptually a smp_wmb() paired with the smp_rmb() in
 	 * gup_must_unshare().
 	 */
-	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP))
+	if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
 		smp_mb__after_atomic();
 	return 0;
 }
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 724e6d7e128f..c5a0dc1f135f 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7539,7 +7539,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
 {
 	u64 size = 0;
 
-#ifdef CONFIG_HAVE_FAST_GUP
+#ifdef CONFIG_HAVE_GUP_FAST
 	pgd_t *pgdp, pgd;
 	p4d_t *p4dp, p4d;
 	pud_t *pudp, pud;
@@ -7587,7 +7587,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
 	if (pte_present(pte))
 		size = pte_leaf_size(pte);
 	pte_unmap(ptep);
-#endif /* CONFIG_HAVE_FAST_GUP */
+#endif /* CONFIG_HAVE_GUP_FAST */
 
 	return size;
 }
diff --git a/mm/Kconfig b/mm/Kconfig
index b1448aa81e15..5fd14a536bcc 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -473,7 +473,7 @@ config ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 config HAVE_MEMBLOCK_PHYS_MAP
 	bool
 
-config HAVE_FAST_GUP
+config HAVE_GUP_FAST
 	depends on MMU
 	bool
 
diff --git a/mm/gup.c b/mm/gup.c
index c293aff30c5d..e35c6a6a0301 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2463,7 +2463,7 @@ EXPORT_SYMBOL(get_user_pages_unlocked);
  *
  * This code is based heavily on the PowerPC implementation by Nick Piggin.
  */
-#ifdef CONFIG_HAVE_FAST_GUP
+#ifdef CONFIG_HAVE_GUP_FAST
 
 /*
  * Used in the GUP-fast path to determine whether GUP is permitted to work on
@@ -3137,7 +3137,7 @@ static inline void gup_fast_pgd_range(unsigned long addr, unsigned long end,
 		unsigned int flags, struct page **pages, int *nr)
 {
 }
-#endif /* CONFIG_HAVE_FAST_GUP */
+#endif /* CONFIG_HAVE_GUP_FAST */
 
 #ifndef gup_fast_permitted
 /*
@@ -3157,7 +3157,7 @@ static unsigned long gup_fast(unsigned long start, unsigned long end,
 	int nr_pinned = 0;
 	unsigned seq;
 
-	if (!IS_ENABLED(CONFIG_HAVE_FAST_GUP) ||
+	if (!IS_ENABLED(CONFIG_HAVE_GUP_FAST) ||
 	    !gup_fast_permitted(start, end))
 		return 0;
 
diff --git a/mm/internal.h b/mm/internal.h
index 8e11f7b2da21..c4587c20c881 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1199,7 +1199,7 @@ static inline bool gup_must_unshare(struct vm_area_struct *vma,
 	}
 
 	/* Paired with a memory barrier in folio_try_share_anon_rmap_*(). */
-	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP))
+	if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
 		smp_rmb();
 
 	/*
-- 
2.43.2

