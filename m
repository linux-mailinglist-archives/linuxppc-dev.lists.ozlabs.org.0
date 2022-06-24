Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E57855A0E3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 20:41:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LV5Yj6dCNz3fTQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 04:41:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bfUMTnOB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bfUMTnOB;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LV5Pc07WKz3drv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 04:34:27 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25OIC9WF003270;
	Fri, 24 Jun 2022 18:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kH+1kjT4cgmT0yehjeLbCGLisp7vneRIpILXFLA6y2E=;
 b=bfUMTnOBle3FqTPbOVZ0INV8zJIWwPJmnI1VyzvTvcnTJUO2eOWVq7TzufXqn6+lDGEm
 dQFXkRBM0nKC0+R5y0BUvB6o77Q0wdIj2jKl42vw3xdhbO7xrgLO1wPyDMbtfPOzmIqv
 pplKBhNwI9+jQCRlfPhy2ELj1PI6Aj5e5tLuXBZnaTmyYOZFpk+Wu1V1ENziDhU/J/my
 KbXElFUbkvdOgIT143S3ToIvpTKPZB6Q80KJ4igc6eW85+HcMiQ1MLdPAsazNFDrETiC
 Iiz9s/LY2kWwH4ELvyrOb1wcMtnMweQj0ez1xhiV4ISm1At7b+4XPwEmn5/uZRQgw/5/ uA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwj51rme1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 18:34:16 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25OIRFw6021537;
	Fri, 24 Jun 2022 18:34:15 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwj51rmdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 18:34:15 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25OIKNZ9028865;
	Fri, 24 Jun 2022 18:34:14 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3gs6b99ep2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 18:34:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25OIYBx220775188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jun 2022 18:34:11 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 787525204E;
	Fri, 24 Jun 2022 18:34:11 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.0.85])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D762C5204F;
	Fri, 24 Jun 2022 18:34:07 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v3 12/12] objtool/powerpc: Fix unannotated intra-function call warnings
Date: Sat, 25 Jun 2022 00:02:38 +0530
Message-Id: <20220624183238.388144-13-sv@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220624183238.388144-1-sv@linux.ibm.com>
References: <20220624183238.388144-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5LkonAIfC81wNT_8QOK3lAGrGcLJUL9j
X-Proofpoint-GUID: aZAQpxxp0_e3zS-OLUd4YpQqxHqZv75Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_08,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 mlxlogscore=986 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206240072
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

objtool throws unannotated intra-function call warnings
in the following assembly files.

arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x358: unannotated intra-function call
arch/powerpc/kernel/vector.o: warning: objtool: .text+0x53c: unannotated intra-function call
arch/powerpc/kernel/entry_64.o: warning: objtool: .text+0x4: unannotated intra-function call
arch/powerpc/kernel/misc_64.o: warning: objtool: .text+0x64: unannotated intra-function call
arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x60: unannotated intra-function call
arch/powerpc/kvm/book3s_hv_interrupts.o: warning: objtool: .text+0x6c: unannotated intra-function call

Remove a few of these warnings by putting ANNOTATE_INTRA_FUNCTION_CALL
directive before the call. And, the rest by annotating those functions
with SYM_FUNC_START_LOCAL() and SYM_FUNC_END() macros.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/kernel/entry_64.S          |  2 ++
 arch/powerpc/kernel/exceptions-64s.S    |  7 +++++--
 arch/powerpc/kernel/head_64.S           |  7 +++++--
 arch/powerpc/kernel/misc_64.S           |  4 +++-
 arch/powerpc/kernel/vector.S            |  4 +++-
 arch/powerpc/kvm/book3s_hv_interrupts.S |  4 +++-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 25 ++++++++++++++++++-------
 7 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 9581906b5ee9..11249cd6cfc5 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -14,6 +14,7 @@
  *  code, and exception/interrupt return code for PowerPC.
  */
 
+#include <linux/objtool.h>
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <asm/cache.h>
@@ -73,6 +74,7 @@ flush_branch_caches:
 
 	// Flush the link stack
 	.rept 64
+	ANNOTATE_INTRA_FUNCTION_CALL
 	bl	.+4
 	.endr
 	b	1f
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b66dd6f775a4..14ed17b8fe33 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -13,6 +13,7 @@
  *
  */
 
