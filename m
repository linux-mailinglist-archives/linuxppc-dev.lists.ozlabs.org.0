Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19420F51E1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 18:01:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478ml81Wl9zF7Y2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 04:01:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="kIJkC+A0"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478mdQ0ssmzF7Zf
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 03:56:42 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 023F721924;
 Fri,  8 Nov 2019 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573232200;
 bh=bdOOaft6Guw6RtUVUxS6V/B4OTalf0kH6RR0mS0dBQ0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=kIJkC+A0TybXHQ+a8ddhyMa+6Kp79mfSAtq+gGqks+wmHa4MxkuH0gJ5GpBb+yWAD
 Q7r7HeKugbtcdns09qC0Z+u40tvNsqvUMtI3e1lclGXce3V2bLMcHiAa4WBCZnmeZH
 aJtvIuJT0/OGZPzYR0lb2ZEZr7U1nPlOx4lOR/KY=
Subject: Patch "powerpc/mm: Fixup tlbie vs mtpidr/mtlpidr ordering issue on
 POWER9" has been added to the 4.14-stable tree
To: 20190924035254.24612-3-aneesh.kumar@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, sandipan@linux.ibm.com
From: <gregkh@linuxfoundation.org>
Date: Fri, 08 Nov 2019 17:56:25 +0100
In-Reply-To: <20191017080505.8348-4-sandipan@linux.ibm.com>
Message-ID: <157323218517878@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is a note to let you know that I've just added the patch titled

    powerpc/mm: Fixup tlbie vs mtpidr/mtlpidr ordering issue on POWER9

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-mm-fixup-tlbie-vs-mtpidr-mtlpidr-ordering-issue-on-power9.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Fri 08 Nov 2019 05:55:09 PM CET
From: Sandipan Das <sandipan@linux.ibm.com>
Date: Thu, 17 Oct 2019 13:35:03 +0530
Subject: powerpc/mm: Fixup tlbie vs mtpidr/mtlpidr ordering issue on POWER9
To: gregkh@linuxfoundation.org
Cc: stable@vger.kernel.org, aneesh.kumar@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Message-ID: <20191017080505.8348-4-sandipan@linux.ibm.com>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

commit 047e6575aec71d75b765c22111820c4776cd1c43 upstream.

On POWER9, under some circumstances, a broadcast TLB invalidation will
fail to invalidate the ERAT cache on some threads when there are
parallel mtpidr/mtlpidr happening on other threads of the same core.
This can cause stores to continue to go to a page after it's unmapped.

The workaround is to force an ERAT flush using PID=0 or LPID=0 tlbie
flush. This additional TLB flush will cause the ERAT cache
invalidation. Since we are using PID=0 or LPID=0, we don't get
filtered out by the TLB snoop filtering logic.

We need to still follow this up with another tlbie to take care of
store vs tlbie ordering issue explained in commit:
a5d4b5891c2f ("powerpc/mm: Fixup tlbie vs store ordering issue on
POWER9"). The presence of ERAT cache implies we can still get new
stores and they may miss store queue marking flush.

Cc: stable@vger.kernel.org # v4.14
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20190924035254.24612-3-aneesh.kumar@linux.ibm.com
[sandipan: Backported to v4.14]
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/include/asm/cputable.h |    3 +
 arch/powerpc/kernel/dt_cpu_ftrs.c   |    2 +
 arch/powerpc/kvm/book3s_hv_rm_mmu.c |   42 +++++++++++++++++------
 arch/powerpc/mm/hash_native_64.c    |   28 +++++++++++++--
 arch/powerpc/mm/tlb-radix.c         |   65 ++++++++++++++++++++++++++++++------
 5 files changed, 116 insertions(+), 24 deletions(-)

--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -217,6 +217,7 @@ enum {
 #define CPU_FTR_PMAO_BUG		LONG_ASM_CONST(0x1000000000000000)
 #define CPU_FTR_P9_TLBIE_STQ_BUG	LONG_ASM_CONST(0x0000400000000000)
 #define CPU_FTR_POWER9_DD1		LONG_ASM_CONST(0x4000000000000000)
+#define CPU_FTR_P9_TLBIE_ERAT_BUG	LONG_ASM_CONST(0x0001000000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -477,7 +478,7 @@ enum {
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_DAWR | \
 	    CPU_FTR_ARCH_207S | CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | \
-	    CPU_FTR_P9_TLBIE_STQ_BUG)
+	    CPU_FTR_P9_TLBIE_STQ_BUG | CPU_FTR_P9_TLBIE_ERAT_BUG)
 #define CPU_FTRS_POWER9_DD1 ((CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD1) & \
 			     (~CPU_FTR_SAO))
 #define CPU_FTRS_CELL	(CPU_FTR_USE_TB | CPU_FTR_LWSYNC | \
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -756,6 +756,8 @@ static __init void update_tlbie_feature_
 			WARN_ONCE(1, "Unknown PVR");
 			cur_cpu_spec->cpu_features |= CPU_FTR_P9_TLBIE_STQ_BUG;
 		}
