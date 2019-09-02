Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 948A7A5AA7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 17:37:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MZ3F22mhzDqdS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 01:37:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BwY7TMOk"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MYxT1CVkzDqdd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 01:32:37 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id h195so2609728pfe.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2019 08:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=USP7+LidvcBgzAZbbbndVrvv5Wpne7haPDoBCyfSpmg=;
 b=BwY7TMOkmcTO5RQC4U5f3ckc4+upVTV5tpkhqM9UATgSxt0k/8+0gxdoR50L6c3WfO
 WzHNiXARaiITwfxVST3UIEAw2c9EEQLuRSgHi/ctPrGC316TrxFcNxxVeZxe20xd/M/3
 xbtaUhxwZVIpgxDO0xwuP8kVPuDOFlZyX81NGVfslapnHpivmQ5IKzoN863CpvXXTj7U
 QQDZgWs4yIlHrkN7lsas1AYoyQtj1wOngW1/3mpvBYOPViGw6tukxdAGeyHrxK/h4c6l
 HeaI1PXfxRDFzv6JhY5R2/sB43FqOH9e++LakpGUD+7ZP0Uvo7aPU7UrwRffFKJqdeDM
 dA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=USP7+LidvcBgzAZbbbndVrvv5Wpne7haPDoBCyfSpmg=;
 b=nEAq7FnT6PaqMo0cfuCatP5rU/VraZb1jU4YCCBlVtacQ9PP2WjlsJ9lzsMTEanbmR
 dKewQySwYq0Vx3TFSIjsBD9a00WNRv5an6VnFwmJ7IAIBaSVMXxfDdaJs53/9UuQbCqj
 CKX76yykrowdzHITlugbo8UkC8EePxX06fT7/td+8/NGfQKWPyUCIYk651sEIVsP0cTc
 UWuYpAewXSWo6SwTnGg7k0Zh48P4X3iwTWMbZ+pII4VyMlXlpsj9UpFIZ++3UD3NaNYG
 qcrcflMD7t2M1CvWE673ddOccBRy9Gmhl7yV/MpFYXTRooeJ9T8QldPexzMuatHsUFNf
 2vVw==
X-Gm-Message-State: APjAAAXjq6oobuqA9HXodbYmluwfzqJXsSPYg3s/kg8RGK4lPcVc0I86
 SuLApG9D0iORyC6ZQeJMdY0eKUTmYl4=
X-Google-Smtp-Source: APXvYqwVu5qLbCDg59L0hh5DCHoiGc8JYV0htTK506vXIt+IP6B4mFlGr96UIfoZ8L505UyoibbmUA==
X-Received: by 2002:a63:4562:: with SMTP id u34mr25311284pgk.288.1567438354594; 
 Mon, 02 Sep 2019 08:32:34 -0700 (PDT)
Received: from bobo.local0.net ([61.68.187.15])
 by smtp.gmail.com with ESMTPSA id b14sm15966033pfo.15.2019.09.02.08.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 08:32:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] powerpc/64s/radix: tidy up TLB flushing code
Date: Tue,  3 Sep 2019 01:29:27 +1000
Message-Id: <20190902152931.17840-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902152931.17840-1-npiggin@gmail.com>
References: <20190902152931.17840-1-npiggin@gmail.com>
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

There should be no functional changes.

- Use calls to existing radix_tlb.c functions in flush_partition.

- Rename radix__flush_tlb_lpid to radix__flush_all_lpid and similar,
  because they flush everything, matching flush_all_mm rather than
  flush_tlb_mm for the lpid.

- Remove some unused radix_tlb.c flush primitives.

Signed-off: Nicholas Piggin <npiggin@gmail.com>
---
 .../include/asm/book3s/64/tlbflush-radix.h    |  12 +-
 arch/powerpc/kvm/book3s_hv_nested.c           |   2 +-
 arch/powerpc/mm/book3s64/pgtable.c            |  13 +-
 arch/powerpc/mm/book3s64/radix_tlb.c          | 117 ++++--------------
 4 files changed, 34 insertions(+), 110 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
index 05147cecb8df..4ce795d30377 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
@@ -17,8 +17,8 @@ extern void radix__flush_tlb_lpid_page(unsigned int lpid,
 					unsigned long addr,
 					unsigned long page_size);
 extern void radix__flush_pwc_lpid(unsigned int lpid);
