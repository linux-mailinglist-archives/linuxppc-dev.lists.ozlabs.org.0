Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F912DD277
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 14:54:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxYPx0NvhzDqc8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 00:54:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=U8Froxm/; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxYGY3v0xzDqWG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 00:47:49 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id v1so3677233pjr.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 05:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fwunD8tROp7Z53Pe9ex5iGvyLZqI450KzWTXcECiKCE=;
 b=U8Froxm/AgipJ1rRZCx1tWXjcr2qeUOo3XNsPfJ5nuM+f8hWT+LsvkcJ/m1mYW7aFz
 57sD1BWSuyxXykS4EtOIemhQDRG2JNEliUXMC9OBxVWmyaq+7U4hZoH7alInXXrqvAuI
 HTuNz+AyYyvivvYRnoDhbTGuWrl5N9rbdzTQcU2LX4GgKknIusfZqjl/ujaCXy7R6Ptl
 fEzZQw7TqE95/4q6ugsauxjpLDaEitjUi8SFYDBIxOdhZ5kbDqu91A3rGfMqXyXPQraF
 3Lsvjnx0oSp9asAr/rLxvhKqeq16nLh+KOgXkJHAGBYT2FCFuKCpn6c7ASa7WnVX56v1
 NhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fwunD8tROp7Z53Pe9ex5iGvyLZqI450KzWTXcECiKCE=;
 b=kEG160NNWjqzGlNuxcrVW3vGrvhfycF04uUjJ567tlDuUclB0OBbLR8gNygxrxrQON
 ta3Rvdl50GixNL41fjssc5yDpzQEursEo9Znulo4ZHmKaHNpYGur1tJNqiL3G6ilT9OX
 uhenD0R+tR8BoOg261aemjw9CbNv2LhX0ER1Jm6A0lmKXdvo/TCbA1rtHZl58GI9DuCx
 PlW5aBvwqxT9fdmq5PDc1D2RytDHempvLcn5mqyzc+I0QqBqcS11awTJ8QDAf5HD6Pde
 dobYv1P0oWrCYTaMv1NJ3ggyWTJDInhY0zVCXWBKB8Ceb9k6gQMM1l71faSBn08yqTTf
 Buag==
X-Gm-Message-State: AOAM532rljfLIW0ErWO7raaRi6SXWgIGHvqyQa1ul4RkldLLdbKM1otI
 SNpjSYV+a6BoKi/QKHhaeAqlZdfBrPFZEg==
X-Google-Smtp-Source: ABdhPJzRYHdBk8DiQeIN8BWenRKS1r5MKrv4bYSwPMIMHsfUW3inik+BqL5t3kSbpB21lg3GCjlP/g==
X-Received: by 2002:a17:902:a70a:b029:dc:f98:44d9 with SMTP id
 w10-20020a170902a70ab02900dc0f9844d9mr10262054plq.74.1608212866488; 
 Thu, 17 Dec 2020 05:47:46 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id bf3sm5486112pjb.45.2020.12.17.05.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 05:47:46 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/7] powerpc/64s/radix: Check for no TLB flush required
Date: Thu, 17 Dec 2020 23:47:27 +1000
Message-Id: <20201217134731.488135-4-npiggin@gmail.com>
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

If there are no CPUs in mm_cpumask, no TLB flush is required at all.
This patch adds a check for this case.

Currently it's not tested for, in fact mm_is_thread_local() returns
false if the current CPU is not in mm_cpumask, so it's treated as a
global flush.

This can come up in some cases like exec failure before the new mm has
ever been switched to. This patch reduces TLBIE instructions required
to build a kernel from about 120,000 to 45,000. Another situation it
could help is page reclaim, KSM, THP, etc., (i.e., asynch operations
external to the process) where the process is sleeping and has all TLBs
flushed out of all CPUs.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 38 ++++++++++++++++++----------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 12481c864ab6..5b62e2e7371c 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -694,13 +694,19 @@ static inline void exit_flush_lazy_tlbs(struct mm_struct *mm) { }
 #endif /* CONFIG_SMP */
 
 enum tlb_flush_type {
+	FLUSH_TYPE_NONE,
 	FLUSH_TYPE_LOCAL,
 	FLUSH_TYPE_GLOBAL,
 };
 
 static enum tlb_flush_type flush_type_needed(struct mm_struct *mm, bool fullmm)
 {
-	if (mm_is_thread_local(mm))
+	int active_cpus = atomic_read(&mm->context.active_cpus);
+	int cpu = smp_processor_id();
+
+	if (active_cpus == 0)
+		return FLUSH_TYPE_NONE;
+	if (active_cpus == 1 && cpumask_test_cpu(cpu, mm_cpumask(mm)))
 		return FLUSH_TYPE_LOCAL;
 
 	/* Coprocessors require TLBIE to invalidate nMMU. */
@@ -754,7 +760,9 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
 	 */
 	smp_mb();
 	type = flush_type_needed(mm, false);
-	if (type == FLUSH_TYPE_GLOBAL) {
+	if (type == FLUSH_TYPE_LOCAL) {
+		_tlbiel_pid(pid, RIC_FLUSH_TLB);
+	} else if (type == FLUSH_TYPE_GLOBAL) {
 		if (!mmu_has_feature(MMU_FTR_GTSE)) {
 			unsigned long tgt = H_RPTI_TARGET_CMMU;
 
@@ -770,8 +778,6 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
 		} else {
 			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_TLB);
 		}
-	} else {
-		_tlbiel_pid(pid, RIC_FLUSH_TLB);
 	}
 	preempt_enable();
 }
