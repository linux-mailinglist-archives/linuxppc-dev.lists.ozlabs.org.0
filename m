Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3158F5264
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 18:14:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478n1L6tfBzF62r
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 04:13:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="S3wEY335"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478mdd6tQCzF7fq
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 03:56:53 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A501B20656;
 Fri,  8 Nov 2019 16:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573232212;
 bh=ctQacfcL5szbVWx2L/jrieECbr8SHKvQC3P5OOTwV7Q=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=S3wEY335oDsATZgiF2WEplfSygy9zK1ycEG8fjb+iT+B6NRSlL/mdKS/vcbiXtzfT
 wKYYblZeAPe0KTFEm5an6ZI10Mi8sv8X3QqYZXtzkNYyuI+hKU1/PxTMJXU+q1BKEB
 9Yc7qI95zjBCUBwZTLicI6lWyFEt0VPw5JsmbPx0=
Subject: Patch "powerpc/book3s64/radix: Rename CPU_FTR_P9_TLBIE_BUG feature
 flag" has been added to the 4.14-stable tree
To: 20190924035254.24612-2-aneesh.kumar@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, sandipan@linux.ibm.com
From: <gregkh@linuxfoundation.org>
Date: Fri, 08 Nov 2019 17:56:25 +0100
In-Reply-To: <20191017080505.8348-3-sandipan@linux.ibm.com>
Message-ID: <157323218530107@kroah.com>
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

    powerpc/book3s64/radix: Rename CPU_FTR_P9_TLBIE_BUG feature flag

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-book3s64-radix-rename-cpu_ftr_p9_tlbie_bug-feature-flag.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Fri 08 Nov 2019 05:55:09 PM CET
From: Sandipan Das <sandipan@linux.ibm.com>
Date: Thu, 17 Oct 2019 13:35:02 +0530
Subject: powerpc/book3s64/radix: Rename CPU_FTR_P9_TLBIE_BUG feature flag
To: gregkh@linuxfoundation.org
Cc: stable@vger.kernel.org, aneesh.kumar@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Message-ID: <20191017080505.8348-3-sandipan@linux.ibm.com>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

commit 09ce98cacd51fcd0fa0af2f79d1e1d3192f4cbb0 upstream.

Rename the #define to indicate this is related to store vs tlbie
ordering issue. In the next patch, we will be adding another feature
flag that is used to handles ERAT flush vs tlbie ordering issue.

