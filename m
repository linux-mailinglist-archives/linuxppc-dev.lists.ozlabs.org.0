Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5812DF264
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Dec 2020 00:58:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cz2kK6lVVzDqcq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Dec 2020 10:58:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KstXafR1; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cz2Vp55TPzDqT7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Dec 2020 10:48:34 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id m5so3750859pjv.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 15:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GyyTQXFMxJsrMrABK3N9juVNdcOA1lOIsRRvLqBrr3g=;
 b=KstXafR1CkK9Gg/55qJHCilXLC4QXyCj7ZuILru8kQWm36zE87zg+pES2W0nXuwUOi
 UABt5t6aLezwO2o5Kl2cZErpmGK/Wdb9BQ2OZiHQbj25c7XrEAOGp5bD8OAsnwJn6e7G
 s1e+1HQJk/Gsedmu/xfNZyBVi6q57xohOmVa0Whb+hf/ytrDsUa83AtkjqLJvNh8gh0Y
 /fbJ4YCwpadDV0HUFzEH6DkoLCROZCL6tWDa3vtwcNAd/nZZFB1nryeYlHxrDK5QeZ/v
 PSUk3nFDIDbcOQjD7Eg0bP9T3rb/GiyGQDaVOiIxMGfs6oshCEPujflPzmQ23p7goAl/
 Q/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GyyTQXFMxJsrMrABK3N9juVNdcOA1lOIsRRvLqBrr3g=;
 b=bmQhlyLQGsOERLj9VTJHd2KDs9QEidPnIOM/3khhUnncKhtXIFjgc4TTQSbXGKtio2
 51Kz3vGJwJ4Rk04wgNdiaH0XMyEy3hRSuG0JnAYOTW5o7zj2QBe3TgmUF9wSN6VDw0gP
 hAqzvHYGrVLD+Tkc2CXElyLp26vlBUKKS9UsRgqauoKvv7rsB5OqkGZo1lyvLbKI2VL8
 iud2Jbwluybi9jJELBF2BG9npeKBhbLi6kY8Th10vN3X5X/jkLjUH1bekwCqBRq6MkYZ
 sMTgW2qU9utXD4TmdzLQLf+tJm4q7t4EwZu/yHQjD6wd5dEiDrKuQwf+dOzts0W67EA2
 8A0g==
X-Gm-Message-State: AOAM531Y2KB6OZ+fJ3g2od2xVcBQ38BjBKrn4gQg11uyouxdy3Yp6F36
 0hNdZUhO/MbfdGXJZmXflc7nzcPM+uM=
X-Google-Smtp-Source: ABdhPJwJQJksidauYmUYMkPKfziuiUFmZojxRk+2y3N+1ZETorDs41RlufTDH/5eJg0cysfrJoSQlA==
X-Received: by 2002:a17:90b:e0d:: with SMTP id
 ge13mr10699863pjb.111.1608421712702; 
 Sat, 19 Dec 2020 15:48:32 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id k15sm12729275pfh.40.2020.12.19.15.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Dec 2020 15:48:32 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 5/5] powerpc/64s/radix: Use non-atomic PTE updates if the
 MMU does not modify the PTE
Date: Sun, 20 Dec 2020 09:48:13 +1000
Message-Id: <20201219234813.830747-6-npiggin@gmail.com>
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

PTE updates performed by Linux are serialized by the page table locks.
There is no need to use atomic operations for these modifications if the
hardware does not perform updates asynchronously (e.g., via the MMU RC
update mechanism).

Current POWER CPUs that support radix do not perform such updates in the
core MMU, but the nest MMU does so make this conditional on whether the
nest mmu is active for the mm.

This improves a page fault / mprotect microbenchmark by about 10% on
POWER9.

There is a question of how compatibility would be work if a future
processor implements core MMU PTE udpates. This is being discussed with
ISA developers at the moment...

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/radix.h | 54 ++++++---------
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 79 ++++++++++++++++++----
 2 files changed, 83 insertions(+), 50 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 2491f3befda0..837ed6fb1c7d 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -137,16 +137,17 @@ extern void radix__mark_rodata_ro(void);
 extern void radix__mark_initmem_nx(void);
 #endif
 