-extern void radix__flush_tlb_lpid(unsigned int lpid);
-extern void radix__local_flush_tlb_lpid_guest(unsigned int lpid);
+extern void radix__flush_all_lpid(unsigned int lpid);
+extern void radix__flush_all_lpid_guest(unsigned int lpid);
 #else
 static inline void radix__tlbiel_all(unsigned int action) { WARN_ON(1); };
 static inline void radix__flush_tlb_lpid_page(unsigned int lpid,
@@ -31,11 +31,7 @@ static inline void radix__flush_pwc_lpid(unsigned int lpid)
 {
 	WARN_ON(1);
 }
-static inline void radix__flush_tlb_lpid(unsigned int lpid)
-{
-	WARN_ON(1);
-}
-static inline void radix__local_flush_tlb_lpid_guest(unsigned int lpid)
+static inline void radix__flush_all_lpid(unsigned int lpid)
 {
 	WARN_ON(1);
 }
@@ -73,6 +69,4 @@ extern void radix__flush_tlb_pwc(struct mmu_gather *tlb, unsigned long addr);
 extern void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr);
 extern void radix__flush_tlb_all(void);
 
-extern void radix__local_flush_tlb_lpid(unsigned int lpid);
-
 #endif
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 735e0ac6f5b2..b3316da2f13e 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -398,7 +398,7 @@ static void kvmhv_flush_lpid(unsigned int lpid)
 	long rc;
 
 	if (!kvmhv_on_pseries()) {
-		radix__flush_tlb_lpid(lpid);
+		radix__flush_all_lpid(lpid);
 		return;
 	}
 
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 97f3be778c79..c2b87c5ba50b 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -210,20 +210,17 @@ void __init mmu_partition_table_init(void)
 
 static void flush_partition(unsigned int lpid, bool radix)
 {
-	asm volatile("ptesync" : : : "memory");
 	if (radix) {
-		asm volatile(PPC_TLBIE_5(%0,%1,2,0,1) : :
-			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
-		asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
-			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
-		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 1);
+		radix__flush_all_lpid(lpid);
+		radix__flush_all_lpid_guest(lpid);
 	} else {
+		asm volatile("ptesync" : : : "memory");
 		asm volatile(PPC_TLBIE_5(%0,%1,2,0,0) : :
 			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
+		/* do we need fixup here ?*/
+		asm volatile("eieio; tlbsync; ptesync" : : : "memory");
 		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 0);
 	}
-	/* do we need fixup here ?*/
-	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
 }
 
 void mmu_partition_table_set_entry(unsigned int lpid, unsigned long dw0,
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 71f7fede2fa4..082f90d068ee 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -116,22 +116,6 @@ static __always_inline void __tlbie_pid(unsigned long pid, unsigned long ric)
 	trace_tlbie(0, 0, rb, rs, ric, prs, r);
 }
 
-static __always_inline void __tlbiel_lpid(unsigned long lpid, int set,
-				unsigned long ric)
-{
-	unsigned long rb,rs,prs,r;
-
-	rb = PPC_BIT(52); /* IS = 2 */
-	rb |= set << PPC_BITLSHIFT(51);
-	rs = 0;  /* LPID comes from LPIDR */
-	prs = 0; /* partition scoped */
-	r = 1;   /* radix format */
-
-	asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
-		     : : "r"(rb), "i"(r), "i"(prs), "i"(ric), "r"(rs) : "memory");
-	trace_tlbie(lpid, 1, rb, rs, ric, prs, r);
-}
-
 static __always_inline void __tlbie_lpid(unsigned long lpid, unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
@@ -146,23 +130,20 @@ static __always_inline void __tlbie_lpid(unsigned long lpid, unsigned long ric)
 	trace_tlbie(lpid, 0, rb, rs, ric, prs, r);
 }
 
-static __always_inline void __tlbiel_lpid_guest(unsigned long lpid, int set,
-						unsigned long ric)
+static __always_inline void __tlbie_lpid_guest(unsigned long lpid, unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
 
 	rb = PPC_BIT(52); /* IS = 2 */
-	rb |= set << PPC_BITLSHIFT(51);
-	rs = 0;  /* LPID comes from LPIDR */
+	rs = lpid;
 	prs = 1; /* process scoped */
 	r = 1;   /* radix format */
 
-	asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
+	asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
 		     : : "r"(rb), "i"(r), "i"(prs), "i"(ric), "r"(rs) : "memory");
-	trace_tlbie(lpid, 1, rb, rs, ric, prs, r);
+	trace_tlbie(lpid, 0, rb, rs, ric, prs, r);
 }
 
