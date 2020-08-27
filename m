Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0074253CC9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 06:38:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcVNV6LwyzDqLV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 14:38:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lnlsQ12L; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcTmF4lGNzDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 14:10:37 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R41irj006965; Thu, 27 Aug 2020 00:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+jUgve7MNp5hn04DMWX3lvBTXcQ/IgMNnyDBYz0PaI4=;
 b=lnlsQ12LzauDH93ucsH/KG2OP/xt2qrJ0bNe3JEsVMq7g0j968VyiUWIlNsmkzPZpoQC
 JuO/do5s8XGFRZATp8Z1TYIEVdPTseQ6UYhiFmZTzuaB8S4HEhDrw5oKLx8b0PKzltn0
 WMducSTvCMqILdb+Xh6tazpVhHxxq8pWjWP8fNs6wf4+MVLmVgtEPV7qnh7fPRtG4xBU
 q6ZrTqirdDAgbgFy1q/XtdHyTJhH1t9DLaMBfapHFSgTq350GZEfGdmZBwiCuNxE14Eo
 vJxt/mXZbgTtALI7AQvoqewjtv5FVKQUIVC6hyLOo2a+Q0yx3jcfb9exAB2d8RUc6mf7 lQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3365b28agg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 00:10:31 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R46xen018308;
 Thu, 27 Aug 2020 04:10:30 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 332ujey3kj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 04:10:30 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R4AUYg40042878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 04:10:30 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B00D28059;
 Thu, 27 Aug 2020 04:10:30 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA29428058;
 Thu, 27 Aug 2020 04:10:28 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.74.195])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 04:10:28 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 15/23] powerpc/book3s64/pkeys: Don't update SPRN_AMR when
 in kernel mode.
Date: Thu, 27 Aug 2020 09:39:23 +0530
Message-Id: <20200827040931.297759-16-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
References: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_14:2020-08-26,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=991
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008270028
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that kernel correctly store/restore userspace AMR/IAMR values, avoid
manipulating AMR and IAMR from the kernel on behalf of userspace.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kup.h | 18 ++++++++
 arch/powerpc/include/asm/processor.h     |  4 --
 arch/powerpc/kernel/process.c            |  4 --
 arch/powerpc/kernel/traps.c              |  6 ---
 arch/powerpc/mm/book3s64/pkeys.c         | 57 +++++-------------------
 5 files changed, 28 insertions(+), 61 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 3f5b97b2a3d8..4e1d666032f6 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -171,6 +171,24 @@
 #include <asm/mmu.h>
 #include <asm/ptrace.h>
 
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
 static inline void kuap_restore_user_amr(struct pt_regs *regs)
 {
 	if (!mmu_has_feature(MMU_FTR_PKEY))
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index ed0d633ab5aa..8adf44a7e54f 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -234,10 +234,6 @@ struct thread_struct {
 	struct thread_vr_state ckvr_state; /* Checkpointed VR state */
 	unsigned long	ckvrsave; /* Checkpointed VRSAVE */
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
-#ifdef CONFIG_PPC_MEM_KEYS
-	unsigned long	amr;
-	unsigned long	iamr;
-#endif
 #ifdef CONFIG_KVM_BOOK3S_32_HANDLER
 	void*		kvm_shadow_vcpu; /* KVM internal data */
 #endif /* CONFIG_KVM_BOOK3S_32_HANDLER */
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 75fd30e023bd..c8f57afba3a0 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -603,7 +603,6 @@ static void save_all(struct task_struct *tsk)
 		__giveup_spe(tsk);
 
 	msr_check_and_clear(msr_all_available);
-	thread_pkey_regs_save(&tsk->thread);
 }
 
 void flush_all_to_thread(struct task_struct *tsk)
@@ -1127,8 +1126,6 @@ static inline void save_sprs(struct thread_struct *t)
 		t->tar = mfspr(SPRN_TAR);
 	}
 #endif
-
-	thread_pkey_regs_save(t);
 }
 
 static inline void restore_sprs(struct thread_struct *old_thread,
@@ -1169,7 +1166,6 @@ static inline void restore_sprs(struct thread_struct *old_thread,
 		mtspr(SPRN_TIDR, new_thread->tidr);
 #endif
 
-	thread_pkey_regs_restore(new_thread, old_thread);
 }
 
 struct task_struct *__switch_to(struct task_struct *prev,
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index d1ebe152f210..5bda54454a2d 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -347,12 +347,6 @@ static bool exception_common(int signr, struct pt_regs *regs, int code,
 
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
index f47d11f2743d..391230f93da2 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -273,30 +273,17 @@ void __init setup_kuap(bool disabled)
 }
 #endif
 
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
-	if (!likely(pkey_execute_disable_supported))
-		return 0x0UL;
-
-	return mfspr(SPRN_IAMR);
-}
-
-static inline void write_iamr(u64 value)
+static inline void update_current_thread_iamr(u64 value)
 {
 	if (!likely(pkey_execute_disable_supported))
 		return;
 
-	mtspr(SPRN_IAMR, value);
+	current->thread.regs->kuep = value;
 }
 
 #ifdef CONFIG_PPC_MEM_KEYS
@@ -311,17 +298,17 @@ void pkey_mm_init(struct mm_struct *mm)
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
@@ -364,30 +351,6 @@ int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
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
-}
-
 int execute_only_pkey(struct mm_struct *mm)
 {
 	return mm->context.execute_only_pkey;
@@ -436,9 +399,9 @@ static bool pkey_access_permitted(int pkey, bool write, bool execute)
 
 	pkey_shift = pkeyshift(pkey);
 	if (execute)
-		return !(read_iamr() & (IAMR_EX_BIT << pkey_shift));
+		return !(current_thread_iamr() & (IAMR_EX_BIT << pkey_shift));
 
-	amr = read_amr();
+	amr = current_thread_amr();
 	if (write)
 		return !(amr & (AMR_WR_BIT << pkey_shift));
 
-- 
2.26.2