-extern void radix__ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
-					 pte_t entry, unsigned long address,
-					 int psize);
-
-extern void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
-					   unsigned long addr, pte_t *ptep,
-					   pte_t old_pte, pte_t pte);
-
-static inline unsigned long __radix_pte_update(pte_t *ptep, unsigned long clr,
-					       unsigned long set)
+void radix__ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
+				pte_t entry, unsigned long address, int psize);
+void radix__ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
+				pte_t old_pte, pte_t pte);
+unsigned long radix__pte_update(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+				unsigned long clr, unsigned long set, int huge);
+pte_t radix__ptep_get_and_clear_full(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+				int full);
+
+static inline unsigned long __radix_pte_update_atomic(pte_t *ptep, unsigned long clr,
+							unsigned long set)
 {
 	__be64 old_be, tmp_be;
 
@@ -163,38 +164,21 @@ static inline unsigned long __radix_pte_update(pte_t *ptep, unsigned long clr,
 	return be64_to_cpu(old_be);
 }
 
-static inline unsigned long radix__pte_update(struct mm_struct *mm,
-					unsigned long addr,
-					pte_t *ptep, unsigned long clr,
-					unsigned long set,
-					int huge)
+static inline unsigned long __radix_pte_update_nonatomic(pte_t *ptep, unsigned long clr,
+							unsigned long set)
 {
-	unsigned long old_pte;
+	unsigned long old_pte = pte_val(*ptep);
 
-	old_pte = __radix_pte_update(ptep, clr, set);
-	if (!huge)
-		assert_pte_locked(mm, addr);
+	*ptep = __pte((old_pte & ~clr) | set);
 
 	return old_pte;
 }
 
-static inline pte_t radix__ptep_get_and_clear_full(struct mm_struct *mm,
-						   unsigned long addr,
-						   pte_t *ptep, int full)
+static inline unsigned long __radix_pte_update(pte_t *ptep, unsigned long clr,
+						unsigned long set)
 {
-	unsigned long old_pte;
-
-	if (full) {
-		/*
-		 * We know that this is a full mm pte clear and
-		 * hence can be sure there is no parallel set_pte.
-		 */
-		old_pte = pte_val(*ptep);
-		*ptep = __pte(0);
-	} else
-		old_pte = radix__pte_update(mm, addr, ptep, ~0ul, 0, 0);
-
-	return __pte(old_pte);
+	/* Must use atomic updates because accelerators may be attached which can modify the pte */
+	return __radix_pte_update_atomic(ptep, clr, set);
 }
 
 static inline int radix__pte_same(pte_t pte_a, pte_t pte_b)
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 9495206b9b91..f7ecb90daf87 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1030,6 +1030,47 @@ pmd_t radix__pmdp_huge_get_and_clear(struct mm_struct *mm,
 
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+static inline bool radix__mm_has_atomic_pte_update(struct mm_struct *mm)
+{
+	if (mm_has_nmmu(mm))
+		return true;
+	return false;
+}
+
+static inline bool radix__mm_has_core_atomic_pte_update(struct mm_struct *mm)
+{
+	return false;
+}
+
+unsigned long radix__pte_update(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+				unsigned long clr, unsigned long set, int huge)
+{
+	unsigned long old_pte;
+
+	if (!huge)
+		assert_pte_locked(mm, addr);
+
+	if (radix__mm_has_atomic_pte_update(mm))
+		old_pte = __radix_pte_update_atomic(ptep, clr, set);
+	else
+		old_pte = __radix_pte_update_nonatomic(ptep, clr, set);
+
+	return old_pte;
+}
+
+pte_t radix__ptep_get_and_clear_full(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+				int full)
+{
+	unsigned long old_pte;
+
+	if (full)
+		old_pte = __radix_pte_update_nonatomic(ptep, ~0ul, 0);
+	else
+		old_pte = radix__pte_update(mm, addr, ptep, ~0ul, 0, 0);
+
+	return __pte(old_pte);
+}
+
 void radix__ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
 				  pte_t entry, unsigned long address, int psize)
 {
@@ -1037,23 +1078,31 @@ void radix__ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
 	unsigned long set = pte_val(entry) & (_PAGE_DIRTY | _PAGE_ACCESSED |
 					      _PAGE_RW | _PAGE_EXEC);
 
-	unsigned long change = pte_val(entry) ^ pte_val(*ptep);
-	/*
-	 * To avoid NMMU hang while relaxing access, we need mark
-	 * the pte invalid in between.
-	 */
-	if ((change & _PAGE_RW) && mm_has_nmmu(mm)) {
-		unsigned long old_pte, new_pte;
+	if (mm_has_nmmu(mm)) {
+		unsigned long change = pte_val(entry) ^ pte_val(*ptep);
 
-		old_pte = __radix_pte_update(ptep, _PAGE_PRESENT, _PAGE_INVALID);
-		/*
-		 * new value of pte
-		 */
-		new_pte = old_pte | set;
-		radix__flush_tlb_page_psize(mm, address, psize);
-		__radix_pte_update(ptep, _PAGE_INVALID, new_pte);
+		if ((change & _PAGE_RW)) {
+			unsigned long old_pte, new_pte;
+
+			/*
+			 * To avoid NMMU hang while relaxing access, we need mark
+			 * the pte invalid in between.
+			 */
+			old_pte = __radix_pte_update(ptep, _PAGE_PRESENT, _PAGE_INVALID);
+			/*
+			 * new value of pte
+			 */
+			new_pte = old_pte | set;
+			radix__flush_tlb_page_psize(mm, address, psize);
+			__radix_pte_update(ptep, _PAGE_INVALID, new_pte);
+		} else {
+			__radix_pte_update(ptep, 0, set);
+		}
 	} else {
-		__radix_pte_update(ptep, 0, set);
+		if (radix__mm_has_core_atomic_pte_update(mm))
+			__radix_pte_update_atomic(ptep, 0, set);
+		else
+			__radix_pte_update_nonatomic(ptep, 0, set);
 		/*
 		 * Book3S does not require a TLB flush when relaxing access
 		 * restrictions when the address space is not attached to a
-- 
2.23.0

