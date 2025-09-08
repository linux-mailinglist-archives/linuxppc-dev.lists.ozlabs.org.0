Return-Path: <linuxppc-dev+bounces-11892-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6836B49B6F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 23:04:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLKG74l2rz30RJ;
	Tue,  9 Sep 2025 07:04:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757365487;
	cv=none; b=aqOwKedWmyCMoYoN2pYRRf1I3+DRZAp4SpaSrJF2/FIi4WmB4ncuTAH/98rqB/HveHl+mak7y4vKgfkYUGcdcNQvam257FbHtw3HQvmEdeq3/FeNfKe67lpHek0XzT4Zv3QcGGpxR4RZlpIFHQ8MJXJlbAxRCaoIv3N5qsz+qbql2H5AokNt/REBAZg/oXF8H/AdQHpYpUO5Iwf1R0TVpOGBHLTMRayQRgpujbO2R/3l7ZnTBnUyY50flrpAATfnXS+w9AcLQ6pl4U7mHJHYCN9Q56QVjOJ5ooePm5KXlAirntIKzhQnE2EcPe9hQQ279pvRliOA5WKL6eLJI2CMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757365487; c=relaxed/relaxed;
	bh=wnAGceY0Q/IwJtGAqo/3Lwiwww9USssIofTi1AyKsIY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jw2gkNKZcBGe+TdoIMhdvpoR2SfRAXwHYmk+XLqf4AURamPTxckdz0EIcB5NDQoi4cVCc7DFGu2yasolT8B13Bd0ETRSZsaubiccPCPDnY85bDgqHh1rsJPqWQ00Q9uW/AA8bkrMwDhlZhGOFZA1tpDIX/zUBQWHbVjvqP100UmXyEoffH0sAijEveCs6J34K4ef/Rx5J7JFrsMc+A7a8piYApisHuzkzFWnSV6eYZC+D9OovOcoYyQnoEiHJEHtBgCIrgpndMYJTUEmRPxvZj98EMI+HpfchCqYiKLucwDYniky/oUupnX5iwvina8WOPoyG3W/m5UbKTA86iiK5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EkSh9n2E; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EkSh9n2E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLKG65tFDz30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 07:04:46 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588FBbiu021177;
	Mon, 8 Sep 2025 21:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=wnAGceY0Q/IwJtGAq
	o/3Lwiwww9USssIofTi1AyKsIY=; b=EkSh9n2EwSpBUrMd3/CqmkTuSlQW70eVB
	zk5aj7H96jtdCqF+YUJ+rB6FdcGw02c4pYSDzZUdyLSzq0ZSOjOVbIUKX+GeCnrT
	aHN4TL5ZBGknHflZwt5vqwNPYNWFlMboEM5xQoxL6iGN6G3cplXTqXs5DWccRuuV
	7jjsXbxo+TDvYmtRxfBsvF2Vdy7huXJSCQIWsCKWKT4CL5xpMpUYqsqsWlGbnxvs
	q0f1hVViJdDgntEFz2B1WNWn92CiQC22SIjaFJVyRRqrDRE7r3b8KQmX8fDktiv3
	09Gv9eRNV5h+nsPIeEB7Ahk9QURn/7ekQay/DllEcU92whjQcx/Lw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcsksum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:04:20 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 588L4D0e017639;
	Mon, 8 Sep 2025 21:04:20 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcsksuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:04:19 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 588KQD5R020495;
	Mon, 8 Sep 2025 21:04:19 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 490yp0r36y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:04:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 588L4Exh31129906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Sep 2025 21:04:14 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9F4A20049;
	Mon,  8 Sep 2025 21:04:14 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E338420040;
	Mon,  8 Sep 2025 21:04:06 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com.com (unknown [9.39.29.251])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Sep 2025 21:04:06 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        deller@gmx.de, ldv@strace.io, macro@orcam.me.uk, charlie@rivosinc.com,
        akpm@linux-foundation.org, bigeasy@linutronix.de,
        ankur.a.arora@oracle.com, sshegde@linux.ibm.com, naveen@kernel.org,
        thomas.weissschuh@linutronix.de, Jason@zx2c4.com, peterz@infradead.org,
        tglx@linutronix.de, namcao@linutronix.de, kan.liang@linux.intel.com,
        mingo@kernel.org, oliver.upton@linux.dev, mark.barnett@arm.com,
        atrajeev@linux.vnet.ibm.com, rppt@kernel.org, coltonlewis@google.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC V2 3/8] powerpc: introduce arch_enter_from_user_mode
