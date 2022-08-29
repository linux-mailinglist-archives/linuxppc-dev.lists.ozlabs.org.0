Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F4A5A42BB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 07:55:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGKRP3CXlz3c41
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 15:55:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EploQHm1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EploQHm1;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGKNj55G5z3bgR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 15:53:09 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T5i4cJ023358;
	Mon, 29 Aug 2022 05:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=El+KUevS9oW+KPadzQQksILQbSoiJX3nooKUr2ohE1s=;
 b=EploQHm1O6ghubgzpr/7VtegNrNKsz19kauF4rmY6hGQiIfeaWxs6skxTnErpl63JiLJ
 JlkrIAdyRKiLgTU1/MlilK75XRUBpfTze4vvO5tAYZhSAHQbB+Q6ZV6M50q+KWuScW6Z
 F0Nk+FO7s5Cxa5/nL+BY3MrEAn8EQdAy4hr4sNmHrpGdzBvPlmKtysBCGbO7dAdKiLgd
 WGFJiKpqtIYcABrSBvJXo76u+TnmtfA8QWEMv8rHmCJLWITa4WPohIHQQLuUzWCQLFO3
 V5Mj5u9DqpFJoFEEkyM341CwiHmnsQ3w3GYpl9fELjlyjqJjlOUn/P51OpiYOr0TjiEx EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j8qjeg5mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:52:52 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27T5mN1v006694;
	Mon, 29 Aug 2022 05:52:52 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j8qjeg5kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:52:52 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27T5pgcG009481;
	Mon, 29 Aug 2022 05:52:50 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma01fra.de.ibm.com with ESMTP id 3j8hka86xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:52:49 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27T5qlQZ41615714
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Aug 2022 05:52:47 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BC594C044;
	Mon, 29 Aug 2022 05:52:47 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A58ED4C040;
	Mon, 29 Aug 2022 05:52:43 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.67.34])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 29 Aug 2022 05:52:43 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 03/16] powerpc: Fix objtool unannotated intra-function call warnings
Date: Mon, 29 Aug 2022 11:22:10 +0530
Message-Id: <20220829055223.24767-4-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220829055223.24767-1-sv@linux.ibm.com>
References: <20220829055223.24767-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gyJXqGsNyblQxlLMAIvI9ABTK7pt4CSb
X-Proofpoint-GUID: P-R3P4LpPFNhptVkjFnjCMctbE8XhkVa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_02,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208290026
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
Cc: peterz@infradead.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

objtool throws unannotated intra-function call warnings
in the following assembly files:

arch/powerpc/kernel/vector.o: warning: objtool: .text+0x53c: unannotated intra-function call

arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x60: unannotated intra-function call
arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x124: unannotated intra-function call
arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x5d4: unannotated intra-function call
arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x5dc: unannotated intra-function call
arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xcb8: unannotated intra-function call
arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xd0c: unannotated intra-function call
arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x1030: unannotated intra-function call

arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x358: unannotated intra-function call
arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x728: unannotated intra-function call
arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x4d94: unannotated intra-function call
arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x4ec4: unannotated intra-function call

arch/powerpc/kvm/book3s_hv_interrupts.o: warning: objtool: .text+0x6c: unannotated intra-function call
arch/powerpc/kernel/misc_64.o: warning: objtool: .text+0x64: unannotated intra-function call

objtool does not add STT_NOTYPE symbols with size 0 to the
rbtree, which is why find_call_destination() function is not able
to find the destination symbol for 'bl' instruction. For such symbols,
objtool is throwing unannotated intra-function call warnings in
assembly files. Fix these warnings by adding SYM_FUNC_START_LOCAL()
and SYM_FUNC_END() annotations to those symbols to be able to set symbol
type to STT_FUNC and set size of these symbols accordingly.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/kernel/exceptions-64s.S    |  7 +++++--
 arch/powerpc/kernel/head_64.S           |  7 +++++--
 arch/powerpc/kernel/misc_64.S           |  4 +++-
 arch/powerpc/kernel/vector.S            |  4 +++-
 arch/powerpc/kvm/book3s_hv_interrupts.S |  4 +++-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 22 +++++++++++++++-------
 6 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 3d0dc133a9ae..4242c1a20bcd 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -20,6 +20,7 @@
 #include <asm/head-64.h>
 #include <asm/feature-fixups.h>
 #include <asm/kup.h>
+#include <linux/linkage.h>
 
 /*
  * Following are fixed section helper macros.
@@ -3075,7 +3076,7 @@ CLOSE_FIXED_SECTION(virt_trampolines);
 USE_TEXT_SECTION()
 
 /* MSR[RI] should be clear because this uses SRR[01] */
-enable_machine_check:
+SYM_FUNC_START_LOCAL(enable_machine_check)
 	mflr	r0
 	bcl	20,31,$+4
 0:	mflr	r3
@@ -3087,9 +3088,10 @@ enable_machine_check:
 	RFI_TO_KERNEL
 1:	mtlr	r0
 	blr
