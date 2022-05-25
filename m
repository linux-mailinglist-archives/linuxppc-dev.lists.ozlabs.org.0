Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EABD533D5D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 15:10:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7Wd902LGz3cf6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 23:10:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VT678Era;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VT678Era; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7Wb22HbRz2yWn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 23:08:14 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PCvkEa027556;
 Wed, 25 May 2022 13:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wqaNfdK6nmEn66/LJg4tq5DU1IYoODgBEyn1Di53KBE=;
 b=VT678Erae882Yf5+ZCjgXmBXiczucY+TPhm6IxjFULmIZHZJEuqO7bXar7OdEy873uAD
 +0XYYaBRww6BFCAzSu4qiCZMyeHdpuzTpQj239E6hIyuFIlBej2YGxPdb6YZsGX8P8J5
 wvKnnP7wAM5slyrGg/g0PxMqA1uqsglixIGF6N63Ec9FGqPN2zGQAWntJDfZ11OcLJN8
 wLrwpE+4yyp07MsR9ztTi71hOXQUHgth56KsyhqAoAzFMyKc64ZuqTBqzmPcNw4Axep4
 xW/hdFiZ+y4oxBrKsVmWv1gCYVzoFdURtbdowa46q6yEXfjqkrBN1hKD1TpRO7vvBlyh RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9mx188yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:08:09 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24PCw6Hw028641;
 Wed, 25 May 2022 13:08:09 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9mx188y1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:08:09 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24PD25kN032238;
 Wed, 25 May 2022 13:08:08 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 3g93utfkw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:08:08 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24PD87ua25493856
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 13:08:07 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F7F2112070;
 Wed, 25 May 2022 13:08:07 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F64D112065;
 Wed, 25 May 2022 13:08:06 +0000 (GMT)
Received: from li-4707e44c-227d-11b2-a85c-f336a85283d9.ibm.com.com (unknown
 [9.160.108.97]) by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 May 2022 13:08:06 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/5] KVM: PPC: Book3S HV: Add a new config for P8 debug timing
Date: Wed, 25 May 2022 10:05:51 -0300
Message-Id: <20220525130554.2614394-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525130554.2614394-1-farosas@linux.ibm.com>
References: <20220525130554.2614394-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SGDCb5fScEM-g2wExkU53m921fFKirTM
X-Proofpoint-ORIG-GUID: S1mnGPyPRVAsbbqEkgTqA9ICGuuuApp2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_03,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205250067
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
Cc: npiggin@gmail.com, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Turn the existing Kconfig KVM_BOOK3S_HV_EXIT_TIMING into
KVM_BOOK3S_HV_P8_TIMING in preparation for the addition of a new
config for P9 timings.

This applies only to P8 code, the generic timing code is still kept
under KVM_BOOK3S_HV_EXIT_TIMING.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kernel/asm-offsets.c       |  2 +-
 arch/powerpc/kvm/Kconfig                |  6 +++++-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 24 ++++++++++++------------
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index eec536aef83a..8c10f536e478 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -379,7 +379,7 @@ int main(void)
 	OFFSET(VCPU_SPRG2, kvm_vcpu, arch.shregs.sprg2);
 	OFFSET(VCPU_SPRG3, kvm_vcpu, arch.shregs.sprg3);
 #endif
-#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+#ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
 	OFFSET(VCPU_TB_RMENTRY, kvm_vcpu, arch.rm_entry);
 	OFFSET(VCPU_TB_RMINTR, kvm_vcpu, arch.rm_intr);
 	OFFSET(VCPU_TB_RMEXIT, kvm_vcpu, arch.rm_exit);
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index ddd88179110a..73f8277df7d1 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -128,7 +128,11 @@ config KVM_BOOK3S_64_PR
 	  and system calls on the host.
 
 config KVM_BOOK3S_HV_EXIT_TIMING