+
+		cur_cpu_spec->cpu_features |= CPU_FTR_P9_TLBIE_ERAT_BUG;
 	}
 }
 
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -429,6 +429,37 @@ static inline int try_lock_tlbie(unsigne
 	return old == 0;
 }
 
+static inline void fixup_tlbie_lpid(unsigned long rb_value, unsigned long lpid)
+{
+
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_ERAT_BUG)) {
+		/* Radix flush for a hash guest */
+
+		unsigned long rb,rs,prs,r,ric;
+
+		rb = PPC_BIT(52); /* IS = 2 */
+		rs = 0;  /* lpid = 0 */
+		prs = 0; /* partition scoped */
+		r = 1;   /* radix format */
+		ric = 0; /* RIC_FLSUH_TLB */
+
+		/*
+		 * Need the extra ptesync to make sure we don't
+		 * re-order the tlbie
+		 */
+		asm volatile("ptesync": : :"memory");
+		asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
+			     : : "r"(rb), "i"(r), "i"(prs),
+			       "i"(ric), "r"(rs) : "memory");
+	}
+
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
+		asm volatile("ptesync": : :"memory");
+		asm volatile(PPC_TLBIE_5(%0,%1,0,0,0) : :
+			     "r" (rb_value), "r" (lpid));
+	}
+}
+
 static void do_tlbies(struct kvm *kvm, unsigned long *rbvalues,
 		      long npages, int global, bool need_sync)
 {
@@ -449,16 +480,7 @@ static void do_tlbies(struct kvm *kvm, u
 				     "r" (rbvalues[i]), "r" (kvm->arch.lpid));
 		}
 
-		if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
-			/*
-			 * Need the extra ptesync to make sure we don't
-			 * re-order the tlbie
-			 */
-			asm volatile("ptesync": : :"memory");
-			asm volatile(PPC_TLBIE_5(%0,%1,0,0,0) : :
-				     "r" (rbvalues[0]), "r" (kvm->arch.lpid));
-		}
-
+		fixup_tlbie_lpid(rbvalues[i - 1], kvm->arch.lpid);
 		asm volatile("eieio; tlbsync; ptesync" : : : "memory");
 		kvm->arch.tlbie_lock = 0;
 	} else {
--- a/arch/powerpc/mm/hash_native_64.c
+++ b/arch/powerpc/mm/hash_native_64.c
@@ -104,8 +104,30 @@ static inline unsigned long  ___tlbie(un
 	return va;
 }
 
-static inline void fixup_tlbie(unsigned long vpn, int psize, int apsize, int ssize)
+static inline void fixup_tlbie_vpn(unsigned long vpn, int psize,
+				   int apsize, int ssize)
 {
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_ERAT_BUG)) {
+		/* Radix flush for a hash guest */
+
+		unsigned long rb,rs,prs,r,ric;
+
+		rb = PPC_BIT(52); /* IS = 2 */
+		rs = 0;  /* lpid = 0 */
+		prs = 0; /* partition scoped */
+		r = 1;   /* radix format */
+		ric = 0; /* RIC_FLSUH_TLB */
+
+		/*
+		 * Need the extra ptesync to make sure we don't
+		 * re-order the tlbie
+		 */
+		asm volatile("ptesync": : :"memory");
+		asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
+			     : : "r"(rb), "i"(r), "i"(prs),
+			       "i"(ric), "r"(rs) : "memory");
+	}
+
 	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
 		/* Need the extra ptesync to ensure we don't reorder tlbie*/
 		asm volatile("ptesync": : :"memory");
@@ -190,7 +212,7 @@ static inline void tlbie(unsigned long v
 		asm volatile("ptesync": : :"memory");
 	} else {
 		__tlbie(vpn, psize, apsize, ssize);
-		fixup_tlbie(vpn, psize, apsize, ssize);
+		fixup_tlbie_vpn(vpn, psize, apsize, ssize);
 		asm volatile("eieio; tlbsync; ptesync": : :"memory");
 	}
 	if (lock_tlbie && !use_local)