Date: Tue,  9 Sep 2025 02:32:31 +0530
Message-ID: <20250908210235.137300-5-mchauras@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908210235.137300-2-mchauras@linux.ibm.com>
References: <20250908210235.137300-2-mchauras@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfX/okvS8um5doc
 f6ex77ml23LL3HK2/kO8Z4Ii6t2aE7E0TK4mhNKWw+l3jUIWL93NijhSlkxa8EIdGgFAoN4/zjc
 Foy74kmhDs+G9JOzmMunqSxMhgqQDAno+pLDjVUccXmMMq13iLD2rc1JN5XZtexJlviTFw+2xnk
 PQjb6j17TI5vf0PrvZWJqFHU5nNs5WaUYj1C9YkJi1/HdOf/avhB5Q+NfkEipqFJc1hqFo2u+Vd
 9zYSLyTld7CCl69HRvjAqaY7E0C/iOKi6V52c7ZtKoNmB3zuMO5unPB15grln7B29u2vT0gXRAM
 6EX7kx0O1kV1dI62dnM6CX82W4HIRaTxgaedKYvCY5SjjhhHnBWhDajFh1A6EVs3sbA7ZRbBeO8
 s6GgMJPD
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68bf44d4 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=_bLvTq7iIsdV134y72cA:9
X-Proofpoint-GUID: sl51tC8nna07i3ZnbQptd-o3AIfEGb7a
X-Proofpoint-ORIG-GUID: Khy0z-eh1A2eIlIonVaNbcHPHmo4L6Wj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

- Implement the hook arch_enter_from_user_mode for syscall entry.
- Move booke_load_dbcr0 from interrupt.c to interrupt.h

No functional change intended.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/include/asm/entry-common.h | 96 +++++++++++++++++++++++++
 arch/powerpc/include/asm/interrupt.h    | 23 ++++++
 arch/powerpc/kernel/interrupt.c         | 22 ------
 3 files changed, 119 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
index 3af16d821d07e..49607292bf5a5 100644
--- a/arch/powerpc/include/asm/entry-common.h
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -5,7 +5,103 @@
 
 #ifdef CONFIG_GENERIC_IRQ_ENTRY
 
+#include <asm/cputime.h>
+#include <asm/interrupt.h>
 #include <asm/stacktrace.h>
