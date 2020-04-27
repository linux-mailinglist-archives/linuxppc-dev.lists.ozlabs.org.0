Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD011B9AB5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 10:48:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499djb2cNgzDqH2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 18:48:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499cmX1k11zDqWk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 18:06:20 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03R83akw093581; Mon, 27 Apr 2020 04:06:14 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mg15kkwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 04:06:13 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03R83vES094531;
 Mon, 27 Apr 2020 04:06:12 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mg15kkvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 04:06:12 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03R85Nvn013071;
 Mon, 27 Apr 2020 08:06:11 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 30mcu61aqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 08:06:11 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03R86Aq022348172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Apr 2020 08:06:10 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB37EC605F;
 Mon, 27 Apr 2020 08:06:10 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63483C6055;
 Mon, 27 Apr 2020 08:06:08 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.72.10])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 27 Apr 2020 08:06:08 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH 18/25] powerpc/book3s64/pkeys: Don't update SPRN_AMR when
 in kernel mode.
Date: Mon, 27 Apr 2020 13:34:59 +0530
Message-Id: <20200427080507.1626327-19-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200427080507.1626327-1-aneesh.kumar@linux.ibm.com>
References: <20200427080507.1626327-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_03:2020-04-24,
 2020-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004270067
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
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that kernel correctly store/restore userspace AMR/IAMR values, avoid
manipulating AMR and IAMR from the kernel on behalf of userspace.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kup.h | 27 +++++++++
 arch/powerpc/include/asm/pkeys.h         |  2 -
 arch/powerpc/include/asm/processor.h     |  5 --
 arch/powerpc/kernel/process.c            |  4 --
 arch/powerpc/kernel/traps.c              |  6 --
 arch/powerpc/mm/book3s64/pkeys.c         | 73 ++++--------------------
 6 files changed, 39 insertions(+), 78 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 717c2c4d3681..6a706e6fef59 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -158,6 +158,33 @@
 #include <asm/mmu.h>
 #include <asm/ptrace.h>
 
+extern u64 default_uamor;
+extern u64 default_amr;
+extern u64 default_iamr;
+
+/*
+ * For kernel thread that doesn't have thread.regs return
+ * default AMR/IAMR values.
+ */
+static inline u64 current_thread_amr(void)
+{
+	if (current->thread.regs)
+		return current->thread.regs->kuap;
+	return AMR_KUAP_BLOCKED;
+}
+
+static inline u64 current_thread_iamr(void)
+{
+	if (current->thread.regs)
+		return current->thread.regs->kuep;
+	return AMR_KUEP_BLOCKED;
+}
+
+static inline u64 read_uamor(void)
+{
+	return default_uamor;
+}
+
 static inline void kuap_restore_amr(struct pt_regs *regs, bool to_user)
 {
 	if (!mmu_has_feature(MMU_FTR_PKEY) && to_user)
diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index cd1a03044814..b1d448c53209 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -12,8 +12,6 @@
 #include <asm/firmware.h>
 
 extern int max_pkey;
-extern u64 default_uamor;
-extern u64 default_amr;
 extern u32 reserved_allocation_mask; /* bits set for reserved keys */
 
 #define ARCH_VM_PKEY_FLAGS (VM_PKEY_BIT0 | VM_PKEY_BIT1 | VM_PKEY_BIT2 | \
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index eedcbfb9a6ff..3cef707b27c7 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -234,11 +234,6 @@ struct thread_struct {
 	struct thread_vr_state ckvr_state; /* Checkpointed VR state */
 	unsigned long	ckvrsave; /* Checkpointed VRSAVE */
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
-#ifdef CONFIG_PPC_MEM_KEYS
-	unsigned long	amr;
-	unsigned long	iamr;
-	unsigned long	uamor;
-#endif
 #ifdef CONFIG_KVM_BOOK3S_32_HANDLER
 	void*		kvm_shadow_vcpu; /* KVM internal data */
 #endif /* CONFIG_KVM_BOOK3S_32_HANDLER */
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 9660bab1d99d..17f65a2738bc 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -585,7 +585,6 @@ static void save_all(struct task_struct *tsk)
 		__giveup_spe(tsk);
 
 	msr_check_and_clear(msr_all_available);
-	thread_pkey_regs_save(&tsk->thread);
 }
 
 void flush_all_to_thread(struct task_struct *tsk)
@@ -1097,8 +1096,6 @@ static inline void save_sprs(struct thread_struct *t)
 		t->tar = mfspr(SPRN_TAR);
 	}
 #endif