@@ -759,7 +781,7 @@ static void native_flush_hash_range(unsi
 		/*
 		 * Just do one more with the last used values.
 		 */
-		fixup_tlbie(vpn, psize, psize, ssize);
+		fixup_tlbie_vpn(vpn, psize, psize, ssize);
 		asm volatile("eieio; tlbsync; ptesync":::"memory");
 
 		if (lock_tlbie)
--- a/arch/powerpc/mm/tlb-radix.c
+++ b/arch/powerpc/mm/tlb-radix.c
@@ -39,14 +39,18 @@ static inline void __tlbie_va(unsigned l
 	trace_tlbie(0, 0, rb, rs, ric, prs, r);
 }
 
-static inline void fixup_tlbie(void)
+
+static inline void fixup_tlbie_va(unsigned long va, unsigned long pid,
+				  unsigned long ap)
 {
-	unsigned long pid = 0;
-	unsigned long va = ((1UL << 52) - 1);
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_ERAT_BUG)) {
+		asm volatile("ptesync": : :"memory");
+		__tlbie_va(va, 0, ap, RIC_FLUSH_TLB);
+	}
 
 	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
 		asm volatile("ptesync": : :"memory");
-		__tlbie_va(va, pid, mmu_get_ap(MMU_PAGE_64K), RIC_FLUSH_TLB);
+		__tlbie_va(va, pid, ap, RIC_FLUSH_TLB);
 	}
 }
 
@@ -95,23 +99,64 @@ static inline void _tlbiel_pid(unsigned
 	asm volatile(PPC_INVALIDATE_ERAT "; isync" : : :"memory");
 }
 
-static inline void _tlbie_pid(unsigned long pid, unsigned long ric)
+static inline void __tlbie_pid(unsigned long pid, unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
 
 	rb = PPC_BIT(53); /* IS = 1 */
 	rs = pid << PPC_BITLSHIFT(31);
 	prs = 1; /* process scoped */
-	r = 1;   /* raidx format */
+	r = 1;   /* radix format */
 
-	asm volatile("ptesync": : :"memory");
 	asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
 		     : : "r"(rb), "i"(r), "i"(prs), "i"(ric), "r"(rs) : "memory");
-	fixup_tlbie();
-	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 	trace_tlbie(0, 0, rb, rs, ric, prs, r);
 }
 
+static inline void fixup_tlbie_pid(unsigned long pid)
+{
+	/*
+	 * We can use any address for the invalidation, pick one which is
+	 * probably unused as an optimisation.
+	 */
+	unsigned long va = ((1UL << 52) - 1);
+
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_ERAT_BUG)) {
+		asm volatile("ptesync": : :"memory");
+		__tlbie_pid(0, RIC_FLUSH_TLB);
+	}
+
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
+		asm volatile("ptesync": : :"memory");
+		__tlbie_va(va, pid, mmu_get_ap(MMU_PAGE_64K), RIC_FLUSH_TLB);
+	}
+}
+
+static inline void _tlbie_pid(unsigned long pid, unsigned long ric)
+{
+	asm volatile("ptesync": : :"memory");
+
+	/*
+	 * Workaround the fact that the "ric" argument to __tlbie_pid
+	 * must be a compile-time contraint to match the "i" constraint
+	 * in the asm statement.
+	 */
+	switch (ric) {
+	case RIC_FLUSH_TLB:
+		__tlbie_pid(pid, RIC_FLUSH_TLB);
+		fixup_tlbie_pid(pid);
+		break;
+	case RIC_FLUSH_PWC:
+		__tlbie_pid(pid, RIC_FLUSH_PWC);
+		break;
+	case RIC_FLUSH_ALL:
+	default:
+		__tlbie_pid(pid, RIC_FLUSH_ALL);
+		fixup_tlbie_pid(pid);
+	}
+	asm volatile("eieio; tlbsync; ptesync": : :"memory");
+}
+
 static inline void _tlbiel_va(unsigned long va, unsigned long pid,
 			      unsigned long ap, unsigned long ric)
 {
@@ -135,7 +180,7 @@ static inline void _tlbie_va(unsigned lo
 {
 	asm volatile("ptesync": : :"memory");
 	__tlbie_va(va, pid, ap, ric);
-	fixup_tlbie();
+	fixup_tlbie_va(va, pid, ap);
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 


Patches currently in stable-queue which might be from sandipan@linux.ibm.com are

queue-4.14/powerpc-book3s64-mm-don-t-do-tlbie-fixup-for-some-hardware-revisions.patch
queue-4.14/selftests-powerpc-add-test-case-for-tlbie-vs-mtpidr-ordering-issue.patch
queue-4.14/selftests-powerpc-fix-compile-error-on-tlbie_test-due-to-newer-gcc.patch
queue-4.14/powerpc-mm-fixup-tlbie-vs-mtpidr-mtlpidr-ordering-issue-on-power9.patch
queue-4.14/powerpc-mm-fixup-tlbie-vs-store-ordering-issue-on-power9.patch
queue-4.14/powerpc-book3s64-radix-rename-cpu_ftr_p9_tlbie_bug-feature-flag.patch
