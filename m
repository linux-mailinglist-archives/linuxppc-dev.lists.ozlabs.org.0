Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F96BC0DA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 06:01:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cnYn4YT1zDq6Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 14:01:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cnNM27gVzDqSG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 13:53:22 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8O3qsZk030238; Mon, 23 Sep 2019 23:53:13 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v76mfsp8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 23:53:13 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8O3rDOq031349;
 Mon, 23 Sep 2019 23:53:13 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v76mfsp83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 23:53:13 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8O3pkrR024691;
 Tue, 24 Sep 2019 03:53:12 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 2v5bg6yfah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2019 03:53:12 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8O3rAs330671142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Sep 2019 03:53:10 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5193BE056;
 Tue, 24 Sep 2019 03:53:10 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E71ABBE053;
 Tue, 24 Sep 2019 03:53:08 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.124.35.207])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 24 Sep 2019 03:53:08 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: [PATCH 3/4] powerpc/mm: Fixup tlbie vs mtpidr/mtlpidr ordering issue
 on POWER9
Date: Tue, 24 Sep 2019 09:22:53 +0530
Message-Id: <20190924035254.24612-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924035254.24612-1-aneesh.kumar@linux.ibm.com>
References: <20190924035254.24612-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-24_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909240037
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On POWER9, under some circumstances, a broadcast TLB invalidation
will fail to invalidate the ERAT cache on some threads when there are
parallel mtpidr/mtlpidr happening on other threads of the same core.
This can cause stores to continue to go to a page after it's unmapped.

The workaround is to force an ERAT flush using PID=0 or LPID=0
tlbie flush. This additional TLB flush will cause the ERAT cache invalidation.
Since we are using PID=0 or LPID=0, we don't get filtered out by the TLB snoop
filtering logic.

We need to still follow this up with another tlbie to take care of store vs
tlbie ordering issue explained in commit: a5d4b5891c2f ("powerpc/mm: Fixup tlbie vs
store ordering issue on POWER9"). The presence of ERAT cache implies we can still
get new stores and they may miss store queue marking flush.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/cputable.h    |  3 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c      |  2 +
 arch/powerpc/kvm/book3s_hv_rm_mmu.c    | 42 +++++++++++----
 arch/powerpc/mm/book3s64/hash_native.c | 29 ++++++++--
 arch/powerpc/mm/book3s64/radix_tlb.c   | 74 +++++++++++++++++++++++---
 5 files changed, 128 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index f080fba48619..cf00ff0d121d 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -211,6 +211,7 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_P9_TM_XER_SO_BUG	LONG_ASM_CONST(0x0000200000000000)
 #define CPU_FTR_P9_TLBIE_STQ_BUG	LONG_ASM_CONST(0x0000400000000000)
 #define CPU_FTR_P9_TIDR			LONG_ASM_CONST(0x0000800000000000)
+#define CPU_FTR_P9_TLBIE_ERAT_BUG	LONG_ASM_CONST(0x0001000000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -457,7 +458,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
 	    CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | CPU_FTR_PKEY | \
-	    CPU_FTR_P9_TLBIE_STQ_BUG | CPU_FTR_P9_TIDR)
+	    CPU_FTR_P9_TLBIE_STQ_BUG | CPU_FTR_P9_TLBIE_ERAT_BUG | CPU_FTR_P9_TIDR)
 #define CPU_FTRS_POWER9_DD2_0 CPU_FTRS_POWER9
 #define CPU_FTRS_POWER9_DD2_1 (CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD2_1)
 #define CPU_FTRS_POWER9_DD2_2 (CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD2_1 | \
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 4ddf2c7a7fb7..864cc55fa03c 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -714,6 +714,8 @@ static __init void update_tlbie_feature_flag(unsigned long pvr)
 			WARN_ONCE(1, "Unknown PVR");
 			cur_cpu_spec->cpu_features |= CPU_FTR_P9_TLBIE_STQ_BUG;
 		}
