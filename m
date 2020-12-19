Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCC42DF259
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Dec 2020 00:53:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cz2c92X0nzDqWc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Dec 2020 10:53:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m5+ZRj1b; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cz2Vj42zLzDqS5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Dec 2020 10:48:29 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id c22so3829388pgg.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 15:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=icGd0d9KwCkYYneSTMyPusq7Jqg9a5nwUdntjXfQzRA=;
 b=m5+ZRj1b1liSsf/FJ+Cc3JdtDNsLX72BwBmcJnYpsjJPKM/djoly6DLUSXGJrtVKUW
 grGwxZQ3uwXGZ4/qQiLFxSpuoVHiKLp67bwfKp7t/DlWR8ve1pZ2l4j5sHJ/3+vdr+mu
 p4Q0CDcZkxPLMp8v1OLPuksx0bsWP5QO9Q4yY50M6QoP4/iIDftpJjMCk0buVVXO59e+
 QajK8vRCWiBUm392FSuUALZ6CYI+zsGrtUAQyfRyL4OkZYbv5DjueOVaeU9/Aiw/6HFF
 33mBTzghx+Fapsk1B0FDtfFqYRqdIBaQMlxGPgSVYenLLj8zi+PSxNVHyz7CT2D9/DB+
 BrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=icGd0d9KwCkYYneSTMyPusq7Jqg9a5nwUdntjXfQzRA=;
 b=K+YuCPi8WkD16/LLBRiQjzDwNRU0Pk78LU36P0xvcXACGRcCbn79r1lgkz6FzhyFOY
 Kp0gTgA5UATvJYmNMef/uvYvtkNchkdBpWt5DHtUanO1HRURJesXP7I00Bxzhc9gZ0iW
 JPP6Des9fG3/KsUqAHEGKcXHtgw1OfBp3SsTBIerGE63mIMdWVrb4DolftCXy5APfjeo
 7eweTA8j096WbshPrCvSpnIosXwA0n7/fJXCDDYCrNiOvm5KG698QwpEtFe2jVtfWbEl
 T2CJSSAbfWvpyJoJiqKmbvc9CnvTU4oeYWn6doHXFpC+jpOlEzIYnT5GPJR9JN/Atd/T
 UemA==
X-Gm-Message-State: AOAM530PvC0KntCWFqRyxz4O/7x9T6rI8kEEPSwJQuW8MqN6t1rdCVgw
 LvHV9EYVqbpd5fRBANrnEKBbV1Ame5U=
X-Google-Smtp-Source: ABdhPJzMVVMhU8KdbygNAFx9I2CkNenbx4ubAj6aj6g7Nob62LnZTaUaZLXMic6ZFXxCkokeh4pzZg==
X-Received: by 2002:aa7:9afb:0:b029:19e:45d8:b102 with SMTP id
 y27-20020aa79afb0000b029019e45d8b102mr9609608pfp.48.1608421705449; 
 Sat, 19 Dec 2020 15:48:25 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id k15sm12729275pfh.40.2020.12.19.15.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Dec 2020 15:48:25 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/5] powerpc/64s: implement mm_nmmu_has_tlbs
Date: Sun, 20 Dec 2020 09:48:10 +1000
Message-Id: <20201219234813.830747-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201219234813.830747-1-npiggin@gmail.com>
References: <20201219234813.830747-1-npiggin@gmail.com>
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

Rather than read the copros field directly. This allows coprocessors
to be compiled out.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/tlbflush.h |  9 ++++++-
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  3 +--
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  5 ++--
 arch/powerpc/mm/book3s64/radix_tlb.c          | 26 +++++++++----------
 4 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index dcb5c3839d2f..0a7431e954c6 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -14,6 +14,13 @@ enum {
 	TLB_INVAL_SCOPE_LPID = 1,	/* invalidate TLBs for current LPID */
 };
 
+static inline bool mm_has_nmmu(struct mm_struct *mm)
+{
+	if (unlikely(atomic_read(&mm->context.copros) > 0))
+		return true;
+	return false;
+}
+
 #ifdef CONFIG_PPC_NATIVE
 static inline void tlbiel_all(void)
 {
@@ -143,7 +150,7 @@ static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
 						unsigned long address)
 {
 	/* See ptep_set_access_flags comment */
-	if (atomic_read(&vma->vm_mm->context.copros) > 0)
+	if (mm_has_nmmu(vma->vm_mm))
 		flush_tlb_page(vma, address);
 }
 
diff --git a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
index cb91071eef52..2dfe1416d7db 100644
--- a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
@@ -100,8 +100,7 @@ void radix__huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
 	 * To avoid NMMU hang while relaxing access we need to flush the tlb before
 	 * we set the new value.
 	 */
-	if (is_pte_rw_upgrade(pte_val(old_pte), pte_val(pte)) &&
-	    (atomic_read(&mm->context.copros) > 0))
+	if (is_pte_rw_upgrade(pte_val(old_pte), pte_val(pte)) && mm_has_nmmu(mm))
 		radix__flush_hugetlb_page(vma, addr);
 
 	set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 98f0b243c1ab..9495206b9b91 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1042,7 +1042,7 @@ void radix__ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
 	 * To avoid NMMU hang while relaxing access, we need mark
 	 * the pte invalid in between.
 	 */