+#include <linux/linkage.h>
 #include <asm/hw_irq.h>
 #include <asm/exception-64s.h>
 #include <asm/ptrace.h>
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
index 5c5181e8d5f1..d5b01a15cb39 100644
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
index d38a019b38e1..372d3dae25af 100644
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
index d185dee26026..154fa428d98e 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -29,6 +29,8 @@
 #include <asm/asm-compat.h>
 #include <asm/feature-fixups.h>
 #include <asm/cpuidle.h>
+#include <linux/linkage.h>
+#include <linux/objtool.h>
 
 /* Values in HSTATE_NAPPING(r13) */
 #define NAPPING_CEDE	1
@@ -1514,12 +1516,14 @@ kvm_flush_link_stack:
 
 	/* Flush the link stack. On Power8 it's up to 32 entries in size. */
 	.rept 32
+	ANNOTATE_INTRA_FUNCTION_CALL
 	bl	.+4
 	.endr
 
 	/* And on Power9 it's up to 64. */
 BEGIN_FTR_SECTION
 	.rept 32
+	ANNOTATE_INTRA_FUNCTION_CALL
 	bl	.+4
 	.endr
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
@@ -2360,7 +2364,7 @@ hmi_realmode:
  * This routine calls kvmppc_read_intr, a C function, if an external
  * interrupt is pending.
  */
-kvmppc_check_wake_reason:
+SYM_FUNC_START_LOCAL(kvmppc_check_wake_reason)
 	mfspr	r6, SPRN_SRR1
 BEGIN_FTR_SECTION
 	rlwinm	r6, r6, 45-31, 0xf	/* extract wake reason field (P8) */
@@ -2429,6 +2433,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	addi	r1, r1, PPC_MIN_STKFRM
 	mtlr	r0
 	blr
+SYM_FUNC_END(kvmppc_check_wake_reason)
 
 /*
  * Save away FP, VMX and VSX registers.
@@ -2436,7 +2441,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
  * N.B. r30 and r31 are volatile across this function,
  * thus it is not callable from C.
  */
-kvmppc_save_fp:
+SYM_FUNC_START_LOCAL(kvmppc_save_fp)
 	mflr	r30
 	mr	r31,r3
 	mfmsr	r5
@@ -2464,6 +2469,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	stw	r6,VCPU_VRSAVE(r31)
 	mtlr	r30
 	blr
+SYM_FUNC_END(kvmppc_save_fp)
 
 /*
  * Load up FP, VMX and VSX registers
@@ -2471,7 +2477,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
  * N.B. r30 and r31 are volatile across this function,
  * thus it is not callable from C.
  */
-kvmppc_load_fp:
+SYM_FUNC_START_LOCAL(kvmppc_load_fp)
 	mflr	r30
 	mr	r31,r4
 	mfmsr	r9
@@ -2500,6 +2506,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	mtlr	r30
 	mr	r4,r31
 	blr
+SYM_FUNC_END(kvmppc_load_fp)
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 /*
@@ -2748,7 +2755,7 @@ kvmppc_bad_host_intr:
  *   r9 has a vcpu pointer (in)
  *   r0 is used as a scratch register
  */
-kvmppc_msr_interrupt:
+SYM_FUNC_START_LOCAL(kvmppc_msr_interrupt)
 	rldicl	r0, r11, 64 - MSR_TS_S_LG, 62
 	cmpwi	r0, 2 /* Check if we are in transactional state..  */
 	ld	r11, VCPU_INTR_MSR(r9)
@@ -2757,13 +2764,14 @@ kvmppc_msr_interrupt:
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
@@ -2813,13 +2821,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
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
@@ -2861,6 +2870,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	isync
 	mtlr	r0
 23:	blr
+SYM_FUNC_END(kvmhv_load_host_pmu)
 
 /*
  * void kvmhv_save_guest_pmu(struct kvm_vcpu *vcpu, bool pmu_in_use)
@@ -2868,7 +2878,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
  * Save guest PMU state into the vcpu struct.
  * r3 = vcpu, r4 = full save flag (PMU in use flag set in VPA)
  */
-kvmhv_save_guest_pmu:
+SYM_FUNC_START_LOCAL(kvmhv_save_guest_pmu)
 	mr	r9, r3
 	mr	r8, r4
 BEGIN_FTR_SECTION
@@ -2944,6 +2954,7 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_MMCRS, r4
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 22:	blr
+SYM_FUNC_END(kvmhv_save_guest_pmu)
 
 /*
  * This works around a hardware bug on POWER8E processors, where
-- 
2.25.1