@@ -789,7 +795,9 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 	preempt_disable();
 	smp_mb(); /* see radix__flush_tlb_mm */
 	type = flush_type_needed(mm, fullmm);
-	if (type == FLUSH_TYPE_GLOBAL) {
+	if (type == FLUSH_TYPE_LOCAL) {
+		_tlbiel_pid(pid, RIC_FLUSH_ALL);
+	} else if (type == FLUSH_TYPE_GLOBAL) {
 		if (!mmu_has_feature(MMU_FTR_GTSE)) {
 			unsigned long tgt = H_RPTI_TARGET_CMMU;
 			unsigned long type = H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
@@ -803,8 +811,6 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 			_tlbie_pid(pid, RIC_FLUSH_ALL);
 		else
 			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_ALL);
-	} else {
-		_tlbiel_pid(pid, RIC_FLUSH_ALL);
 	}
 	preempt_enable();
 }
@@ -828,7 +834,9 @@ void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr,
 	preempt_disable();
 	smp_mb(); /* see radix__flush_tlb_mm */
 	type = flush_type_needed(mm, false);
-	if (type == FLUSH_TYPE_GLOBAL) {
+	if (type == FLUSH_TYPE_LOCAL) {
+		_tlbiel_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
+	} else if (type == FLUSH_TYPE_GLOBAL) {
 		if (!mmu_has_feature(MMU_FTR_GTSE)) {
 			unsigned long tgt, pg_sizes, size;
 
@@ -845,8 +853,6 @@ void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr,
 			_tlbie_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
 		else
 			_tlbiel_va_multicast(mm, vmaddr, pid, psize, RIC_FLUSH_TLB);
-	} else {
-		_tlbiel_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
 	}
 	preempt_enable();
 }
@@ -935,6 +941,8 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 	preempt_disable();
 	smp_mb(); /* see radix__flush_tlb_mm */
 	type = flush_type_needed(mm, fullmm);
+	if (type == FLUSH_TYPE_NONE)
+		goto out;
 
 	if (fullmm)
 		flush_pid = true;
@@ -999,6 +1007,7 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 					hstart, hend, pid, PMD_SIZE, MMU_PAGE_2M, false);
 		}
 	}
+out:
 	preempt_enable();
 }
 
@@ -1123,6 +1132,8 @@ static __always_inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 	preempt_disable();
 	smp_mb(); /* see radix__flush_tlb_mm */
 	type = flush_type_needed(mm, fullmm);
+	if (type == FLUSH_TYPE_NONE)
+		goto out;
 
 	if (fullmm)
 		flush_pid = true;
@@ -1166,6 +1177,7 @@ static __always_inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 			_tlbiel_va_range_multicast(mm,
 					start, end, pid, page_size, psize, also_pwc);
 	}
+out:
 	preempt_enable();
 }
 
@@ -1203,7 +1215,9 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
 	preempt_disable();
 	smp_mb(); /* see radix__flush_tlb_mm */
 	type = flush_type_needed(mm, false);
-	if (type == FLUSH_TYPE_GLOBAL) {
+	if (type == FLUSH_TYPE_LOCAL) {
+		_tlbiel_va_range(addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
+	} else if (type == FLUSH_TYPE_GLOBAL) {
 		if (!mmu_has_feature(MMU_FTR_GTSE)) {
 			unsigned long tgt, type, pg_sizes;
 
@@ -1221,8 +1235,6 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
 		else
 			_tlbiel_va_range_multicast(mm,
 					addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
-	} else {
-		_tlbiel_va_range(addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
 	}
 
 	preempt_enable();
-- 
2.23.0