-	if ((change & _PAGE_RW) && atomic_read(&mm->context.copros) > 0) {
+	if ((change & _PAGE_RW) && mm_has_nmmu(mm)) {
 		unsigned long old_pte, new_pte;
 
 		old_pte = __radix_pte_update(ptep, _PAGE_PRESENT, _PAGE_INVALID);
@@ -1075,8 +1075,7 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
 	 * we set the new value. We need to do this only for radix, because hash
 	 * translation does flush when updating the linux pte.
 	 */
-	if (is_pte_rw_upgrade(pte_val(old_pte), pte_val(pte)) &&
-	    (atomic_read(&mm->context.copros) > 0))
+	if (is_pte_rw_upgrade(pte_val(old_pte), pte_val(pte)) && mm_has_nmmu(mm))
 		radix__flush_tlb_page(vma, addr);
 
 	set_pte_at(mm, addr, ptep, pte);
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 3455947a1b08..6633b47abee8 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -371,7 +371,7 @@ static inline void _tlbiel_pid_multicast(struct mm_struct *mm,
 	 * these paths, so while coprocessors must use tlbie, we can not
 	 * optimise away the tlbiel component.
 	 */
-	if (atomic_read(&mm->context.copros) > 0)
+	if (mm_has_nmmu(mm))
 		_tlbie_pid(pid, RIC_FLUSH_ALL);
 }
 
@@ -504,7 +504,7 @@ static inline void _tlbiel_va_multicast(struct mm_struct *mm,
 	struct cpumask *cpus = mm_cpumask(mm);
 	struct tlbiel_va t = { .va = va, .pid = pid, .psize = psize, .ric = ric };
 	on_each_cpu_mask(cpus, do_tlbiel_va, &t, 1);
-	if (atomic_read(&mm->context.copros) > 0)
+	if (mm_has_nmmu(mm))
 		_tlbie_va(va, pid, psize, RIC_FLUSH_TLB);
 }
 
@@ -558,7 +558,7 @@ static inline void _tlbiel_va_range_multicast(struct mm_struct *mm,
 				.psize = psize, .also_pwc = also_pwc };
 
 	on_each_cpu_mask(cpus, do_tlbiel_va_range, &t, 1);
-	if (atomic_read(&mm->context.copros) > 0)
+	if (mm_has_nmmu(mm))
 		_tlbie_va_range(start, end, pid, page_size, psize, also_pwc);
 }
 
@@ -634,9 +634,7 @@ static bool mm_needs_flush_escalation(struct mm_struct *mm)
 	 * caching PTEs and not flushing them properly when
 	 * RIC = 0 for a PID/LPID invalidate
 	 */
-	if (atomic_read(&mm->context.copros) > 0)
-		return true;
-	return false;
+	return mm_has_nmmu(mm);
 }
 
 /*
@@ -759,8 +757,8 @@ static enum tlb_flush_type flush_type_needed(struct mm_struct *mm, bool fullmm)
 		return FLUSH_TYPE_LOCAL;
 	}
 
-	/* Coprocessors require TLBIE to invalidate nMMU. */
-	if (atomic_read(&mm->context.copros) > 0)
+	/* The nest MMU requires TLBIE to invalidate its TLBs. */
+	if (mm_has_nmmu(mm))
 		return FLUSH_TYPE_GLOBAL;
 
 	/*
@@ -833,7 +831,7 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
 		if (!mmu_has_feature(MMU_FTR_GTSE)) {
 			unsigned long tgt = H_RPTI_TARGET_CMMU;
 
-			if (atomic_read(&mm->context.copros) > 0)
+			if (mm_has_nmmu(mm))
 				tgt |= H_RPTI_TARGET_NMMU;
 			pseries_rpt_invalidate(pid, tgt, H_RPTI_TYPE_TLB,
 					       H_RPTI_PAGE_ALL, 0, -1UL);
@@ -870,7 +868,7 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 			unsigned long type = H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
 					     H_RPTI_TYPE_PRT;
 
-			if (atomic_read(&mm->context.copros) > 0)
+			if (mm_has_nmmu(mm))
 				tgt |= H_RPTI_TARGET_NMMU;
 			pseries_rpt_invalidate(pid, tgt, type,
 					       H_RPTI_PAGE_ALL, 0, -1UL);
@@ -911,7 +909,7 @@ void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr,
 			pg_sizes = psize_to_rpti_pgsize(psize);
 			size = 1UL << mmu_psize_to_shift(psize);
 
-			if (atomic_read(&mm->context.copros) > 0)
+			if (mm_has_nmmu(mm))
 				tgt |= H_RPTI_TARGET_NMMU;
 			pseries_rpt_invalidate(pid, tgt, H_RPTI_TYPE_TLB,
 					       pg_sizes, vmaddr,
@@ -1024,7 +1022,7 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 
 		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
 			pg_sizes |= psize_to_rpti_pgsize(MMU_PAGE_2M);
-		if (atomic_read(&mm->context.copros) > 0)
+		if (mm_has_nmmu(mm))
 			tgt |= H_RPTI_TARGET_NMMU;
 		pseries_rpt_invalidate(pid, tgt, H_RPTI_TYPE_TLB, pg_sizes,
 				       start, end);
@@ -1216,7 +1214,7 @@ static __always_inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 
 		if (also_pwc)
 			type |= H_RPTI_TYPE_PWC;
-		if (atomic_read(&mm->context.copros) > 0)
+		if (mm_has_nmmu(mm))
 			tgt |= H_RPTI_TARGET_NMMU;
 		pseries_rpt_invalidate(pid, tgt, type, pg_sizes, start, end);
 	} else if (flush_pid) {
@@ -1293,7 +1291,7 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
 			       H_RPTI_TYPE_PRT;
 			pg_sizes = psize_to_rpti_pgsize(mmu_virtual_psize);
 
-			if (atomic_read(&mm->context.copros) > 0)
+			if (mm_has_nmmu(mm))
 				tgt |= H_RPTI_TARGET_NMMU;
 			pseries_rpt_invalidate(pid, tgt, type, pg_sizes,
 					       addr, end);
-- 
2.23.0