+SYM_FUNC_END(enable_machine_check)
 
 /* MSR[RI] should be clear because this uses SRR[01] */
-disable_machine_check:
+SYM_FUNC_START_LOCAL(disable_machine_check)
 	mflr	r0
 	bcl	20,31,$+4
 0:	mflr	r3
@@ -3102,3 +3104,4 @@ disable_machine_check:
 	RFI_TO_KERNEL
 1:	mtlr	r0
 	blr
+SYM_FUNC_END(disable_machine_check)
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index cf2c08902c05..10e2d43420d0 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -18,6 +18,7 @@
  *  variants.
  */
 
+#include <linux/linkage.h>
 #include <linux/threads.h>
 #include <linux/init.h>
 #include <asm/reg.h>
@@ -465,7 +466,7 @@ generic_secondary_common_init:
  * Assumes we're mapped EA == RA if the MMU is on.
  */
 #ifdef CONFIG_PPC_BOOK3S
-__mmu_off:
+SYM_FUNC_START_LOCAL(__mmu_off)
 	mfmsr	r3
 	andi.	r0,r3,MSR_IR|MSR_DR
 	beqlr
@@ -476,6 +477,7 @@ __mmu_off:
 	sync
 	rfid
 	b	.	/* prevent speculative execution */
+SYM_FUNC_END(__mmu_off)
 #endif
 
 
@@ -869,7 +871,7 @@ _GLOBAL(start_secondary_resume)
 /*
  * This subroutine clobbers r11 and r12
  */
-enable_64b_mode:
+SYM_FUNC_START_LOCAL(enable_64b_mode)
 	mfmsr	r11			/* grab the current MSR */
 #ifdef CONFIG_PPC_BOOK3E
 	oris	r11,r11,0x8000		/* CM bit set, we'll set ICM later */
@@ -881,6 +883,7 @@ enable_64b_mode:
 	isync
 #endif
 	blr
+SYM_FUNC_END(enable_64b_mode)
 
 /*
  * This puts the TOC pointer into r2, offset by 0x8000 (as expected
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index fd6d8d3a548e..b36fb89ff718 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -9,6 +9,7 @@
  * PPC64 updates by Dave Engebretsen (engebret@us.ibm.com)
  */
 
+#include <linux/linkage.h>
 #include <linux/sys.h>
 #include <asm/unistd.h>
 #include <asm/errno.h>
@@ -353,7 +354,7 @@ _GLOBAL(kexec_smp_wait)
  *
  * don't overwrite r3 here, it is live for kexec_wait above.
  */
-real_mode:	/* assume normal blr return */
+SYM_FUNC_START_LOCAL(real_mode)	/* assume normal blr return */
 #ifdef CONFIG_PPC_BOOK3E
 	/* Create an identity mapping. */
 	b	kexec_create_tlb
@@ -370,6 +371,7 @@ real_mode:	/* assume normal blr return */
 	mtspr	SPRN_SRR0,r11
 	rfid
 #endif
+SYM_FUNC_END(real_mode)
 
 /*
  * kexec_sequence(newstack, start, image, control, clear_all(),
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index 5cc24d8cce94..fb96aed2b5c3 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -9,6 +9,7 @@
 #include <asm/ptrace.h>
 #include <asm/export.h>
 #include <asm/asm-compat.h>
+#include <linux/linkage.h>
 
 /*
  * Load state from memory into VMX registers including VSCR.
@@ -186,7 +187,7 @@ fphalf:
  * Internal routine to enable floating point and set FPSCR to 0.
  * Don't call it from C; it doesn't use the normal calling convention.
  */
-fpenable:
+SYM_FUNC_START_LOCAL(fpenable)
 #ifdef CONFIG_PPC32
 	stwu	r1,-64(r1)
 #else
@@ -203,6 +204,7 @@ fpenable:
 	mffs	fr31
 	MTFSF_L(fr1)
 	blr
+SYM_FUNC_END(fpenable)
 
 fpdisable:
 	mtlr	r12
diff --git a/arch/powerpc/kvm/book3s_hv_interrupts.S b/arch/powerpc/kvm/book3s_hv_interrupts.S
index 59d89e4b154a..c0deeea7eef3 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupts.S
+++ b/arch/powerpc/kvm/book3s_hv_interrupts.S
@@ -9,6 +9,7 @@
  * Authors: Alexander Graf <agraf@suse.de>
  */
 
+#include <linux/linkage.h>
 #include <asm/ppc_asm.h>
 #include <asm/kvm_asm.h>
 #include <asm/reg.h>
@@ -107,7 +108,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 /*
  * void kvmhv_save_host_pmu(void)
  */
-kvmhv_save_host_pmu:
+SYM_FUNC_START_LOCAL(kvmhv_save_host_pmu)
 BEGIN_FTR_SECTION
 	/* Work around P8 PMAE bug */
 	li	r3, -1
@@ -154,3 +155,4 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	stw	r8, HSTATE_PMC5(r13)
 	stw	r9, HSTATE_PMC6(r13)
 31:	blr
