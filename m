Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6EE1C2543
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 14:26:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DpHs6P1hzDqYp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 22:26:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Dmvk6vpSzDqdm
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:23:30 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 042B1jBp111657; Sat, 2 May 2020 07:23:26 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s28dexqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 07:23:26 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 042BN8Fv005291;
 Sat, 2 May 2020 07:23:26 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s28dexqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 07:23:26 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 042BK8M8001092;
 Sat, 2 May 2020 11:23:25 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 30s0g5jyth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 11:23:25 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 042BNNGC22020582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 2 May 2020 11:23:23 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAC997805E;
 Sat,  2 May 2020 11:23:23 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54E007805C;
 Sat,  2 May 2020 11:23:21 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.52.206])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat,  2 May 2020 11:23:20 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 13/28] powerpc/book3s64/kuep: Store/restore userspace IAMR
 correctly on entry and exit from kernel
Date: Sat,  2 May 2020 16:52:14 +0530
Message-Id: <20200502112229.545331-14-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502112229.545331-1-aneesh.kumar@linux.ibm.com>
References: <20200502112229.545331-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-02_06:2020-05-01,
 2020-05-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005020095
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
 bauerman@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This prepare kernel to operate with a different value than userspace IAMR.
For this, IAMR needs to be saved and restored on entry and return from the
kernel.

If MMU_FTR_KEY is enabled we always use the key mechanism to implement KUEP
feature. If MMU_FTR_KEY is not supported and if we support MMU_FTR_KUEP
(radix translation on POWER9), we can skip restoring IAMR on return
to userspace. Userspace won't be using IAMR in that specific config.

We don't need to save/restore IAMR on reentry into the kernel due to interrupt
because the kernel doesn't modify IAMR internally.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kup.h | 46 ++++++++++++++++++++++--
 arch/powerpc/include/asm/ptrace.h        |  6 +++-
 arch/powerpc/kernel/asm-offsets.c        |  4 +++
 arch/powerpc/kernel/syscall_64.c         |  7 ++--
 4 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 82bef3901672..67320a990f3f 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -17,15 +17,26 @@
 #if defined(CONFIG_PPC_MEM_KEYS)
 	BEGIN_MMU_FTR_SECTION_NESTED(67)
 	/*
-	 * AMR is going to be different when
+	 * AMR and IAMR are going to be different when
 	 * returning to userspace.
 	 */
 	ld	\gpr1, STACK_REGS_KUAP(r1)
 	isync
 	mtspr	SPRN_AMR, \gpr1
+	/*
+	 * Restore IAMR only when returning to userspace
+	 */
+	ld	\gpr1, STACK_REGS_KUEP(r1)
+	mtspr	SPRN_IAMR, \gpr1
 
 	/* No isync required, see kuap_restore_user_amr() */
 	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_PKEY , 67)
+
+	/*
+	 * We don't check KUEP feature here, because if FTR_PKEY
+	 * is not enabled we don't need to restore IAMR on
+	 * return to usespace.
+	 */
 #endif
 .endm
 
@@ -53,6 +64,9 @@
 	isync
 	mtspr	SPRN_AMR, \gpr2
 	/* No isync required, see kuap_restore_amr() */
+	/*
+	 * No need to restore IAMR when returning to kernel space.
+	 */
 100:  // skip_restore_amr
 #endif
 .endm
@@ -90,6 +104,12 @@
 	b	100f  // skip_save_amr
 	ALT_MMU_FTR_SECTION_END_NESTED_IFSET(MMU_FTR_KUAP, 68)
 
+	/*
+	 * We don't check KUEP feature here, because if FTR_PKEY
+	 * is not enabled we don't need to save IAMR on
+	 * entry from usespace. That is handled by either
+	 * handle_kuap_save_amr or skip_save_amr
+	 */
 
 99: // handle_kuap_save_amr
 	.ifnb \msr_pr_cr
@@ -120,6 +140,25 @@
 102:
 	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 69)
 
+	.ifnb \msr_pr_cr
+	beq	\msr_pr_cr, 103f // from kernel space
+	mfspr	\gpr1, SPRN_IAMR
+	std	\gpr1, STACK_REGS_KUEP(r1)
+
+	/*
+	 * update kernel IAMR with AMR_KUEP_BLOCKED only
+	 * if KUAP feature is enabled
+	 */
+	BEGIN_MMU_FTR_SECTION_NESTED(70)
+	LOAD_REG_IMMEDIATE(\gpr2, AMR_KUEP_BLOCKED)
+	cmpd	\use_cr, \gpr1, \gpr2
+	beq	\use_cr, 103f
+	mtspr	SPRN_IAMR, \gpr2
+	isync
+103:
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUEP, 70)
+	.endif
+
 100: // skip_save_amr
 #endif
 .endm
@@ -140,13 +179,13 @@ static inline void kuap_restore_user_amr(struct pt_regs *regs)
 
 	isync();
 	mtspr(SPRN_AMR, regs->kuap);
+	mtspr(SPRN_IAMR, regs->kuep);
 	/*
 	 * No isync required here because we are about to rfi
 	 * back to previous context before any user accesses
 	 * would be made, which is a CSI.
 	 */
 }
-
 static inline void kuap_restore_kernel_amr(struct pt_regs *regs,
 					   unsigned long amr)
 {
@@ -162,6 +201,9 @@ static inline void kuap_restore_kernel_amr(struct pt_regs *regs,
 			 */
 		}
 	}
+	/*
+	 * No need to restore IAMR when returning to kernel space.
+	 */
 }
 
 static inline unsigned long kuap_get_and_check_amr(void)
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index e0195e6b892b..2bfd2b6a72ab 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -56,8 +56,12 @@ struct pt_regs
 #ifdef CONFIG_PPC_KUAP
 			unsigned long kuap;
 #endif
+#ifdef CONFIG_PPC_KUEP
+			unsigned long kuep;
+#endif
+
 		};
-		unsigned long __pad[2];	/* Maintain 16 byte interrupt stack alignment */
+		unsigned long __pad[4];	/* Maintain 16 byte interrupt stack alignment */
 	};
 };
 #endif
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index fcf24a365fc0..6c7326fc73b9 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -353,6 +353,10 @@ int main(void)
 #ifdef CONFIG_PPC_KUAP
 	STACK_PT_REGS_OFFSET(STACK_REGS_KUAP, kuap);
 #endif
+#ifdef CONFIG_PPC_KUEP
+	STACK_PT_REGS_OFFSET(STACK_REGS_KUEP, kuep);
+#endif
+
 
 #if defined(CONFIG_PPC32)
 #if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 4d417fdadb2a..faac67d04a70 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -37,14 +37,17 @@ notrace long system_call_exception(long r3, long r4, long r5,
 
 #ifdef CONFIG_PPC_MEM_KEYS
 	if (mmu_has_feature(MMU_FTR_PKEY)) {
-		unsigned long amr;
+		unsigned long amr, iamr;
 		/*
-		 * When entering from userspace we mostly have the AMR
+		 * When entering from userspace we mostly have the AMR/IAMR
 		 * different from kernel default values. Hence don't compare.
 		 */
 		amr = mfspr(SPRN_AMR);
+		iamr = mfspr(SPRN_IAMR);
 		regs->kuap = amr;
+		regs->kuep = iamr;
 		mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
+		mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
 		isync();
 	} else
 #endif
-- 
2.26.2

