Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E65512DD275
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 14:52:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxYN92xrlzDqZp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 00:52:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=K88p10yz; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxYGV6LRjzDqV8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 00:47:46 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id b5so4144395pjk.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 05:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WpHM6GB1J1QLKK57bT8oHoKy83eEYXP5CveAouFwy6Q=;
 b=K88p10yz532BOYDAkvKsGy9foobZksNpnvEJxBWsgxae3OZi01eB9x6N7KiZxAbGM3
 AO+6P7wT3GqN/NeJ2+hxiJeVl5LgeGupgbs0VfRBwRmCncPyACPk/28lmvPzAaFOub7s
 xhV/FJvQMnd2BB7zW9qjFr12BX3fxbk3QD6tjg8OGjvuKh4C6tbEfJ+w+sF/rIu+Ztrb
 z3e7wQM7Bq2HzjvRjzWfd+kKcBl/iYVobnHt2sEYo45qUXtkgG/G7Gy12uRTFr8NCW1B
 NTTRIFUYva8u+MysQE1AKKYTXVgEbzdOhf4rGiz1B4mxvZ2/6EwuKX6Ejj7/uwpEpf0p
 /uGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WpHM6GB1J1QLKK57bT8oHoKy83eEYXP5CveAouFwy6Q=;
 b=XWceZkz69tf6N/HakK222ZRd5PXhpQng+TXNiMcCN3zVPIkxkHeBMCkku6B6IZOhKU
 KhcGAF/TNLbY52dFvBb6jwu2WqhD1tMGznTl9Qr+5d1XP6pCk7ccINyd4oMdPW57h4DN
 Eoj7rSenqlxX3fYAmzIVE82bwyZ6OwHsGAgZ25FapsqDwKYGcUH8ls4mMzThgsOXDNy1
 ZKw45MtLl0/QmUqykJWCskJ8RUePP0V6OL+oJKrOA5eDtbM/Kv22+dA8R2ETF6L1EJtS
 I9Vv6MsGygFG6/XxigMM6miE6PfwY5ji9axAL0gl++7FJSq3uai98EMzz3Y13jLPv692
 TmVQ==
X-Gm-Message-State: AOAM5337u4TvhP/b2Sf+Jcov7pIDcMNMt55pWJybDlIEjzMYdPeTnRzO
 E5mcisrtnljJNyRYMu0oBgcSfM/pboiuMg==
X-Google-Smtp-Source: ABdhPJx6U2LV0Hb91KLnrvg/XPJD1hgeW74FhV+doUuCS2+EflBOLMZQcYSTifjH7ZvUle8+XgMnXw==
X-Received: by 2002:a17:902:ee52:b029:da:4dee:1a54 with SMTP id
 18-20020a170902ee52b02900da4dee1a54mr9479008plo.29.1608212864076; 
 Thu, 17 Dec 2020 05:47:44 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id bf3sm5486112pjb.45.2020.12.17.05.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 05:47:43 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/7] powerpc/64s/radix: refactor TLB flush type selection
Date: Thu, 17 Dec 2020 23:47:26 +1000
Message-Id: <20201217134731.488135-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201217134731.488135-1-npiggin@gmail.com>
References: <20201217134731.488135-1-npiggin@gmail.com>
MIME-Version: 1.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The logic to decide what kind of TLB flush is required (local, global,
or IPI) is spread multiple times over the several kinds of TLB flushes.

Move it all into a single function which may issue IPIs if necessary,
and also returns a flush type that is to be used.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 176 ++++++++++++++-------------
 1 file changed, 94 insertions(+), 82 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 5f09e0cd0016..12481c864ab6 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -618,15 +618,6 @@ void radix__local_flush_tlb_page(struct vm_area_struct *vma, unsigned long vmadd
 }
 EXPORT_SYMBOL(radix__local_flush_tlb_page);
 
