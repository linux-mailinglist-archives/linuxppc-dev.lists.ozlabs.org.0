Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B612513AE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 09:56:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbLt720ddzDqT4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 17:56:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tSt5+fHM; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbLq44d4mzDqTG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 17:54:08 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id g1so2457425pgm.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 00:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JSpk0AX7L5ai2NXYTi6ldPMfoV9tLt+6bkW/5ds6qYc=;
 b=tSt5+fHM3nVJbwJjTOby9rbsXcqAHOpXbHJFL9mUJ6qZGnPbhDoszqTIlMRC0g+q8o
 Lg2F2OoKBxXrdzFS1xPJCWhI+8MQbd9QxADtv+Ffq4iSs8j/vLBYqmvZtzSLqMtILNP1
 HY0Ziey1d9skcWolIN1UVtqJ+R5Ah55rqkIDHhEVUohc4nOfpdtVWXUlmy91HLLvYLrb
 lbUAtGtJlpVZXg9X/E+80f7VIduHeASxYVMm8gt/NskoQsUJQ5kAqrO4928CeXSoQy77
 8J1/VF/G2IlwQ4dUrBl+U7QfZluZdBcLXZC1+7oj8gFj+Eh0O83tuvdYjO2yaJnFdZeL
 bFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JSpk0AX7L5ai2NXYTi6ldPMfoV9tLt+6bkW/5ds6qYc=;
 b=R2Pgl01VbUEUNMnJt47bPSpMYYfwkMEkIj+OcJp7m7EMZo9atWDCStRCfHzpSP30fK
 fk4zirvxbRxiGkX7oDkJs4EJYAjlpz5TOJJZWNPFB5Vy/4ybptLl7Wh+fQOBRprpuq82
 n3ZbpsSQhhDb/89WyLxYqgJ9FjDsHwEXBBz6wawOB5O0+RQFddXMUtQjjwhgfQ5Wz09G
 pfhAphJe40CZxTvp6Y5Vw8nxitzzptLOqtdCe4qHY9LK6WhF0b5VYAD58IHVf1tuTGps
 XxJ2ZEOUq8mE7z84hrSc5mGVT1W4aip8EuQeXsK1hqKAPU9ZuYVpFP1TcVk++9Zlg4Z8
 4J0Q==
X-Gm-Message-State: AOAM532IXKMhBKKiuMsZWbud5JPqC2clP5LUS269wdG6ALvXCcJHTtvo
 EwAZfMNDM55Vc/GdgF8X3eSZCZWcJDw=
X-Google-Smtp-Source: ABdhPJxp5jpXsr73Sk+O7vvalEP+AEWIqJQVn17FccNjIwo43ryX46ftj0q1lZ1AaTSZJQHHsvBhPg==
X-Received: by 2002:a62:808e:: with SMTP id j136mr6595925pfd.99.1598342045329; 
 Tue, 25 Aug 2020 00:54:05 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id w16sm14163357pfq.13.2020.08.25.00.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 00:54:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Add cp_abort after tlbiel to invalidate
 copy-buffer address
Date: Tue, 25 Aug 2020 17:53:56 +1000
Message-Id: <20200825075356.224346-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
 arch/powerpc/include/asm/synch.h       | 13 +++++++++++++
 arch/powerpc/mm/book3s64/hash_native.c |  8 ++++----
 arch/powerpc/mm/book3s64/radix_tlb.c   | 12 ++++++------
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/synch.h b/arch/powerpc/include/asm/synch.h
index aca70fb43147..47d036d32828 100644
--- a/arch/powerpc/include/asm/synch.h
+++ b/arch/powerpc/include/asm/synch.h
@@ -3,7 +3,9 @@
 #define _ASM_POWERPC_SYNCH_H 
 #ifdef __KERNEL__
 
+#include <asm/cputable.h>
 #include <asm/feature-fixups.h>
+#include <asm/ppc-opcode.h>
 #include <asm/asm-const.h>
 
 #ifndef __ASSEMBLY__
@@ -20,6 +22,17 @@ static inline void isync(void)
 {
 	__asm__ __volatile__ ("isync" : : : "memory");
 }
+
+static inline void ppc_after_tlbiel_barrier(void)
+{
+        asm volatile("ptesync": : :"memory");
+	/*
+	 * POWER9, POWER10 need a cp_abort after tlbiel. For POWER9 this could
+	 * possibly be limited to tasks which have mapped foreign address, similar
+	 * to cp_abort in context switch.
+	 */
+        asm volatile(ASM_FTR_IFSET(PPC_CP_ABORT, "", %0) : : "i" (CPU_FTR_ARCH_300) : "memory");
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

