Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF80A219714
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 06:10:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2N4J6P60zF13r
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 14:10:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2MBx0CSrzDqZn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 13:30:48 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06931nuZ025067; Wed, 8 Jul 2020 23:30:41 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325kgxbc8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 23:30:41 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0693FfZn021230;
 Thu, 9 Jul 2020 03:30:40 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 325k1qu5vr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 03:30:40 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0693UeGB53215520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 03:30:40 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31583B205F;
 Thu,  9 Jul 2020 03:30:40 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33D80B206A;
 Thu,  9 Jul 2020 03:30:38 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.62.107])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jul 2020 03:30:37 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 19/23] powerpc/book3s64/kuap: Move UAMOR setup to key init
 function
Date: Thu,  9 Jul 2020 08:59:42 +0530
Message-Id: <20200709032946.881753-20-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200709032946.881753-1-aneesh.kumar@linux.ibm.com>
References: <20200709032946.881753-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_19:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=2 bulkscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090019
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

Move UAMOR initialization to key initialization code and remove
thread_struct.uamor because it is not used anymore.

Before commit: 4a4a5e5d2aad ("powerpc/pkeys: key allocation/deallocation must not change pkey registers")
we used to update uamor based on key allocation and free.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pkeys.h |  2 ++
 arch/powerpc/include/asm/processor.h       |  1 -
 arch/powerpc/kernel/ptrace/ptrace-view.c   | 27 +++++++++++++++-----
 arch/powerpc/kernel/smp.c                  |  1 +
 arch/powerpc/mm/book3s64/hash_utils.c      |  4 +++
 arch/powerpc/mm/book3s64/pkeys.c           | 29 +++++++++-------------
 arch/powerpc/mm/book3s64/radix_pgtable.c   |  4 +++
 7 files changed, 44 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pkeys.h b/arch/powerpc/include/asm/book3s/64/pkeys.h
index 5b178139f3c0..b7d9f4267bcd 100644
--- a/arch/powerpc/include/asm/book3s/64/pkeys.h
+++ b/arch/powerpc/include/asm/book3s/64/pkeys.h
@@ -5,6 +5,8 @@
 
 #include <asm/book3s/64/hash-pkey.h>
 
+extern u64 __ro_after_init default_uamor;
+
 static inline u64 vmflag_to_pte_pkey_bits(u64 vm_flags)
 {
 	if (!mmu_has_feature(MMU_FTR_PKEY))
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
index caeb5822a8f4..ac7d480cb9c1 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -488,14 +488,21 @@ static int pkey_active(struct task_struct *target, const struct user_regset *reg
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
+		return ret;
+
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &default_uamor,
+				  2 * sizeof(unsigned long), 3 * sizeof(unsigned long));
+	return ret;
 }
 
 static int pkey_set(struct task_struct *target, const struct user_regset *regset,
@@ -517,9 +524,17 @@ static int pkey_set(struct task_struct *target, const struct user_regset *regset
 	if (ret)
 		return ret;
 
-	/* UAMOR determines which bits of the AMR can be set from userspace. */
-	target->thread.amr = (new_amr & target->thread.uamor) |
-			     (target->thread.amr & ~target->thread.uamor);
+	/*
+	 * UAMOR determines which bits of the AMR can be set from userspace.
+	 * UAMOR value 0b11 indicates that the AMR value can be modified
+	 * from userspace. If the kernel is using a specific key, we avoid
+	 * userspace modifying the AMR value for that key by masking them
+	 * via UAMOR 0b00.
+	 *
+	 * Pick the AMR values for the keys that kernel is using. This
+	 * will be indicated by the ~default_uamor bits.
+	 */
+	target->thread.amr = (new_amr & default_uamor) | (target->thread.amr & ~default_uamor);
 
 	return 0;
 }
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 73199470c265..8261999c7d52 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -59,6 +59,7 @@
 #include <asm/asm-prototypes.h>
 #include <asm/cpu_has_feature.h>
 #include <asm/ftrace.h>
+#include <asm/kup.h>
 
 #ifdef DEBUG
 #include <asm/udbg.h>
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index eec6f4e5e481..9dfb0ceed5e3 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1110,6 +1110,10 @@ void hash__early_init_mmu_secondary(void)
 	if (cpu_has_feature(CPU_FTR_ARCH_206)
 			&& cpu_has_feature(CPU_FTR_HVMODE))
 		tlbiel_all();
+
+#ifdef CONFIG_PPC_MEM_KEYS
+	mtspr(SPRN_UAMOR, default_uamor);
+#endif
 }
 #endif /* CONFIG_SMP */
 
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index c682eefd3fc1..480ae31fad52 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -27,9 +27,7 @@ static u32 initial_allocation_mask __ro_after_init;
  */
 static u64 default_amr = ~0x0UL;
 static u64 default_iamr = 0x5555555555555555UL;