+#include <asm/tm.h>
+
+static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
+{
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
+
+	BUG_ON(regs_is_unrecoverable(regs));
+	BUG_ON(!user_mode(regs));
+	BUG_ON(regs_irqs_disabled(regs));
+
+#ifdef CONFIG_PPC_PKEY
+	if (mmu_has_feature(MMU_FTR_PKEY)) {
+		unsigned long amr, iamr;
+		bool flush_needed = false;
+		/*
+		 * When entering from userspace we mostly have the AMR/IAMR
+		 * different from kernel default values. Hence don't compare.
+		 */
+		amr = mfspr(SPRN_AMR);
+		iamr = mfspr(SPRN_IAMR);
+		regs->amr  = amr;
+		regs->iamr = iamr;
+		if (mmu_has_feature(MMU_FTR_KUAP)) {
+			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
+			flush_needed = true;
+		}
+		if (mmu_has_feature(MMU_FTR_BOOK3S_KUEP)) {
+			mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
+			flush_needed = true;
+		}
+		if (flush_needed)
+			isync();
+	} else
+#endif
+		kuap_assert_locked();
+
+	booke_restore_dbcr0();
+
+	account_cpu_user_entry();
+
+	account_stolen_time();
+
+	/*
+	 * This is not required for the syscall exit path, but makes the
+	 * stack frame look nicer. If this was initialised in the first stack
+	 * frame, or if the unwinder was taught the first stack frame always
+	 * returns to user with IRQS_ENABLED, this store could be avoided!
+	 */
+	irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
+
+	/*
+	 * If system call is called with TM active, set _TIF_RESTOREALL to
+	 * prevent RFSCV being used to return to userspace, because POWER9
+	 * TM implementation has problems with this instruction returning to
+	 * transactional state. Final register values are not relevant because
+	 * the transaction will be aborted upon return anyway. Or in the case
+	 * of unsupported_scv SIGILL fault, the return state does not much
+	 * matter because it's an edge case.
+	 */
+	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
+			unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
+		set_bits(_TIF_RESTOREALL, &current_thread_info()->flags);
+
+	/*
+	 * If the system call was made with a transaction active, doom it and
+	 * return without performing the system call. Unless it was an
+	 * unsupported scv vector, in which case it's treated like an illegal
+	 * instruction.
+	 */
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	if (unlikely(MSR_TM_TRANSACTIONAL(regs->msr)) &&
+	    !trap_is_unsupported_scv(regs)) {
+		/* Enable TM in the kernel, and disable EE (for scv) */
+		hard_irq_disable();
+		mtmsr(mfmsr() | MSR_TM);
+
+		/* tabort, this dooms the transaction, nothing else */
+		asm volatile(".long 0x7c00071d | ((%0) << 16)"
+				:: "r"(TM_CAUSE_SYSCALL|TM_CAUSE_PERSISTENT));
+
+		/*
+		 * Userspace will never see the return value. Execution will
+		 * resume after the tbegin. of the aborted transaction with the
+		 * checkpointed register state. A context switch could occur
+		 * or signal delivered to the process before resuming the
+		 * doomed transaction context, but that should all be handled
+		 * as expected.
+		 */
+		return;
+	}
+#endif // CONFIG_PPC_TRANSACTIONAL_MEM
+}
+#define arch_enter_from_user_mode arch_enter_from_user_mode
 
 #endif /* CONFIG_GENERIC_IRQ_ENTRY */
 #endif /* _ASM_PPC_ENTRY_COMMON_H */
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 56bc8113b8cde..6edf064a0fea2 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -138,6 +138,29 @@ static inline void nap_adjust_return(struct pt_regs *regs)
 #endif
 }
 
+static inline void booke_load_dbcr0(void)
+{
+#ifdef CONFIG_PPC_ADV_DEBUG_REGS
+       unsigned long dbcr0 = current->thread.debug.dbcr0;
+
+       if (likely(!(dbcr0 & DBCR0_IDM)))
+               return;
+
+       /*
+        * Check to see if the dbcr0 register is set up to debug.
+        * Use the internal debug mode bit to do this.
+        */
+       mtmsr(mfmsr() & ~MSR_DE);
+       if (IS_ENABLED(CONFIG_PPC32)) {
+               isync();
+               global_dbcr0[smp_processor_id()] = mfspr(SPRN_DBCR0);
+       }
+       mtspr(SPRN_DBCR0, dbcr0);
+       mtspr(SPRN_DBSR, -1);
+#endif
+}
+
+
 static inline void booke_restore_dbcr0(void)
 {
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 0d8fd47049a19..2a09ac5dabd62 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -78,28 +78,6 @@ static notrace __always_inline bool prep_irq_for_enabled_exit(bool restartable)
 	return true;
 }
 
-static notrace void booke_load_dbcr0(void)
-{
-#ifdef CONFIG_PPC_ADV_DEBUG_REGS
-	unsigned long dbcr0 = current->thread.debug.dbcr0;
-
-	if (likely(!(dbcr0 & DBCR0_IDM)))
-		return;
-
-	/*
-	 * Check to see if the dbcr0 register is set up to debug.
-	 * Use the internal debug mode bit to do this.
-	 */
-	mtmsr(mfmsr() & ~MSR_DE);
-	if (IS_ENABLED(CONFIG_PPC32)) {
-		isync();
-		global_dbcr0[smp_processor_id()] = mfspr(SPRN_DBCR0);
-	}
-	mtspr(SPRN_DBCR0, dbcr0);
-	mtspr(SPRN_DBSR, -1);
-#endif
-}
-
 static notrace void check_return_regs_valid(struct pt_regs *regs)
 {
 #ifdef CONFIG_PPC_BOOK3S_64
-- 
2.51.0


