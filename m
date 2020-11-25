Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 596AD2C38E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 06:58:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgqvF3xKzzDqLh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 16:58:33 +1100 (AEDT)
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
 header.s=pp1 header.b=jTE74DFf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgq0L5zNTzDqPk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 16:17:54 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AP52AaW108120; Wed, 25 Nov 2020 00:17:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2ekZVX0kBzOT6b78sWmVZmQJGNHE/zVNCvN428LHGSE=;
 b=jTE74DFfam6K66TvgGnNM/fAPJaTgQ8kF7Sssf6Pct66lDpjOoJ26dfaGT/W9ucmsI+s
 Fa+AloJYcWsK/y0rt1Jhc7oL5bx+T57Q73FWfdYdLm1v8XhkLFgndSojWN0MQO3dryU1
 Msa4GdVCiQZSps0kESyPOerM8KNPaij+VznRXeLRwl5Q4Pvqf19XlTTd4w9+Gp0emgGI
 LZkbPkVOn2xcClaHqn1/N9ERvtOTFKrCWQwq6pVtamDbDuqidbwhaZcWFcS7SiVEmv+h
 65DI51GrfppqEb+cQmpsqbl+Y1moy44Sv1xMVRpvyo0E41z37ZL7Ue6pCLmCHnyfGMxJ cA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351dd3mxwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 00:17:50 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AP5DUVq011559;
 Wed, 25 Nov 2020 05:17:49 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 35192ubcng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 05:17:49 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AP5HnMb7013116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 05:17:49 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A0C9124053;
 Wed, 25 Nov 2020 05:17:49 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0553124052;
 Wed, 25 Nov 2020 05:17:46 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.77.195.3])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 05:17:46 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 22/22] powerpc/book3s64/pkeys: Optimize FTR_KUAP and
 FTR_KUEP disabled case
Date: Wed, 25 Nov 2020 10:46:34 +0530
Message-Id: <20201125051634.509286-23-aneesh.kumar@linux.ibm.com>
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
 mlxscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If FTR_KUAP is disabled kernel will continue to run with the same AMR
value with which it was entered. Hence there is a high chance that
we can return without restoring the AMR value. This also helps the case
when applications are not using the pkey feature. In this case, different
applications will have the same AMR values and hence we can avoid restoring
AMR in this case too.

Also avoid isync() if not really needed.

Do the same for IAMR.

null-syscall benchmark results:

With smap/smep disabled:
Without patch:
	957.95 ns    2778.17 cycles
With patch:
	858.38 ns    2489.30 cycles

With smap/smep enabled:
Without patch:
	1017.26 ns    2950.36 cycles
With patch:
	1021.51 ns    2962.44 cycles

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kup.h | 61 +++++++++++++++++++++---
 arch/powerpc/kernel/entry_64.S           |  2 +-
 arch/powerpc/kernel/syscall_64.c         | 12 +++--
 3 files changed, 65 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 7026d1b5d0c6..e063e439b0a8 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -12,28 +12,54 @@
 
 #ifdef __ASSEMBLY__
 
-.macro kuap_restore_user_amr gpr1
+.macro kuap_restore_user_amr gpr1, gpr2
 #if defined(CONFIG_PPC_PKEY)
 	BEGIN_MMU_FTR_SECTION_NESTED(67)
+	b	100f  // skip_restore_amr
+	END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_PKEY, 67)
 	/*
 	 * AMR and IAMR are going to be different when
 	 * returning to userspace.
 	 */
 	ld	\gpr1, STACK_REGS_AMR(r1)
+
+	/*
+	 * If kuap feature is not enabled, do the mtspr
+	 * only if AMR value is different.
+	 */
+	BEGIN_MMU_FTR_SECTION_NESTED(68)
+	mfspr	\gpr2, SPRN_AMR
+	cmpd	\gpr1, \gpr2
+	beq	99f
+	END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_KUAP, 68)
+
 	isync
 	mtspr	SPRN_AMR, \gpr1