+
+		cur_cpu_spec->cpu_features |= CPU_FTR_P9_TLBIE_ERAT_BUG;
 	}
 }
 
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 7d89b1b10ea5..47f86252e8a1 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -433,6 +433,37 @@ static inline int is_mmio_hpte(unsigned long v, unsigned long r)
 		(HPTE_R_KEY_HI | HPTE_R_KEY_LO));
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
@@ -451,16 +482,7 @@ static void do_tlbies(struct kvm *kvm, unsigned long *rbvalues,
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
 	} else {
 		if (need_sync)
diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index 02568dae4695..523e42eb11da 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -197,8 +197,31 @@ static inline unsigned long  ___tlbie(unsigned long vpn, int psize,
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
+
 	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
 		/* Need the extra ptesync to ensure we don't reorder tlbie*/
 		asm volatile("ptesync": : :"memory");
@@ -283,7 +306,7 @@ static inline void tlbie(unsigned long vpn, int psize, int apsize,
 		asm volatile("ptesync": : :"memory");
 	} else {
 		__tlbie(vpn, psize, apsize, ssize);
-		fixup_tlbie(vpn, psize, apsize, ssize);
+		fixup_tlbie_vpn(vpn, psize, apsize, ssize);
 		asm volatile("eieio; tlbsync; ptesync": : :"memory");
 	}
 	if (lock_tlbie && !use_local)
@@ -856,7 +879,7 @@ static void native_flush_hash_range(unsigned long number, int local)
 		/*
 		 * Just do one more with the last used values.
 		 */
-		fixup_tlbie(vpn, psize, psize, ssize);
+		fixup_tlbie_vpn(vpn, psize, psize, ssize);
 		asm volatile("eieio; tlbsync; ptesync":::"memory");
 
 		if (lock_tlbie)
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 69fdc004d83f..99f202e0110c 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -196,21 +196,76 @@ static __always_inline void __tlbie_lpid_va(unsigned long va, unsigned long lpid
 	trace_tlbie(lpid, 0, rb, rs, ric, prs, r);
 }
 
-static inline void fixup_tlbie(void)
+
+static inline void fixup_tlbie_va(unsigned long va, unsigned long pid,
+				  unsigned long ap)
+{
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_ERAT_BUG)) {
+		asm volatile("ptesync": : :"memory");
+		__tlbie_va(va, 0, ap, RIC_FLUSH_TLB);
+	}
+
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
+		asm volatile("ptesync": : :"memory");
+		__tlbie_va(va, pid, ap, RIC_FLUSH_TLB);
+	}
+}
+
+static inline void fixup_tlbie_va_range(unsigned long va, unsigned long pid,
+					unsigned long ap)
 {
-	unsigned long pid = 0;
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_ERAT_BUG)) {
+		asm volatile("ptesync": : :"memory");
+		__tlbie_pid(0, RIC_FLUSH_TLB);
+	}
+
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
+		asm volatile("ptesync": : :"memory");
+		__tlbie_va(va, pid, ap, RIC_FLUSH_TLB);
+	}
+}
+
+static inline void fixup_tlbie_pid(unsigned long pid)
+{
+	/* Mostly Unmapped address */
 	unsigned long va = ((1UL << 52) - 1);
 
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_ERAT_BUG)) {
+		asm volatile("ptesync": : :"memory");
+		__tlbie_pid(0, RIC_FLUSH_TLB);
+	}
+
 	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
 		asm volatile("ptesync": : :"memory");
 		__tlbie_va(va, pid, mmu_get_ap(MMU_PAGE_64K), RIC_FLUSH_TLB);
 	}
 }
 
