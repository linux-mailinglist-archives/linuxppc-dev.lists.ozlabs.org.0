Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE672014B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 18:16:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pP7t397nzDr7D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 02:16:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pL6W4vTWzDrN4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 00:00:19 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JDcVJV040812; Fri, 19 Jun 2020 10:00:12 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ruk7p18s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 10:00:12 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05JDtBUL026315;
 Fri, 19 Jun 2020 14:00:11 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 31q6c6b1gy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 14:00:11 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05JE09b849938786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jun 2020 14:00:09 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 747DCBE05F;
 Fri, 19 Jun 2020 14:00:09 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 751FBBE059;
 Fri, 19 Jun 2020 14:00:07 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.220.36])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jun 2020 14:00:07 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 23/26] powerpc/book3s64/kuap: Move UAMOR setup to key init
 function
Date: Fri, 19 Jun 2020 19:28:47 +0530
Message-Id: <20200619135850.47155-24-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_11:2020-06-19,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006190096
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

UAMOR values are not application-specific. The kernel initializes
its value based on different reserved keys. Remove the thread-specific
UAMOR value and don't switch the UAMOR on context switch.

Move UAMOR initialization to key initialization code. Now that
KUAP/KUEP feature depends on PPC_MEM_KEYS, we can start to consolidate
all register initialization to keys init.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kup.h |  2 ++
 arch/powerpc/include/asm/processor.h     |  1 -
 arch/powerpc/kernel/ptrace/ptrace-view.c | 17 ++++++++----
 arch/powerpc/kernel/smp.c                |  5 ++++
 arch/powerpc/mm/book3s64/pkeys.c         | 35 ++++++++++++++----------
 5 files changed, 39 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 3a0e138d2735..942594745dfa 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -67,6 +67,8 @@
 #include <asm/mmu.h>
 #include <asm/ptrace.h>
 