-
-/* Allow all keys to be modified by default */
-static u64 default_uamor = ~0x0UL;
+u64 default_uamor __ro_after_init;
 /*
  * Key used to implement PROT_EXEC mmap. Denies READ/WRITE
  * We pick key 2 because 0 is special key and 1 is reserved as per ISA.
@@ -122,10 +120,11 @@ void __init pkey_early_init_devtree(void)
 
 	/* scan the device tree for pkey feature */
 	pkeys_total = scan_pkey_feature();
-	if (!pkeys_total) {
-		/* No support for pkey. Mark it disabled */
-		return;
-	}
+	if (!pkeys_total)
+		goto out;
+
+	/* Allow all keys to be modified by default */
+	default_uamor = ~0x0UL;
 
 	cur_cpu_spec->mmu_features |= MMU_FTR_PKEY;
 
@@ -209,6 +208,12 @@ void __init pkey_early_init_devtree(void)
 	initial_allocation_mask |= reserved_allocation_mask;
 
 	pr_info("Enabling pkeys with max key count %d\n", num_pkey);
+out:
+	/*
+	 * Setup uamor on boot cpu
+	 */
+	mtspr(SPRN_UAMOR, default_uamor);
+
 	return;
 }
 
@@ -251,11 +256,6 @@ static inline u64 read_uamor(void)
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
@@ -326,7 +326,6 @@ void thread_pkey_regs_save(struct thread_struct *thread)
 	 */
 	thread->amr = read_amr();
 	thread->iamr = read_iamr();
-	thread->uamor = read_uamor();
 }
 
 void thread_pkey_regs_restore(struct thread_struct *new_thread,
@@ -339,8 +338,6 @@ void thread_pkey_regs_restore(struct thread_struct *new_thread,
 		write_amr(new_thread->amr);
 	if (old_thread->iamr != new_thread->iamr)
 		write_iamr(new_thread->iamr);
-	if (old_thread->uamor != new_thread->uamor)
-		write_uamor(new_thread->uamor);
 }
 
 void thread_pkey_regs_init(struct thread_struct *thread)
@@ -350,11 +347,9 @@ void thread_pkey_regs_init(struct thread_struct *thread)
 
 	thread->amr   = default_amr;
 	thread->iamr  = default_iamr;
-	thread->uamor = default_uamor;
 
 	write_amr(default_amr);
 	write_iamr(default_iamr);
-	write_uamor(default_uamor);
 }
 
 int execute_only_pkey(struct mm_struct *mm)
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 6d814c9bb4bf..ed24ba56d78a 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -546,6 +546,10 @@ void setup_kuap(bool disabled)
 
 	/* Make sure userspace can't change the AMR */
 	mtspr(SPRN_UAMOR, 0);
+
+	/*
+	 * Set the default kernel AMR values on all cpus.
+	 */
 	mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
 	isync();
 }
-- 
2.26.2

