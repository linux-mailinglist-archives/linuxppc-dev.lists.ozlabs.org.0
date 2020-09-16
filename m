Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ABE26BA7E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 05:06:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrlNT0mfnzDqW4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 13:06:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f9VVPAul; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrlJp1v7NzDqLt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 13:02:49 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id l71so577436pge.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 20:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=22CJ8lFp8ycBiPqrffcXaGAo5a+6GvcBKIlAmrZHszs=;
 b=f9VVPAulyres7KdrKIB5iGgeXpqAnO5Ry9x2c+Jd27SkQaVRVANd1pckbT+e/wnOr0
 krpEs+0oxtNkJvRqw6B+w9wq5H/yYNex1sEMUw80kp8ql6QJCNMS9JcDKxFb/rOz0uX8
 f2Ngg5BiuB3LvRrFnRA7QMaqGR0kK1xTKk0/Ju9QDLStS/DVkucq8cibUsz9tmkR78N2
 Jr+yYhTD7APoUWZaVoWmp/HSgQy4Bc8lPHOQ9qWKyGkGUygfRwTwCw4vmWXxAVQN9IHN
 xigdCubSon+fM74RYVp0PWkFZZC3xodm+1iHDmY38V7kUd7tKt9xrzjjMo+WUzc8cbL2
 xgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=22CJ8lFp8ycBiPqrffcXaGAo5a+6GvcBKIlAmrZHszs=;
 b=HywULvRHVSwT4qFXlozcfv+4L7RDbK4YL3RrPapfluqbnukEoTeGxhjgW1zMOpLzG+
 EJM+CU1tRjmno3V15a6Q7rzM6oUL83/BtY97SIMToaCi+t7YYiorGr1IaV3u1VwhCj0X
 auoGGWW2U2viZHDRALnrO13CuYf+gktFbB+gh0rcsIRZEmAXN+L7w+hTi8t2TzmebAkj
 eoYDXV1L77lux92LfQNyx7dT0RrPPImEBpqzdIFhlzrckJogf1pJQGQusfp6rnva2vLJ
 AApDVmqR8pBCT7wRTsx0OBCVWRjUSoygMe7Zw2mQ7Qw8j31zNinOwM1bW/EiJ2VwPY+o
 vw1A==
X-Gm-Message-State: AOAM530dXrM3xx1DQdpSp3GZSsnW7lYNh9UOU3Ju2ZYYbQhhC8LZEpT1
 ez6rUWJLWddqpDshNhW1WxH1oHVEHrn9rw==
X-Google-Smtp-Source: ABdhPJxOFEbUzoi3iVjRJsYGRL1PFbJanvqUKYQVBQuPfndnv+3SKJtu75DXyi2q6muXSOHqdkGEbA==
X-Received: by 2002:a63:2a96:: with SMTP id
 q144mr17579947pgq.447.1600225366615; 
 Tue, 15 Sep 2020 20:02:46 -0700 (PDT)
Received: from bobo.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id v26sm13090432pgo.83.2020.09.15.20.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 20:02:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/64s: Add cp_abort after tlbiel to invalidate
 copy-buffer address
Date: Wed, 16 Sep 2020 13:02:34 +1000
Message-Id: <20200916030234.4110379-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200916030234.4110379-1-npiggin@gmail.com>
References: <20200916030234.4110379-1-npiggin@gmail.com>
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

The copy buffer is implemented as a real address in the nest which is
translated from EA by copy, and used for memory access by paste. This
requires that it be invalidated by TLB invalidation.

TLBIE does invalidate the copy buffer, but TLBIEL does not. Add cp_abort
to the tlbiel sequence.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
v2:
- Untangle headers that were causing build failures.
- Improve the comment a bit.
- Exempt POWER9 from the workaround, as described by the comment (we
  worked this out already but I forgot about it when doing v1!)

 arch/powerpc/include/asm/synch.h       | 19 ++++++++++++++++++-
 arch/powerpc/mm/book3s64/hash_native.c |  8 ++++----
 arch/powerpc/mm/book3s64/radix_tlb.c   | 12 ++++++------
 3 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/synch.h b/arch/powerpc/include/asm/synch.h
index aca70fb43147..a2e89f27d547 100644
--- a/arch/powerpc/include/asm/synch.h
+++ b/arch/powerpc/include/asm/synch.h
@@ -3,8 +3,9 @@
 #define _ASM_POWERPC_SYNCH_H 
 #ifdef __KERNEL__
 
+#include <asm/cputable.h>
 #include <asm/feature-fixups.h>
-#include <asm/asm-const.h>
+#include <asm/ppc-opcode.h>
 
 #ifndef __ASSEMBLY__
 extern unsigned int __start___lwsync_fixup, __stop___lwsync_fixup;
@@ -20,6 +21,22 @@ static inline void isync(void)
 {
 	__asm__ __volatile__ ("isync" : : : "memory");
 }
