Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 202421B9A70
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 10:40:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499dXN0Xb4zDqBt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 18:40:52 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 499cmG0WhRzDqTy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 18:06:05 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03R82K7d076425; Mon, 27 Apr 2020 04:06:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mh9m38jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 04:06:02 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03R84Jxg088320;
 Mon, 27 Apr 2020 04:06:01 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mh9m38hm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 04:06:01 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03R85NIX002867;
 Mon, 27 Apr 2020 08:06:00 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 30mcu6h9up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 08:06:00 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03R85xqk46334238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Apr 2020 08:05:59 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 680E1C6057;
 Mon, 27 Apr 2020 08:05:59 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67059C6059;
 Mon, 27 Apr 2020 08:05:57 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.72.10])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 27 Apr 2020 08:05:57 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH 14/25] powerpc/book3s64/kuep: Store/restore userspace IAMR
 correctly on entry and exit from kernel
Date: Mon, 27 Apr 2020 13:34:55 +0530
Message-Id: <20200427080507.1626327-15-aneesh.kumar@linux.ibm.com>
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
 clxscore=1015 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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
 arch/powerpc/include/asm/book3s/64/kup.h | 51 +++++++++++++++++++++++-
 arch/powerpc/include/asm/ptrace.h        |  6 ++-
 arch/powerpc/kernel/asm-offsets.c        |  4 ++
 arch/powerpc/kernel/syscall_64.c         |  5 ++-
 4 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 85645d1b7102..717c2c4d3681 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -25,6 +25,13 @@
 	b	100f  // skip_restore_amr
 	ALT_MMU_FTR_SECTION_END_NESTED_IFSET(MMU_FTR_KUAP, 68)
 
+	/*
+	 * We don't check KUEP feature here, because if FTR_PKEY
+	 * is not enabled we don't need to restore IAMR on
+	 * return to usespace. That is handled by either
+	 * handle_kuap_restore_amr or skip_restore_amr
+	 */
+
 99:  // handle_kuap_restore_amr
 	/*
 	 * No key support, don't bother to restore AMR
@@ -37,7 +44,17 @@
 	ld	\gpr, STACK_REGS_KUAP(r1)
 	isync
 	mtspr	SPRN_AMR, \gpr
-	/*  No isync here because we will return to a different context  */
+
+	/*
+	 * Restore IAMR only when returning to userspace
+	 */
+	.ifnb \to_user
+	ld	\gpr, STACK_REGS_KUEP(r1)
+	mtspr	SPRN_IAMR, \gpr
+	.endif
+	/*
+	 * No isync here because we will return to a different context
+	 */
 100:  // skip_restore_amr
 #endif
 .endm
@@ -75,6 +92,12 @@
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
@@ -103,7 +126,26 @@
 	mtspr	SPRN_AMR, \gpr2
 	isync
 102:
-        END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 69)
+	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 69)
+
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
+        END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUEP, 70)
+	.endif
 
 100: // skip_save_amr
 #endif
@@ -129,6 +171,11 @@ static inline void kuap_restore_amr(struct pt_regs *regs, bool to_user)
 		 * returning to a different context using rfid
 		 */
 	}
+	/*
+	 * We do support FTR_PKEY, restore IAMR when returning to user
+	 */
+	if (to_user)
+		mtspr(SPRN_IAMR, regs->kuep);
 }
 
 static inline void kuap_check_amr(void)
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
index f69b4774f3b3..458f2bb80c6d 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -36,11 +36,14 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	BUG_ON(regs->softe != IRQS_ENABLED);
 
 	if (mmu_has_feature(MMU_FTR_PKEY)) {
-		unsigned long amr;
+		unsigned long amr, iamr;
 
 		amr = mfspr(SPRN_AMR);
+		iamr = mfspr(SPRN_IAMR);
 		regs->kuap = amr;
+		regs->kuep = iamr;
 		mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
+		mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
 		isync();
 	} else
 		kuap_check_amr();
-- 
2.25.3