+
+static inline void fixup_tlbie_lpid_va(unsigned long va, unsigned long lpid,
+				       unsigned long ap)
+{
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_ERAT_BUG)) {
+		asm volatile("ptesync": : :"memory");
+		__tlbie_lpid_va(va, 0, ap, RIC_FLUSH_TLB);
+	}
+
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
+		asm volatile("ptesync": : :"memory");
+		__tlbie_lpid_va(va, lpid, ap, RIC_FLUSH_TLB);
+	}
+}
+
 static inline void fixup_tlbie_lpid(unsigned long lpid)
 {
+	/* Mostly Unmapped address */
 	unsigned long va = ((1UL << 52) - 1);
 
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_ERAT_BUG)) {
+		asm volatile("ptesync": : :"memory");
+		__tlbie_lpid(0, RIC_FLUSH_TLB);
+	}
+
 	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
 		asm volatile("ptesync": : :"memory");
 		__tlbie_lpid_va(va, lpid, mmu_get_ap(MMU_PAGE_64K), RIC_FLUSH_TLB);
@@ -258,6 +313,7 @@ static inline void _tlbie_pid(unsigned long pid, unsigned long ric)
 	switch (ric) {
 	case RIC_FLUSH_TLB:
 		__tlbie_pid(pid, RIC_FLUSH_TLB);
+		fixup_tlbie_pid(pid);
 		break;
 	case RIC_FLUSH_PWC:
 		__tlbie_pid(pid, RIC_FLUSH_PWC);
@@ -265,8 +321,8 @@ static inline void _tlbie_pid(unsigned long pid, unsigned long ric)
 	case RIC_FLUSH_ALL:
 	default:
 		__tlbie_pid(pid, RIC_FLUSH_ALL);
+		fixup_tlbie_pid(pid);
 	}
-	fixup_tlbie();
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
@@ -315,6 +371,7 @@ static inline void _tlbie_lpid(unsigned long lpid, unsigned long ric)
 	switch (ric) {
 	case RIC_FLUSH_TLB:
 		__tlbie_lpid(lpid, RIC_FLUSH_TLB);
+		fixup_tlbie_lpid(lpid);
 		break;
 	case RIC_FLUSH_PWC:
 		__tlbie_lpid(lpid, RIC_FLUSH_PWC);
@@ -322,8 +379,8 @@ static inline void _tlbie_lpid(unsigned long lpid, unsigned long ric)
 	case RIC_FLUSH_ALL:
 	default:
 		__tlbie_lpid(lpid, RIC_FLUSH_ALL);
+		fixup_tlbie_lpid(lpid);
 	}
-	fixup_tlbie_lpid(lpid);
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
@@ -390,6 +447,8 @@ static inline void __tlbie_va_range(unsigned long start, unsigned long end,
 
 	for (addr = start; addr < end; addr += page_size)
 		__tlbie_va(addr, pid, ap, RIC_FLUSH_TLB);
+
+	fixup_tlbie_va_range(addr - page_size, pid, ap);
 }
 
 static __always_inline void _tlbie_va(unsigned long va, unsigned long pid,
@@ -399,7 +458,7 @@ static __always_inline void _tlbie_va(unsigned long va, unsigned long pid,
 
 	asm volatile("ptesync": : :"memory");
 	__tlbie_va(va, pid, ap, ric);
-	fixup_tlbie();
+	fixup_tlbie_va(va, pid, ap);
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
@@ -457,7 +516,7 @@ static __always_inline void _tlbie_lpid_va(unsigned long va, unsigned long lpid,
 
 	asm volatile("ptesync": : :"memory");
 	__tlbie_lpid_va(va, lpid, ap, ric);
-	fixup_tlbie_lpid(lpid);
+	fixup_tlbie_lpid_va(va, lpid, ap);
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
@@ -469,7 +528,6 @@ static inline void _tlbie_va_range(unsigned long start, unsigned long end,
 	if (also_pwc)
 		__tlbie_pid(pid, RIC_FLUSH_PWC);
 	__tlbie_va_range(start, end, pid, page_size, psize);
-	fixup_tlbie();
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
@@ -856,7 +914,7 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 			if (gflush)
 				__tlbie_va_range(gstart, gend, pid,
 						PUD_SIZE, MMU_PAGE_1G);
-			fixup_tlbie();
+
 			asm volatile("eieio; tlbsync; ptesync": : :"memory");
 		} else {
 			_tlbiel_va_range_multicast(mm,
-- 
2.21.0