-
-	thread_pkey_regs_save(t);
 }
 
 static inline void restore_sprs(struct thread_struct *old_thread,
@@ -1139,7 +1136,6 @@ static inline void restore_sprs(struct thread_struct *old_thread,
 		mtspr(SPRN_TIDR, new_thread->tidr);
 #endif
 
-	thread_pkey_regs_restore(new_thread, old_thread);
 }
 
 struct task_struct *__switch_to(struct task_struct *prev,
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 3fca22276bb1..a47fb49b7af8 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -348,12 +348,6 @@ static bool exception_common(int signr, struct pt_regs *regs, int code,
 
 	current->thread.trap_nr = code;
 
-	/*
-	 * Save all the pkey registers AMR/IAMR/UAMOR. Eg: Core dumps need
-	 * to capture the content, if the task gets killed.
-	 */
-	thread_pkey_regs_save(&current->thread);
-
 	return true;
 }
 
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 42ca7aa09d5b..2484d8502499 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -21,7 +21,7 @@ int  max_pkey;			/* Maximum key value supported */
 u32  reserved_allocation_mask;
 static u32  initial_allocation_mask;   /* Bits set for the initially allocated keys */
 u64 default_amr;
-static u64 default_iamr;
+u64 default_iamr;
 /* Allow all keys to be modified by default */
 u64 default_uamor = ~0x0UL;
 /*
@@ -264,40 +264,17 @@ void pkey_mm_init(struct mm_struct *mm)
 	mm->context.execute_only_pkey = execute_only_key;
 }
 
-static inline u64 read_amr(void)
+static inline void update_current_thread_amr(u64 value)
 {
-	return mfspr(SPRN_AMR);
+	current->thread.regs->kuap = value;
 }
 
-static inline void write_amr(u64 value)
-{
-	mtspr(SPRN_AMR, value);
-}
-
-static inline u64 read_iamr(void)
-{
-	if (static_branch_unlikely(&execute_pkey_disabled))
-		return 0x0UL;
-
-	return mfspr(SPRN_IAMR);
-}
-
-static inline void write_iamr(u64 value)
+static inline void update_current_thread_iamr(u64 value)
 {
 	if (static_branch_unlikely(&execute_pkey_disabled))
 		return;
 
-	mtspr(SPRN_IAMR, value);
-}
-
-static inline u64 read_uamor(void)
-{
-	return mfspr(SPRN_UAMOR);
-}
-
-static inline void write_uamor(u64 value)
-{
-	mtspr(SPRN_UAMOR, value);
+	current->thread.regs->kuep = value;
 }
 
 static bool is_pkey_enabled(int pkey)
@@ -314,20 +291,21 @@ static bool is_pkey_enabled(int pkey)
 	return !!(uamor_pkey_bits);
 }
 
+/*  FIXME!! what happens to other threads AMR value? */
 static inline void init_amr(int pkey, u8 init_bits)
 {
 	u64 new_amr_bits = (((u64)init_bits & 0x3UL) << pkeyshift(pkey));
-	u64 old_amr = read_amr() & ~((u64)(0x3ul) << pkeyshift(pkey));
+	u64 old_amr = current_thread_amr() & ~((u64)(0x3ul) << pkeyshift(pkey));
 
-	write_amr(old_amr | new_amr_bits);
+	update_current_thread_amr(old_amr | new_amr_bits);
 }
 
 static inline void init_iamr(int pkey, u8 init_bits)
 {
 	u64 new_iamr_bits = (((u64)init_bits & 0x1UL) << pkeyshift(pkey));
-	u64 old_iamr = read_iamr() & ~((u64)(0x1ul) << pkeyshift(pkey));
+	u64 old_iamr = current_thread_iamr() & ~((u64)(0x1ul) << pkeyshift(pkey));
 
-	write_iamr(old_iamr | new_iamr_bits);
+	update_current_thread_iamr(old_iamr | new_iamr_bits);
 }
 
 /*
@@ -360,33 +338,6 @@ int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 	return 0;
 }
 
-void thread_pkey_regs_save(struct thread_struct *thread)
-{
-	if (!mmu_has_feature(MMU_FTR_PKEY))
-		return;
-
-	/*
-	 * TODO: Skip saving registers if @thread hasn't used any keys yet.
-	 */
-	thread->amr = read_amr();
-	thread->iamr = read_iamr();
-	thread->uamor = read_uamor();
-}
-
-void thread_pkey_regs_restore(struct thread_struct *new_thread,
-			      struct thread_struct *old_thread)
-{
-	if (!mmu_has_feature(MMU_FTR_PKEY))
-		return;
-
-	if (old_thread->amr != new_thread->amr)
-		write_amr(new_thread->amr);
-	if (old_thread->iamr != new_thread->iamr)
-		write_iamr(new_thread->iamr);
-	if (old_thread->uamor != new_thread->uamor)
-		write_uamor(new_thread->uamor);
-}
-
 int execute_only_pkey(struct mm_struct *mm)
 {
 	if (static_branch_likely(&execute_pkey_disabled))
@@ -440,10 +391,10 @@ static bool pkey_access_permitted(int pkey, bool write, bool execute)
 		return true;
 
 	pkey_shift = pkeyshift(pkey);
-	if (execute && !(read_iamr() & (IAMR_EX_BIT << pkey_shift)))
+	if (execute && !(current_thread_iamr() & (IAMR_EX_BIT << pkey_shift)))
 		return true;
 
-	amr = read_amr(); /* Delay reading amr until absolutely needed */
+	amr = current_thread_amr();
 	return ((!write && !(amr & (AMR_RD_BIT << pkey_shift))) ||
 		(write &&  !(amr & (AMR_WR_BIT << pkey_shift))));
 }
-- 
2.25.3