-static bool mm_is_singlethreaded(struct mm_struct *mm)
-{
-	if (atomic_read(&mm->context.copros) > 0)
-		return false;
-	if (atomic_read(&mm->mm_users) <= 1 && current->mm == mm)
-		return true;
-	return false;
-}
-
 static bool mm_needs_flush_escalation(struct mm_struct *mm)
 {
 	/*
@@ -698,10 +689,58 @@ static void exit_flush_lazy_tlbs(struct mm_struct *mm)
 	smp_call_function_many(mm_cpumask(mm), do_exit_flush_lazy_tlb,
 				(void *)mm, 1);
 }
+#else /* CONFIG_SMP */
+static inline void exit_flush_lazy_tlbs(struct mm_struct *mm) { }
+#endif /* CONFIG_SMP */
+
+enum tlb_flush_type {
+	FLUSH_TYPE_LOCAL,
+	FLUSH_TYPE_GLOBAL,
+};
+
+static enum tlb_flush_type flush_type_needed(struct mm_struct *mm, bool fullmm)
+{
+	if (mm_is_thread_local(mm))
+		return FLUSH_TYPE_LOCAL;
+
+	/* Coprocessors require TLBIE to invalidate nMMU. */
+	if (atomic_read(&mm->context.copros) > 0)
+		return FLUSH_TYPE_GLOBAL;
+
+	/*
+	 * In the fullmm case there's no point doing the exit_flush_lazy_tlbs
+	 * because the mm is being taken down anyway, and a TLBIE tends to
+	 * be faster than an IPI+TLBIEL.
+	 */
+	if (fullmm)
+		return FLUSH_TYPE_GLOBAL;
+
+	/*
+	 * If we are running the only thread of a single-threaded process,
+	 * then we should almost always be able to trim off the rest of the
+	 * CPU mask (except in the case of use_mm() races), so always try
+	 * trimming the mask.
+	 */
+	if (atomic_read(&mm->mm_users) <= 1 && current->mm == mm) {
+		exit_flush_lazy_tlbs(mm);
+		/*
+		 * use_mm() race could prevent IPIs from being able to clear
+		 * the cpumask here, however those users are established
+		 * after our first check (and so after the PTEs are removed),
+		 * and the TLB still gets flushed by the IPI, so this CPU
+		 * will only require a local flush.
+		 */
+		return FLUSH_TYPE_LOCAL;
+	}
+
+	return FLUSH_TYPE_GLOBAL;
+}
 
+#ifdef CONFIG_SMP
 void radix__flush_tlb_mm(struct mm_struct *mm)
 {
 	unsigned long pid;
+	enum tlb_flush_type type;
 
 	pid = mm->context.id;
 	if (unlikely(pid == MMU_NO_CONTEXT))
@@ -709,16 +748,13 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
 
 	preempt_disable();
 	/*
-	 * Order loads of mm_cpumask vs previous stores to clear ptes before
-	 * the invalidate. See barrier in switch_mm_irqs_off
+	 * Order loads of mm_cpumask (in flush_type_needed) vs previous
+	 * stores to clear ptes before the invalidate. See barrier in
+	 * switch_mm_irqs_off
 	 */
 	smp_mb();
-	if (!mm_is_thread_local(mm)) {
-		if (unlikely(mm_is_singlethreaded(mm))) {
-			exit_flush_lazy_tlbs(mm);
-			goto local;
-		}
-
+	type = flush_type_needed(mm, false);
+	if (type == FLUSH_TYPE_GLOBAL) {
 		if (!mmu_has_feature(MMU_FTR_GTSE)) {
 			unsigned long tgt = H_RPTI_TARGET_CMMU;
 
@@ -735,7 +771,6 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
 			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_TLB);
 		}
 	} else {
-local:
 		_tlbiel_pid(pid, RIC_FLUSH_TLB);
 	}
 	preempt_enable();
@@ -745,6 +780,7 @@ EXPORT_SYMBOL(radix__flush_tlb_mm);
 static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 {
 	unsigned long pid;
+	enum tlb_flush_type type;
 
 	pid = mm->context.id;
 	if (unlikely(pid == MMU_NO_CONTEXT))
@@ -752,13 +788,8 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 
 	preempt_disable();
 	smp_mb(); /* see radix__flush_tlb_mm */
-	if (!mm_is_thread_local(mm)) {
-		if (unlikely(mm_is_singlethreaded(mm))) {
-			if (!fullmm) {
-				exit_flush_lazy_tlbs(mm);
-				goto local;
-			}
-		}
+	type = flush_type_needed(mm, fullmm);
+	if (type == FLUSH_TYPE_GLOBAL) {
 		if (!mmu_has_feature(MMU_FTR_GTSE)) {
 			unsigned long tgt = H_RPTI_TARGET_CMMU;
 			unsigned long type = H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
@@ -773,7 +804,6 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 		else
 			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_ALL);
 	} else {
-local:
 		_tlbiel_pid(pid, RIC_FLUSH_ALL);
 	}
 	preempt_enable();
@@ -789,6 +819,7 @@ void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr,
 				 int psize)
 {
 	unsigned long pid;
+	enum tlb_flush_type type;
 
 	pid = mm->context.id;
 	if (unlikely(pid == MMU_NO_CONTEXT))
@@ -796,11 +827,8 @@ void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr,
 
 	preempt_disable();
 	smp_mb(); /* see radix__flush_tlb_mm */
-	if (!mm_is_thread_local(mm)) {
-		if (unlikely(mm_is_singlethreaded(mm))) {
-			exit_flush_lazy_tlbs(mm);
-			goto local;
-		}
+	type = flush_type_needed(mm, false);
+	if (type == FLUSH_TYPE_GLOBAL) {
 		if (!mmu_has_feature(MMU_FTR_GTSE)) {
 			unsigned long tgt, pg_sizes, size;
 
@@ -818,7 +846,6 @@ void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr,
 		else
 			_tlbiel_va_multicast(mm, vmaddr, pid, psize, RIC_FLUSH_TLB);
 	} else {
-local:
 		_tlbiel_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
 	}
 	preempt_enable();
@@ -834,8 +861,6 @@ void radix__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
 }
 EXPORT_SYMBOL(radix__flush_tlb_page);
 
-#else /* CONFIG_SMP */
-static inline void exit_flush_lazy_tlbs(struct mm_struct *mm) { }
 #endif /* CONFIG_SMP */
 
 static void do_tlbiel_kernel(void *info)
@@ -899,7 +924,9 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 	unsigned int page_shift = mmu_psize_defs[mmu_virtual_psize].shift;
 	unsigned long page_size = 1UL << page_shift;
 	unsigned long nr_pages = (end - start) >> page_shift;
-	bool local, full;
+	bool fullmm = (end == TLB_FLUSH_ALL);
+	bool flush_pid;
+	enum tlb_flush_type type;
 
 	pid = mm->context.id;
 	if (unlikely(pid == MMU_NO_CONTEXT))
@@ -907,24 +934,16 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 
 	preempt_disable();
 	smp_mb(); /* see radix__flush_tlb_mm */
-	if (!mm_is_thread_local(mm)) {
-		if (unlikely(mm_is_singlethreaded(mm))) {
-			if (end != TLB_FLUSH_ALL) {
-				exit_flush_lazy_tlbs(mm);
-				goto is_local;
-			}
-		}
-		local = false;
-		full = (end == TLB_FLUSH_ALL ||
-				nr_pages > tlb_single_page_flush_ceiling);
-	} else {
-is_local:
-		local = true;
-		full = (end == TLB_FLUSH_ALL ||
-				nr_pages > tlb_local_single_page_flush_ceiling);
-	}
+	type = flush_type_needed(mm, fullmm);
+
+	if (fullmm)
+		flush_pid = true;
+	else if (type == FLUSH_TYPE_GLOBAL)
+		flush_pid = nr_pages > tlb_single_page_flush_ceiling;
+	else
+		flush_pid = nr_pages > tlb_local_single_page_flush_ceiling;
 
-	if (!mmu_has_feature(MMU_FTR_GTSE) && !local) {
+	if (!mmu_has_feature(MMU_FTR_GTSE) && type == FLUSH_TYPE_GLOBAL) {
 		unsigned long tgt = H_RPTI_TARGET_CMMU;
 		unsigned long pg_sizes = psize_to_rpti_pgsize(mmu_virtual_psize);
 
@@ -934,8 +953,8 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 			tgt |= H_RPTI_TARGET_NMMU;
 		pseries_rpt_invalidate(pid, tgt, H_RPTI_TYPE_TLB, pg_sizes,
 				       start, end);
-	} else if (full) {
-		if (local) {
+	} else if (flush_pid) {
+		if (type == FLUSH_TYPE_LOCAL) {
 			_tlbiel_pid(pid, RIC_FLUSH_TLB);
 		} else {
 			if (cputlb_use_tlbie()) {
@@ -958,7 +977,7 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 				hflush = true;
 		}
 
-		if (local) {
+		if (type == FLUSH_TYPE_LOCAL) {
 			asm volatile("ptesync": : :"memory");
 			__tlbiel_va_range(start, end, pid, page_size, mmu_virtual_psize);
 			if (hflush)
@@ -1091,32 +1110,28 @@ static __always_inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 	unsigned int page_shift = mmu_psize_defs[psize].shift;
 	unsigned long page_size = 1UL << page_shift;
 	unsigned long nr_pages = (end - start) >> page_shift;
-	bool local, full;
+	bool fullmm = (end == TLB_FLUSH_ALL);
+	bool flush_pid;
+	enum tlb_flush_type type;
 
 	pid = mm->context.id;
 	if (unlikely(pid == MMU_NO_CONTEXT))
 		return;
 
+	fullmm = (end == TLB_FLUSH_ALL);
+
 	preempt_disable();
 	smp_mb(); /* see radix__flush_tlb_mm */
-	if (!mm_is_thread_local(mm)) {
-		if (unlikely(mm_is_singlethreaded(mm))) {
-			if (end != TLB_FLUSH_ALL) {
-				exit_flush_lazy_tlbs(mm);
-				goto is_local;
-			}
-		}
-		local = false;
-		full = (end == TLB_FLUSH_ALL ||
-				nr_pages > tlb_single_page_flush_ceiling);
-	} else {
-is_local:
-		local = true;
-		full = (end == TLB_FLUSH_ALL ||
-				nr_pages > tlb_local_single_page_flush_ceiling);
-	}
+	type = flush_type_needed(mm, fullmm);
 
-	if (!mmu_has_feature(MMU_FTR_GTSE) && !local) {
+	if (fullmm)
+		flush_pid = true;
+	else if (type == FLUSH_TYPE_GLOBAL)
+		flush_pid = nr_pages > tlb_single_page_flush_ceiling;
+	else
+		flush_pid = nr_pages > tlb_local_single_page_flush_ceiling;
+
+	if (!mmu_has_feature(MMU_FTR_GTSE) && type == FLUSH_TYPE_GLOBAL) {
 		unsigned long tgt = H_RPTI_TARGET_CMMU;
 		unsigned long type = H_RPTI_TYPE_TLB;
 		unsigned long pg_sizes = psize_to_rpti_pgsize(psize);
@@ -1126,8 +1141,8 @@ static __always_inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 		if (atomic_read(&mm->context.copros) > 0)
 			tgt |= H_RPTI_TARGET_NMMU;
 		pseries_rpt_invalidate(pid, tgt, type, pg_sizes, start, end);
-	} else if (full) {
-		if (local) {
+	} else if (flush_pid) {
+		if (type == FLUSH_TYPE_LOCAL) {
 			_tlbiel_pid(pid, also_pwc ? RIC_FLUSH_ALL : RIC_FLUSH_TLB);
 		} else {
 			if (cputlb_use_tlbie()) {
@@ -1143,7 +1158,7 @@ static __always_inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 
 		}
 	} else {
-		if (local)
+		if (type == FLUSH_TYPE_LOCAL)
 			_tlbiel_va_range(start, end, pid, page_size, psize, also_pwc);
 		else if (cputlb_use_tlbie())
 			_tlbie_va_range(start, end, pid, page_size, psize, also_pwc);
@@ -1170,6 +1185,7 @@ static void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long
 void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
 {
 	unsigned long pid, end;
+	enum tlb_flush_type type;
 
 	pid = mm->context.id;
 	if (unlikely(pid == MMU_NO_CONTEXT))
@@ -1186,11 +1202,8 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
 	/* Otherwise first do the PWC, then iterate the pages. */
 	preempt_disable();
 	smp_mb(); /* see radix__flush_tlb_mm */
-	if (!mm_is_thread_local(mm)) {
-		if (unlikely(mm_is_singlethreaded(mm))) {
-			exit_flush_lazy_tlbs(mm);
-			goto local;
-		}
+	type = flush_type_needed(mm, false);
+	if (type == FLUSH_TYPE_GLOBAL) {
 		if (!mmu_has_feature(MMU_FTR_GTSE)) {
 			unsigned long tgt, type, pg_sizes;
 
@@ -1209,7 +1222,6 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
 			_tlbiel_va_range_multicast(mm,
 					addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
 	} else {
-local:
 		_tlbiel_va_range(addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
 	}
 
-- 
2.23.0