+SYM_FUNC_END(kvmhv_save_host_pmu)
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 7ded202bf995..de91118df0c5 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -29,6 +29,7 @@
 #include <asm/asm-compat.h>
 #include <asm/feature-fixups.h>
 #include <asm/cpuidle.h>
+#include <linux/linkage.h>
 
 /* Values in HSTATE_NAPPING(r13) */
 #define NAPPING_CEDE	1
@@ -2358,7 +2359,7 @@ hmi_realmode:
  * This routine calls kvmppc_read_intr, a C function, if an external
  * interrupt is pending.
  */
-kvmppc_check_wake_reason:
+SYM_FUNC_START_LOCAL(kvmppc_check_wake_reason)
 	mfspr	r6, SPRN_SRR1
 BEGIN_FTR_SECTION
 	rlwinm	r6, r6, 45-31, 0xf	/* extract wake reason field (P8) */
@@ -2427,6 +2428,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	addi	r1, r1, PPC_MIN_STKFRM
 	mtlr	r0
 	blr
+SYM_FUNC_END(kvmppc_check_wake_reason)
 
 /*
  * Save away FP, VMX and VSX registers.
@@ -2434,7 +2436,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
  * N.B. r30 and r31 are volatile across this function,
  * thus it is not callable from C.
  */
-kvmppc_save_fp:
+SYM_FUNC_START_LOCAL(kvmppc_save_fp)
 	mflr	r30
 	mr	r31,r3
 	mfmsr	r5
@@ -2462,6 +2464,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	stw	r6,VCPU_VRSAVE(r31)
 	mtlr	r30
 	blr
+SYM_FUNC_END(kvmppc_save_fp)
 
 /*
  * Load up FP, VMX and VSX registers
@@ -2469,7 +2472,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
  * N.B. r30 and r31 are volatile across this function,
  * thus it is not callable from C.
  */
-kvmppc_load_fp:
+SYM_FUNC_START_LOCAL(kvmppc_load_fp)
 	mflr	r30
 	mr	r31,r4
 	mfmsr	r9
@@ -2498,6 +2501,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	mtlr	r30
 	mr	r4,r31
 	blr
+SYM_FUNC_END(kvmppc_load_fp)
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 /*
@@ -2746,7 +2750,7 @@ kvmppc_bad_host_intr:
  *   r9 has a vcpu pointer (in)
  *   r0 is used as a scratch register
  */
-kvmppc_msr_interrupt:
+SYM_FUNC_START_LOCAL(kvmppc_msr_interrupt)
 	rldicl	r0, r11, 64 - MSR_TS_S_LG, 62
 	cmpwi	r0, 2 /* Check if we are in transactional state..  */
 	ld	r11, VCPU_INTR_MSR(r9)
@@ -2755,13 +2759,14 @@ kvmppc_msr_interrupt:
 	li	r0, 1
 1:	rldimi	r11, r0, MSR_TS_S_LG, 63 - MSR_TS_T_LG
 	blr
+SYM_FUNC_END(kvmppc_msr_interrupt)
 
 /*
  * void kvmhv_load_guest_pmu(struct kvm_vcpu *vcpu)
  *
  * Load up guest PMU state.  R3 points to the vcpu struct.
  */
-kvmhv_load_guest_pmu:
+SYM_FUNC_START_LOCAL(kvmhv_load_guest_pmu)
 	mr	r4, r3
 	mflr	r0
 	li	r3, 1
@@ -2811,13 +2816,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	isync
 	mtlr	r0
 	blr
+SYM_FUNC_END(kvmhv_load_guest_pmu)
 
 /*
  * void kvmhv_load_host_pmu(void)
  *
  * Reload host PMU state saved in the PACA by kvmhv_save_host_pmu.
  */
-kvmhv_load_host_pmu:
+SYM_FUNC_START_LOCAL(kvmhv_load_host_pmu)
 	mflr	r0
 	lbz	r4, PACA_PMCINUSE(r13) /* is the host using the PMU? */
 	cmpwi	r4, 0
@@ -2859,6 +2865,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	isync
 	mtlr	r0
 23:	blr
+SYM_FUNC_END(kvmhv_load_host_pmu)
 
 /*
  * void kvmhv_save_guest_pmu(struct kvm_vcpu *vcpu, bool pmu_in_use)
@@ -2866,7 +2873,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
  * Save guest PMU state into the vcpu struct.
  * r3 = vcpu, r4 = full save flag (PMU in use flag set in VPA)
  */
-kvmhv_save_guest_pmu:
+SYM_FUNC_START_LOCAL(kvmhv_save_guest_pmu)
 	mr	r9, r3
 	mr	r8, r4
 BEGIN_FTR_SECTION
@@ -2942,6 +2949,7 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_MMCRS, r4
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 22:	blr
+SYM_FUNC_END(kvmhv_save_guest_pmu)
 
 /*
  * This works around a hardware bug on POWER8E processors, where
-- 
2.31.1

