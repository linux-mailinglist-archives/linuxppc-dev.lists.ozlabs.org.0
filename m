Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 891121F5289
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 12:41:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hk6k6ZhJzDqH2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 20:41:02 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hj3q2rqLzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 19:53:27 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05A9XVup011309; Wed, 10 Jun 2020 05:53:23 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31grrk14k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 05:53:22 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05A9iO4t025661;
 Wed, 10 Jun 2020 09:53:22 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 31g2sa95t3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 09:53:22 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05A9rLBs35914080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jun 2020 09:53:21 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53A29112062;
 Wed, 10 Jun 2020 09:53:21 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47147112061;
 Wed, 10 Jun 2020 09:53:19 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.180.2])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jun 2020 09:53:18 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 25/41] powerpc/book3s64/kuep: Store/restore userspace IAMR
 correctly on entry and exit from kernel
Date: Wed, 10 Jun 2020 15:21:48 +0530
Message-Id: <20200610095204.608183-26-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610095204.608183-1-aneesh.kumar@linux.ibm.com>
References: <20200610095204.608183-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-10_06:2020-06-10,
 2020-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 cotscore=-2147483648 malwarescore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 mlxscore=0 adultscore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006100073
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
 arch/powerpc/kernel/syscall_64.c         |  8 +++--
 4 files changed, 59 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 82bef3901672..f26f3fad5872 100644
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
+	 * if KUEP feature is enabled
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
index ac3970fff0d5..8e6601c984fd 100644
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
index 9b9cde07e396..37a52a3d500b 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -357,6 +357,10 @@ int main(void)
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
index fded67982fbe..8229730c6cb5 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -37,15 +37,19 @@ notrace long system_call_exception(long r3, long r4, long r5,
 
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
 		if (mmu_has_feature(MMU_FTR_KUAP))
 			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
+		if (mmu_has_feature(MMU_FTR_KUEP))
+			mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
 		isync();
 	} else
 #endif
-- 
2.26.2