Cc: stable@vger.kernel.org # v4.14
Fixes: a5d4b5891c2f ("powerpc/mm: Fixup tlbie vs store ordering issue on POWER9")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20190924035254.24612-2-aneesh.kumar@linux.ibm.com
[sandipan: Backported to v4.14]
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/include/asm/cputable.h    |    4 ++--
 arch/powerpc/kernel/dt_cpu_ftrs.c      |    6 +++---
 arch/powerpc/kvm/book3s_64_mmu_radix.c |    2 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c    |    2 +-
 arch/powerpc/mm/hash_native_64.c       |    2 +-
 arch/powerpc/mm/tlb-radix.c            |    2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -215,7 +215,7 @@ enum {
 #define CPU_FTR_DAWR			LONG_ASM_CONST(0x0400000000000000)
 #define CPU_FTR_DABRX			LONG_ASM_CONST(0x0800000000000000)
 #define CPU_FTR_PMAO_BUG		LONG_ASM_CONST(0x1000000000000000)
-#define CPU_FTR_P9_TLBIE_BUG		LONG_ASM_CONST(0x2000000000000000)
+#define CPU_FTR_P9_TLBIE_STQ_BUG	LONG_ASM_CONST(0x0000400000000000)
 #define CPU_FTR_POWER9_DD1		LONG_ASM_CONST(0x4000000000000000)
 
 #ifndef __ASSEMBLY__
@@ -477,7 +477,7 @@ enum {
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_DAWR | \
 	    CPU_FTR_ARCH_207S | CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | \
-	    CPU_FTR_P9_TLBIE_BUG)
+	    CPU_FTR_P9_TLBIE_STQ_BUG)
 #define CPU_FTRS_POWER9_DD1 ((CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD1) & \
 			     (~CPU_FTR_SAO))
 #define CPU_FTRS_CELL	(CPU_FTR_USE_TB | CPU_FTR_LWSYNC | \
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -747,14 +747,14 @@ static __init void update_tlbie_feature_
 		if ((pvr & 0xe000) == 0) {
 			/* Nimbus */
 			if ((pvr & 0xfff) < 0x203)
-				cur_cpu_spec->cpu_features |= CPU_FTR_P9_TLBIE_BUG;
+				cur_cpu_spec->cpu_features |= CPU_FTR_P9_TLBIE_STQ_BUG;
 		} else if ((pvr & 0xc000) == 0) {
 			/* Cumulus */
 			if ((pvr & 0xfff) < 0x103)
-				cur_cpu_spec->cpu_features |= CPU_FTR_P9_TLBIE_BUG;
+				cur_cpu_spec->cpu_features |= CPU_FTR_P9_TLBIE_STQ_BUG;
 		} else {
 			WARN_ONCE(1, "Unknown PVR");
-			cur_cpu_spec->cpu_features |= CPU_FTR_P9_TLBIE_BUG;
+			cur_cpu_spec->cpu_features |= CPU_FTR_P9_TLBIE_STQ_BUG;
 		}
 	}
 }
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -160,7 +160,7 @@ static void kvmppc_radix_tlbie_page(stru
 	asm volatile("ptesync": : :"memory");
 	asm volatile(PPC_TLBIE_5(%0, %1, 0, 0, 1)
 		     : : "r" (addr), "r" (kvm->arch.lpid) : "memory");
-	if (cpu_has_feature(CPU_FTR_P9_TLBIE_BUG))
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG))
 		asm volatile(PPC_TLBIE_5(%0, %1, 0, 0, 1)
 			     : : "r" (addr), "r" (kvm->arch.lpid) : "memory");
 	asm volatile("ptesync": : :"memory");
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -449,7 +449,7 @@ static void do_tlbies(struct kvm *kvm, u
 				     "r" (rbvalues[i]), "r" (kvm->arch.lpid));
 		}
 
-		if (cpu_has_feature(CPU_FTR_P9_TLBIE_BUG)) {
+		if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
 			/*
 			 * Need the extra ptesync to make sure we don't
 			 * re-order the tlbie
--- a/arch/powerpc/mm/hash_native_64.c
+++ b/arch/powerpc/mm/hash_native_64.c
@@ -106,7 +106,7 @@ static inline unsigned long  ___tlbie(un
 
 static inline void fixup_tlbie(unsigned long vpn, int psize, int apsize, int ssize)
 {
-	if (cpu_has_feature(CPU_FTR_P9_TLBIE_BUG)) {
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
 		/* Need the extra ptesync to ensure we don't reorder tlbie*/
 		asm volatile("ptesync": : :"memory");
 		___tlbie(vpn, psize, apsize, ssize);
--- a/arch/powerpc/mm/tlb-radix.c
+++ b/arch/powerpc/mm/tlb-radix.c
@@ -44,7 +44,7 @@ static inline void fixup_tlbie(void)
 	unsigned long pid = 0;
 	unsigned long va = ((1UL << 52) - 1);
 
-	if (cpu_has_feature(CPU_FTR_P9_TLBIE_BUG)) {
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
 		asm volatile("ptesync": : :"memory");
 		__tlbie_va(va, pid, mmu_get_ap(MMU_PAGE_64K), RIC_FLUSH_TLB);
 	}


Patches currently in stable-queue which might be from sandipan@linux.ibm.com are

queue-4.14/powerpc-book3s64-mm-don-t-do-tlbie-fixup-for-some-hardware-revisions.patch
queue-4.14/selftests-powerpc-add-test-case-for-tlbie-vs-mtpidr-ordering-issue.patch
queue-4.14/selftests-powerpc-fix-compile-error-on-tlbie_test-due-to-newer-gcc.patch
queue-4.14/powerpc-mm-fixup-tlbie-vs-mtpidr-mtlpidr-ordering-issue-on-power9.patch
queue-4.14/powerpc-mm-fixup-tlbie-vs-store-ordering-issue-on-power9.patch
queue-4.14/powerpc-book3s64-radix-rename-cpu_ftr_p9_tlbie_bug-feature-flag.patch