-
 static __always_inline void __tlbiel_va(unsigned long va, unsigned long pid,
 					unsigned long ap, unsigned long ric)
 {
@@ -285,34 +266,6 @@ static inline void _tlbie_pid(unsigned long pid, unsigned long ric)
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
-static inline void _tlbiel_lpid(unsigned long lpid, unsigned long ric)
-{
-	int set;
-
-	VM_BUG_ON(mfspr(SPRN_LPID) != lpid);
-
-	asm volatile("ptesync": : :"memory");
-
-	/*
-	 * Flush the first set of the TLB, and if we're doing a RIC_FLUSH_ALL,
-	 * also flush the entire Page Walk Cache.
-	 */
-	__tlbiel_lpid(lpid, 0, ric);
-
-	/* For PWC, only one flush is needed */
-	if (ric == RIC_FLUSH_PWC) {
-		asm volatile("ptesync": : :"memory");
-		return;
-	}
-
-	/* For the remaining sets, just flush the TLB */
-	for (set = 1; set < POWER9_TLB_SETS_RADIX ; set++)
-		__tlbiel_lpid(lpid, set, RIC_FLUSH_TLB);
-
-	asm volatile("ptesync": : :"memory");
-	asm volatile(PPC_RADIX_INVALIDATE_ERAT_GUEST "; isync" : : :"memory");
-}
-
 static inline void _tlbie_lpid(unsigned long lpid, unsigned long ric)
 {
 	asm volatile("ptesync": : :"memory");
@@ -337,35 +290,28 @@ static inline void _tlbie_lpid(unsigned long lpid, unsigned long ric)
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
-static __always_inline void _tlbiel_lpid_guest(unsigned long lpid, unsigned long ric)
+static __always_inline void _tlbie_lpid_guest(unsigned long lpid, unsigned long ric)
 {
-	int set;
-
-	VM_BUG_ON(mfspr(SPRN_LPID) != lpid);
-
-	asm volatile("ptesync": : :"memory");
-
 	/*
-	 * Flush the first set of the TLB, and if we're doing a RIC_FLUSH_ALL,
-	 * also flush the entire Page Walk Cache.
+	 * Workaround the fact that the "ric" argument to __tlbie_pid
+	 * must be a compile-time contraint to match the "i" constraint
+	 * in the asm statement.
 	 */
-	__tlbiel_lpid_guest(lpid, 0, ric);
-
-	/* For PWC, only one flush is needed */
-	if (ric == RIC_FLUSH_PWC) {
-		asm volatile("ptesync": : :"memory");
-		return;
+	switch (ric) {
+	case RIC_FLUSH_TLB:
+		__tlbie_lpid_guest(lpid, RIC_FLUSH_TLB);
+		break;
+	case RIC_FLUSH_PWC:
+		__tlbie_lpid_guest(lpid, RIC_FLUSH_PWC);
+		break;
+	case RIC_FLUSH_ALL:
+	default:
+		__tlbie_lpid_guest(lpid, RIC_FLUSH_ALL);
 	}
-
-	/* For the remaining sets, just flush the TLB */
-	for (set = 1; set < POWER9_TLB_SETS_RADIX ; set++)
-		__tlbiel_lpid_guest(lpid, set, RIC_FLUSH_TLB);
-
-	asm volatile("ptesync": : :"memory");
-	asm volatile(PPC_RADIX_INVALIDATE_ERAT_GUEST : : :"memory");
+	fixup_tlbie_lpid(lpid);
+	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
-
 static inline void __tlbiel_va_range(unsigned long start, unsigned long end,
 				    unsigned long pid, unsigned long page_size,
 				    unsigned long psize)
@@ -835,32 +781,19 @@ EXPORT_SYMBOL_GPL(radix__flush_pwc_lpid);
 /*
  * Flush partition scoped translations from LPID (=LPIDR)
  */
-void radix__flush_tlb_lpid(unsigned int lpid)
+void radix__flush_all_lpid(unsigned int lpid)
 {
 	_tlbie_lpid(lpid, RIC_FLUSH_ALL);
 }
-EXPORT_SYMBOL_GPL(radix__flush_tlb_lpid);
+EXPORT_SYMBOL_GPL(radix__flush_all_lpid);
 
 /*
- * Flush partition scoped translations from LPID (=LPIDR)
+ * Flush process scoped translations from LPID (=LPIDR)
  */
-void radix__local_flush_tlb_lpid(unsigned int lpid)
+void radix__flush_all_lpid_guest(unsigned int lpid)
 {
-	_tlbiel_lpid(lpid, RIC_FLUSH_ALL);
+	_tlbie_lpid_guest(lpid, RIC_FLUSH_ALL);
 }
-EXPORT_SYMBOL_GPL(radix__local_flush_tlb_lpid);
-
-/*
- * Flush process scoped translations from LPID (=LPIDR).
- * Important difference, the guest normally manages its own translations,
- * but some cases e.g., vCPU CPU migration require KVM to flush.
- */
-void radix__local_flush_tlb_lpid_guest(unsigned int lpid)
-{
-	_tlbiel_lpid_guest(lpid, RIC_FLUSH_ALL);
-}
-EXPORT_SYMBOL_GPL(radix__local_flush_tlb_lpid_guest);
-
 
 static void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
 				  unsigned long end, int psize);
-- 
2.22.0

