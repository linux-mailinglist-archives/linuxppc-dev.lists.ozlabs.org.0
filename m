Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7464253CF9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 06:53:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcVjR5KY9zDqc4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 14:53:15 +1000 (AEST)
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
 header.s=pp1 header.b=KqtW+pwF; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcTmX3vlqzDqNx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 14:10:52 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R41gpL126238; Thu, 27 Aug 2020 00:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VdFgLgK7YdSlps2QPfx2nNxU8FbUsIxLEbSFzz4QX0A=;
 b=KqtW+pwFDjYPVLlTvp3dSxsi2qB5k+1D5BM7TSV6Je7iICUL/39wMrb1xnxC2LKyXVkf
 9bLXNJ2kkjOqBHPE99UHCszAS2BfsjvZ/OyLVaPfefCh0JipfTQGUVkA3vOT7hHW7XPF
 1qyKLHFtfTHi0XGfclgZ49E+SSYQ5547+k/Wxdp6dWlXmsXP2MyxluskTGLUJMnzSQQR
 J3IL9geUBNwlPkjbWEiCOZ/w3Q4RY65x2vl8woJTVyOgInWfjH/xFeNMESgOlpRBgEbB
 VQ4LV0Rfxddqpo6tnZFj5cuMimgxYJxeYFpn3UfOYxhfvt6LqNphtnvWLiUj1fTzsIY7 hA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33657b0gdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 00:10:47 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R47r41006870;
 Thu, 27 Aug 2020 04:10:46 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 335kvcgrdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 04:10:46 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R4AkWX15270412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 04:10:46 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E360E2805A;
 Thu, 27 Aug 2020 04:10:45 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76CFA28058;
 Thu, 27 Aug 2020 04:10:44 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.74.195])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 04:10:44 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 23/23] powerpc/book3s64/pkeys: Optimize FTR_KUAP and
 FTR_KUEP disabled case
Date: Thu, 27 Aug 2020 09:39:31 +0530
Message-Id: <20200827040931.297759-24-aneesh.kumar@linux.ibm.com>
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
 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 mlxlogscore=930 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
index 34a412d2a65b..d71e9a958eb5 100644
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
 	ld	\gpr1, STACK_REGS_KUAP(r1)
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
 	ld	\gpr1, STACK_REGS_KUEP(r1)
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
@@ -190,18 +216,41 @@ static inline u64 current_thread_iamr(void)
 
 static inline void kuap_restore_user_amr(struct pt_regs *regs)
 {
+	bool restore_amr = false, restore_iamr = false;
+	unsigned long amr, iamr;
+
 	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return;
 
-	isync();
-	mtspr(SPRN_AMR, regs->kuap);
-	mtspr(SPRN_IAMR, regs->kuep);
+	if (!mmu_has_feature(MMU_FTR_KUAP)) {
+		amr = mfspr(SPRN_AMR);
+		if (amr != regs->kuap)
+			restore_amr = true;
+	} else
+		restore_amr = true;
+
+	if (!mmu_has_feature(MMU_FTR_KUEP)) {
+		iamr = mfspr(SPRN_IAMR);
+		if (iamr != regs->kuep)
+			restore_iamr = true;
+	} else
+		restore_iamr = true;
+
+
+	if (restore_amr || restore_iamr) {
+		isync();
+		if (restore_amr)
+			mtspr(SPRN_AMR, regs->kuap);
+		if (restore_iamr)
+			mtspr(SPRN_IAMR, regs->kuep);
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
index 68171689db5d..ac6c84a53ff8 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -667,7 +667,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 	bne-	.Lrestore_nvgprs
 
 .Lfast_user_interrupt_return_amr:
-	kuap_restore_user_amr r3
+	kuap_restore_user_amr r3, r4
 .Lfast_user_interrupt_return:
 	ld	r11,_NIP(r1)
 	ld	r12,_MSR(r1)
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index e49d604b811b..945a14e41898 100644
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
 		regs->kuap = amr;
 		regs->kuep = iamr;
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
2.26.2