+
+static inline void ppc_after_tlbiel_barrier(void)
+{
+        asm volatile("ptesync": : :"memory");
+	/*
+	 * POWER9, POWER10 need a cp_abort after tlbiel to ensure the copy
+	 * is invalidated correctly. If this is not done, the paste can take
+	 * data from the physical address that was translated at copy time.
+	 *
+	 * POWER9 in practice does not need this, because address spaces
+	 * with accelerators mapped will use tlbie (which does invalidate
+	 * the copy) to invalidate translations. It's not possible to limit
+	 * POWER10 this way due to local copy-paste.
+	 */
+        asm volatile(ASM_FTR_IFSET(PPC_CP_ABORT, "", %0) : : "i" (CPU_FTR_ARCH_31) : "memory");
+}
 #endif /* __ASSEMBLY__ */
 
 #if defined(__powerpc64__)
diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index cf20e5229ce1..0203cdf48c54 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -82,7 +82,7 @@ static void tlbiel_all_isa206(unsigned int num_sets, unsigned int is)
 	for (set = 0; set < num_sets; set++)
 		tlbiel_hash_set_isa206(set, is);
 
-	asm volatile("ptesync": : :"memory");
+	ppc_after_tlbiel_barrier();
 }
 
 static void tlbiel_all_isa300(unsigned int num_sets, unsigned int is)
@@ -110,7 +110,7 @@ static void tlbiel_all_isa300(unsigned int num_sets, unsigned int is)
 	 */
 	tlbiel_hash_set_isa300(0, is, 0, 2, 1);
 
-	asm volatile("ptesync": : :"memory");
+	ppc_after_tlbiel_barrier();
 
 	asm volatile(PPC_ISA_3_0_INVALIDATE_ERAT "; isync" : : :"memory");
 }
@@ -303,7 +303,7 @@ static inline void tlbie(unsigned long vpn, int psize, int apsize,
 	asm volatile("ptesync": : :"memory");
 	if (use_local) {
 		__tlbiel(vpn, psize, apsize, ssize);
-		asm volatile("ptesync": : :"memory");
+		ppc_after_tlbiel_barrier();
 	} else {
 		__tlbie(vpn, psize, apsize, ssize);
 		fixup_tlbie_vpn(vpn, psize, apsize, ssize);
@@ -879,7 +879,7 @@ static void native_flush_hash_range(unsigned long number, int local)
 				__tlbiel(vpn, psize, psize, ssize);
 			} pte_iterate_hashed_end();
 		}
-		asm volatile("ptesync":::"memory");
+		ppc_after_tlbiel_barrier();
 	} else {
 		int lock_tlbie = !mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE);
 
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 0d233763441f..5c9d2fccacc7 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -65,7 +65,7 @@ static void tlbiel_all_isa300(unsigned int num_sets, unsigned int is)
 	for (set = 1; set < num_sets; set++)
 		tlbiel_radix_set_isa300(set, is, 0, RIC_FLUSH_TLB, 1);
 
-	asm volatile("ptesync": : :"memory");
+	ppc_after_tlbiel_barrier();
 }
 
 void radix__tlbiel_all(unsigned int action)
@@ -296,7 +296,7 @@ static __always_inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
 
 	/* For PWC, only one flush is needed */
 	if (ric == RIC_FLUSH_PWC) {
-		asm volatile("ptesync": : :"memory");
+		ppc_after_tlbiel_barrier();
 		return;
 	}
 
@@ -304,7 +304,7 @@ static __always_inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
 	for (set = 1; set < POWER9_TLB_SETS_RADIX ; set++)
 		__tlbiel_pid(pid, set, RIC_FLUSH_TLB);
 
-	asm volatile("ptesync": : :"memory");
+	ppc_after_tlbiel_barrier();
 	asm volatile(PPC_RADIX_INVALIDATE_ERAT_USER "; isync" : : :"memory");
 }
 
@@ -431,7 +431,7 @@ static __always_inline void _tlbiel_va(unsigned long va, unsigned long pid,
 
 	asm volatile("ptesync": : :"memory");
 	__tlbiel_va(va, pid, ap, ric);
-	asm volatile("ptesync": : :"memory");
+	ppc_after_tlbiel_barrier();
 }
 
 static inline void _tlbiel_va_range(unsigned long start, unsigned long end,
@@ -442,7 +442,7 @@ static inline void _tlbiel_va_range(unsigned long start, unsigned long end,
 	if (also_pwc)
 		__tlbiel_pid(pid, 0, RIC_FLUSH_PWC);
 	__tlbiel_va_range(start, end, pid, page_size, psize);
-	asm volatile("ptesync": : :"memory");
+	ppc_after_tlbiel_barrier();
 }
 
 static inline void __tlbie_va_range(unsigned long start, unsigned long end,
@@ -940,7 +940,7 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 			if (hflush)
 				__tlbiel_va_range(hstart, hend, pid,
 						PMD_SIZE, MMU_PAGE_2M);
-			asm volatile("ptesync": : :"memory");
+			ppc_after_tlbiel_barrier();
 		} else if (cputlb_use_tlbie()) {
 			asm volatile("ptesync": : :"memory");
 			__tlbie_va_range(start, end, pid, page_size, mmu_virtual_psize);
-- 
2.23.0

