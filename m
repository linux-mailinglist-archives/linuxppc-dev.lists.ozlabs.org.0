Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F16CE2C38D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 06:44:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgqb55R2rzDqqJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 16:44:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QPrZl/fA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgpzx1jKDzDqVs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 16:17:33 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AP52Ubn155178; Wed, 25 Nov 2020 00:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gUQVP/iRO4U8xcZXHSdRZiq45yp2gzvj/qbbYktoOAY=;
 b=QPrZl/fALXp0IQ/hK5Uk1ybIb1Shl0TpoC4HNCSj9zRLeZxYdD8vwyTMC0/BggXuUdgx
 D2Qej7IEA5ZHjhJpeIWWXTpJ6buAie9ya3AXQgGXRMWAh8wxthIfwh+F6mjXlhXYM+Vz
 HRkHk411qb1rSOiexyjI5OH8oNTPLovHo43Y+vSYlzK6c3VRwLJEfPFquO2Zq7iSsF5n
 aFMxao0gm+Cg8S8NGAP3QaA7m3WAmUusFV2EfBIfHgk78kWHzeSBPirbcyqzguR32VNc
 fQwiaSC66Vna5oRtDcaRMt3qiWi7WIlwk+p7HsBNXP1FbPGBVv0oIoYUc/Lx8tOahwwn cA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34yghsv28y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 00:17:28 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AP5COS7003276;
 Wed, 25 Nov 2020 05:17:27 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 34xth94uw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 05:17:27 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AP5HQQr7930416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 05:17:26 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF181124052;
 Wed, 25 Nov 2020 05:17:26 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9385D124055;
 Wed, 25 Nov 2020 05:17:24 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.77.195.3])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 05:17:24 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 14/22] powerpc/book3s64/pkeys: Don't update SPRN_AMR when
 in kernel mode.
Date: Wed, 25 Nov 2020 10:46:26 +0530
Message-Id: <20201125051634.509286-15-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_07:2020-11-24,
 2020-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240121
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
 Sandipan Das <sandipan@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that kernel correctly store/restore userspace AMR/IAMR values, avoid
manipulating AMR and IAMR from the kernel on behalf of userspace.

Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kup.h | 21 +++++++++
 arch/powerpc/include/asm/processor.h     |  4 --
 arch/powerpc/kernel/process.c            |  4 --
 arch/powerpc/kernel/traps.c              |  6 ---
 arch/powerpc/mm/book3s64/pkeys.c         | 57 +++++-------------------
 5 files changed, 31 insertions(+), 61 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 4dbb2d53fd8f..47270596215b 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -175,6 +175,27 @@ DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
 #include <asm/mmu.h>
 #include <asm/ptrace.h>
 
+/*
+ * For kernel thread that doesn't have thread.regs return
+ * default AMR/IAMR values.
+ */
+static inline u64 current_thread_amr(void)
+{
+	if (current->thread.regs)
+		return current->thread.regs->amr;
+	return AMR_KUAP_BLOCKED;
+}
+
+static inline u64 current_thread_iamr(void)
+{
+	if (current->thread.regs)
+		return current->thread.regs->iamr;
+	return AMR_KUEP_BLOCKED;
+}
+#endif /* CONFIG_PPC_PKEY */
+
+#ifdef CONFIG_PPC_KUAP
+
 static inline void kuap_restore_user_amr(struct pt_regs *regs)
 {
 	if (!mmu_has_feature(MMU_FTR_PKEY))
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index c61c859b51a8..c3df3a420c92 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -230,10 +230,6 @@ struct thread_struct {
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
index 98f7e9ec766f..5ffdac46a187 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -589,7 +589,6 @@ static void save_all(struct task_struct *tsk)
 		__giveup_spe(tsk);
 
 	msr_check_and_clear(msr_all_available);
-	thread_pkey_regs_save(&tsk->thread);
 }
 
 void flush_all_to_thread(struct task_struct *tsk)
@@ -1160,8 +1159,6 @@ static inline void save_sprs(struct thread_struct *t)
 		t->tar = mfspr(SPRN_TAR);
 	}
 #endif
-
-	thread_pkey_regs_save(t);
 }
 
 static inline void restore_sprs(struct thread_struct *old_thread,
@@ -1202,7 +1199,6 @@ static inline void restore_sprs(struct thread_struct *old_thread,
 		mtspr(SPRN_TIDR, new_thread->tidr);
 #endif
 
-	thread_pkey_regs_restore(new_thread, old_thread);
 }
 
 struct task_struct *__switch_to(struct task_struct *prev,
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 5006dcbe1d9f..419028d53fd6 100644
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
index f47d11f2743d..f747d66cc87d 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -273,30 +273,17 @@ void __init setup_kuap(bool disabled)
 }
 #endif
 
-static inline u64 read_amr(void)
+static inline void update_current_thread_amr(u64 value)
 {
-	return mfspr(SPRN_AMR);
+	current->thread.regs->amr = value;
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
+	current->thread.regs->iamr = value;
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
2.28.0