-	bool "Detailed timing for hypervisor real-mode code"
+	bool
+
+config KVM_BOOK3S_HV_P8_TIMING
+	bool "Detailed timing for hypervisor real-mode code (for POWER8)"
+	select KVM_BOOK3S_HV_EXIT_TIMING
 	depends on KVM_BOOK3S_HV_POSSIBLE && DEBUG_FS
 	help
 	  Calculate time taken for each vcpu in the real-mode guest entry,
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index d185dee26026..c34932e31dcd 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -229,14 +229,14 @@ kvm_novcpu_wakeup:
 	cmpdi	r4, 0
 	beq	kvmppc_primary_no_guest
 
-#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+#ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
 	addi	r3, r4, VCPU_TB_RMENTRY
 	bl	kvmhv_start_timing
 #endif
 	b	kvmppc_got_guest
 
 kvm_novcpu_exit:
-#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+#ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
 	ld	r4, HSTATE_KVM_VCPU(r13)
 	cmpdi	r4, 0
 	beq	13f
@@ -515,7 +515,7 @@ kvmppc_hv_entry:
 	li	r6, KVM_GUEST_MODE_HOST_HV
 	stb	r6, HSTATE_IN_GUEST(r13)
 
-#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+#ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
 	/* Store initial timestamp */
 	cmpdi	r4, 0
 	beq	1f
@@ -886,7 +886,7 @@ fast_guest_return:
 	li	r9, KVM_GUEST_MODE_GUEST_HV
 	stb	r9, HSTATE_IN_GUEST(r13)
 
-#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+#ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
 	/* Accumulate timing */
 	addi	r3, r4, VCPU_TB_GUEST
 	bl	kvmhv_accumulate_time
@@ -937,7 +937,7 @@ secondary_too_late:
 	cmpdi	r4, 0
 	beq	11f
 	stw	r12, VCPU_TRAP(r4)
-#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+#ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
 	addi	r3, r4, VCPU_TB_RMEXIT
 	bl	kvmhv_accumulate_time
 #endif
@@ -951,7 +951,7 @@ hdec_soon:
 	li	r12, BOOK3S_INTERRUPT_HV_DECREMENTER
 12:	stw	r12, VCPU_TRAP(r4)
 	mr	r9, r4
-#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+#ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
 	addi	r3, r4, VCPU_TB_RMEXIT
 	bl	kvmhv_accumulate_time
 #endif
@@ -1048,7 +1048,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	li	r0, MSR_RI
 	mtmsrd	r0, 1
 
-#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+#ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
 	addi	r3, r9, VCPU_TB_RMINTR
 	mr	r4, r9
 	bl	kvmhv_accumulate_time
@@ -1127,7 +1127,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
 guest_exit_cont:		/* r9 = vcpu, r12 = trap, r13 = paca */
 
-#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+#ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
 	addi	r3, r9, VCPU_TB_RMEXIT
 	mr	r4, r9
 	bl	kvmhv_accumulate_time
@@ -1487,7 +1487,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	mtspr	SPRN_LPCR,r8
 	isync
 
-#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+#ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
 	/* Finish timing, if we have a vcpu */
 	ld	r4, HSTATE_KVM_VCPU(r13)
 	cmpdi	r4, 0
@@ -2155,7 +2155,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_TM)
 	ld	r4, HSTATE_KVM_VCPU(r13)
 	std	r3, VCPU_DEC_EXPIRES(r4)
 
-#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+#ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
 	ld	r4, HSTATE_KVM_VCPU(r13)
 	addi	r3, r4, VCPU_TB_CEDE
 	bl	kvmhv_accumulate_time
@@ -2223,7 +2223,7 @@ kvm_end_cede:
 	/* get vcpu pointer */
 	ld	r4, HSTATE_KVM_VCPU(r13)
 
-#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+#ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
 	addi	r3, r4, VCPU_TB_RMINTR
 	bl	kvmhv_accumulate_time
 #endif
@@ -2963,7 +2963,7 @@ kvmppc_fix_pmao:
 	isync
 	blr
 
-#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+#ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
 /*
  * Start timing an activity
  * r3 = pointer to time accumulation struct, r4 = vcpu
-- 
2.35.1