+extern u64 default_uamor;
+
 static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
 {
 	if (mmu_has_feature(MMU_FTR_KUAP) && unlikely(regs->kuap != amr)) {
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 52a67835057a..6ac12168f1fe 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -237,7 +237,6 @@ struct thread_struct {
 #ifdef CONFIG_PPC_MEM_KEYS
 	unsigned long	amr;
 	unsigned long	iamr;
-	unsigned long	uamor;
 #endif
 #ifdef CONFIG_KVM_BOOK3S_32_HANDLER
 	void*		kvm_shadow_vcpu; /* KVM internal data */
diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index caeb5822a8f4..689711eb018a 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -488,14 +488,22 @@ static int pkey_active(struct task_struct *target, const struct user_regset *reg
 static int pkey_get(struct task_struct *target, const struct user_regset *regset,
 		    unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
 {
+	int ret;
+
 	BUILD_BUG_ON(TSO(amr) + sizeof(unsigned long) != TSO(iamr));
-	BUILD_BUG_ON(TSO(iamr) + sizeof(unsigned long) != TSO(uamor));
 
 	if (!arch_pkeys_enabled())
 		return -ENODEV;
 
-	return user_regset_copyout(&pos, &count, &kbuf, &ubuf, &target->thread.amr,
-				   0, ELF_NPKEY * sizeof(unsigned long));
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &target->thread.amr,
+				  0, 2 * sizeof(unsigned long));
+	if (ret)
+		goto err_out;
+
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &default_uamor,
+				  2 * sizeof(unsigned long), 3 * sizeof(unsigned long));
+err_out:
+	return ret;
 }
 
 static int pkey_set(struct task_struct *target, const struct user_regset *regset,
@@ -518,8 +526,7 @@ static int pkey_set(struct task_struct *target, const struct user_regset *regset
 		return ret;
 
 	/* UAMOR determines which bits of the AMR can be set from userspace. */
-	target->thread.amr = (new_amr & target->thread.uamor) |
-			     (target->thread.amr & ~target->thread.uamor);
+	target->thread.amr = (new_amr & default_uamor) | (target->thread.amr & ~default_uamor);
 
 	return 0;
 }
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index c820c95162ff..eec40082599f 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -59,6 +59,7 @@
 #include <asm/asm-prototypes.h>
 #include <asm/cpu_has_feature.h>
 #include <asm/ftrace.h>
+#include <asm/kup.h>
 
 #ifdef DEBUG
 #include <asm/udbg.h>
@@ -1256,6 +1257,10 @@ void start_secondary(void *unused)
 	mmgrab(&init_mm);
 	current->active_mm = &init_mm;
 
+#ifdef CONFIG_PPC_MEM_KEYS
+	mtspr(SPRN_UAMOR, default_uamor);
+#endif
+
 	smp_store_cpu_info(cpu);
 	set_dec(tb_ticks_per_jiffy);
 	preempt_disable();
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index aeecc8b8e11c..3f3593f85358 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -24,7 +24,7 @@ static u32  initial_allocation_mask;   /* Bits set for the initially allocated k
 static u64 default_amr;
 static u64 default_iamr;
 /* Allow all keys to be modified by default */
-static u64 default_uamor = ~0x0UL;
+u64 default_uamor = ~0x0UL;
 /*
  * Key used to implement PROT_EXEC mmap. Denies READ/WRITE
  * We pick key 2 because 0 is special key and 1 is reserved as per ISA.
@@ -113,8 +113,16 @@ void __init pkey_early_init_devtree(void)
 	/* scan the device tree for pkey feature */
 	pkeys_total = scan_pkey_feature();
 	if (!pkeys_total) {
-		/* No support for pkey. Mark it disabled */
-		return;
+		/*
+		 * No key support but on radix we can use key 0
+		 * to implement kuap.
+		 */
+		if (early_radix_enabled())
+			/*
+			 * Make sure userspace can't change the AMR
+			 */
+			default_uamor = 0;
+		goto err_out;
 	}
 
 	cur_cpu_spec->mmu_features |= MMU_FTR_PKEY;
@@ -197,6 +205,12 @@ void __init pkey_early_init_devtree(void)
 	initial_allocation_mask |= reserved_allocation_mask;
 
 	pr_info("Enabling Memory keys with max key count %d", max_pkey);
+err_out:
+	/*
+	 * Setup uamor on boot cpu
+	 */
+	mtspr(SPRN_UAMOR, default_uamor);
+
 	return;
 }
 
@@ -232,8 +246,9 @@ void __init setup_kuap(bool disabled)
 		cur_cpu_spec->mmu_features |= MMU_FTR_KUAP;
 	}
 
-	/* Make sure userspace can't change the AMR */
-	mtspr(SPRN_UAMOR, 0);
+	/*
+	 * Set the default kernel AMR values on all cpus.
+	 */
 	mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
 	isync();
 }
@@ -278,11 +293,6 @@ static inline u64 read_uamor(void)
 	return mfspr(SPRN_UAMOR);
 }
 
-static inline void write_uamor(u64 value)
-{
-	mtspr(SPRN_UAMOR, value);
-}
-
 static bool is_pkey_enabled(int pkey)
 {
 	u64 uamor = read_uamor();
@@ -353,7 +363,6 @@ void thread_pkey_regs_save(struct thread_struct *thread)
 	 */
 	thread->amr = read_amr();
 	thread->iamr = read_iamr();
-	thread->uamor = read_uamor();
 }
 
 void thread_pkey_regs_restore(struct thread_struct *new_thread,
@@ -366,8 +375,6 @@ void thread_pkey_regs_restore(struct thread_struct *new_thread,
 		write_amr(new_thread->amr);
 	if (old_thread->iamr != new_thread->iamr)
 		write_iamr(new_thread->iamr);
-	if (old_thread->uamor != new_thread->uamor)
-		write_uamor(new_thread->uamor);
 }
 
 void thread_pkey_regs_init(struct thread_struct *thread)
@@ -377,11 +384,9 @@ void thread_pkey_regs_init(struct thread_struct *thread)
 
 	thread->amr   = default_amr;
 	thread->iamr  = default_iamr;
-	thread->uamor = default_uamor;
 
 	write_amr(default_amr);
 	write_iamr(default_iamr);
-	write_uamor(default_uamor);
 }
 
 int execute_only_pkey(struct mm_struct *mm)
-- 
2.26.2