+99:
 	/*
 	 * Restore IAMR only when returning to userspace
 	 */
 	ld	\gpr1, STACK_REGS_IAMR(r1)
+
+	/*
+	 * If kuep feature is not enabled, do the mtspr
+	 * only if IAMR value is different.
+	 */
+	BEGIN_MMU_FTR_SECTION_NESTED(69)
+	mfspr	\gpr2, SPRN_IAMR
+	cmpd	\gpr1, \gpr2
+	beq	100f
+	END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_KUEP, 69)
+
+	isync
 	mtspr	SPRN_IAMR, \gpr1
 
+100: //skip_restore_amr
 	/* No isync required, see kuap_restore_user_amr() */
-	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_PKEY, 67)
 #endif
 .endm
 
-.macro kuap_restore_kernel_amr	gpr1, gpr2
+.macro kuap_restore_kernel_amr gpr1, gpr2
 #if defined(CONFIG_PPC_PKEY)
 
 	BEGIN_MMU_FTR_SECTION_NESTED(67)
@@ -197,18 +223,41 @@ static inline u64 current_thread_iamr(void)
 
 static inline void kuap_restore_user_amr(struct pt_regs *regs)
 {
+	bool restore_amr = false, restore_iamr = false;
+	unsigned long amr, iamr;
+
 	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return;
 
-	isync();
-	mtspr(SPRN_AMR, regs->amr);
-	mtspr(SPRN_IAMR, regs->iamr);
+	if (!mmu_has_feature(MMU_FTR_KUAP)) {
+		amr = mfspr(SPRN_AMR);
+		if (amr != regs->amr)
+			restore_amr = true;
+	} else
+		restore_amr = true;
+
+	if (!mmu_has_feature(MMU_FTR_KUEP)) {
+		iamr = mfspr(SPRN_IAMR);
+		if (iamr != regs->iamr)
+			restore_iamr = true;
+	} else
+		restore_iamr = true;
+
+
+	if (restore_amr || restore_iamr) {
+		isync();
+		if (restore_amr)
+			mtspr(SPRN_AMR, regs->amr);
+		if (restore_iamr)
+			mtspr(SPRN_IAMR, regs->iamr);
+	}
 	/*
 	 * No isync required here because we are about to rfi
 	 * back to previous context before any user accesses
 	 * would be made, which is a CSI.
 	 */
 }
+
 static inline void kuap_restore_kernel_amr(struct pt_regs *regs,
 					   unsigned long amr)
 {
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index e49291594c68..a68517e99fd2 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -675,7 +675,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 	bne-	.Lrestore_nvgprs
 
 .Lfast_user_interrupt_return_amr:
-	kuap_restore_user_amr r3
+	kuap_restore_user_amr r3, r4
 .Lfast_user_interrupt_return:
 	ld	r11,_NIP(r1)
 	ld	r12,_MSR(r1)
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 60c57609d316..681f9afafc6f 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -38,6 +38,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 #ifdef CONFIG_PPC_PKEY
 	if (mmu_has_feature(MMU_FTR_PKEY)) {
 		unsigned long amr, iamr;
+		bool flush_needed = false;
 		/*
 		 * When entering from userspace we mostly have the AMR/IAMR
 		 * different from kernel default values. Hence don't compare.
@@ -46,11 +47,16 @@ notrace long system_call_exception(long r3, long r4, long r5,
 		iamr = mfspr(SPRN_IAMR);
 		regs->amr  = amr;
 		regs->iamr = iamr;
-		if (mmu_has_feature(MMU_FTR_KUAP))
+		if (mmu_has_feature(MMU_FTR_KUAP)) {
 			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
-		if (mmu_has_feature(MMU_FTR_KUEP))
+			flush_needed = true;
+		}
+		if (mmu_has_feature(MMU_FTR_KUEP)) {
 			mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
-		isync();
+			flush_needed = true;
+		}
+		if (flush_needed)
+			isync();
 	} else
 #endif
 		kuap_check_amr();
-- 
2.28.0

