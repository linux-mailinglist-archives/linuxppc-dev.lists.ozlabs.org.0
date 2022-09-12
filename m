Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D90175B5621
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 10:27:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR08l4RjBz3f3x
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 18:27:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZAE0nhjc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZAE0nhjc;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR01v1Lh1z3cBF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 18:21:54 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C80NtR022608;
	Mon, 12 Sep 2022 08:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ZnJlitfd6NmpcHYegG8iZXRKXR+fdaJ50QC8USjmUPA=;
 b=ZAE0nhjcM6Dyi6fd3JxBl0wgVTlQv37eZ4Hv5Stm+9/bIMfhxf9Vm2IjWFvU64kqULvE
 lZ2jvnsMspE8/zZgE5OYGF89b/nwJxXkP1yk8DlbgGZzkZbKgW08WVFVyPc8w5x8gtxi
 RzM9ZBgrnnBkLpLC9x1ylm6JtTj12uwKo6dMNVU+T9LlUnjlfzJfnpf8pZZeZC55BTdX
 KHWhNHAHY/xRcHsoC8HQ3kzOFre2/vgKvV+4AXnLS7ZPpH5SH2ld3J+JDpQeFcPMUzL1
 W1awxFAPQtutit0Fdnx8BCQzyUCzqWCyM5Lx0VtPGhR6VTKWzP81KNk9SOgexwLYA86Y PA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jhxvhce4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:21:09 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28C6BtZm013164;
	Mon, 12 Sep 2022 08:21:09 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jhxvhce3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:21:09 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28C85cdC024801;
	Mon, 12 Sep 2022 08:21:07 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03fra.de.ibm.com with ESMTP id 3jgj78shdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:21:06 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28C8L4mK37290422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Sep 2022 08:21:04 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93DC9A4053;
	Mon, 12 Sep 2022 08:21:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01AE5A4040;
	Mon, 12 Sep 2022 08:21:00 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.91.220])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 12 Sep 2022 08:20:59 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 06/16] powerpc: Fix objtool unannotated intra-function call warnings on PPC32
Date: Mon, 12 Sep 2022 13:50:10 +0530
Message-Id: <20220912082020.226755-7-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220912082020.226755-1-sv@linux.ibm.com>
References: <20220912082020.226755-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bZi2Z03YSaVK8A97YB_rna69ZV89YCT0
X-Proofpoint-GUID: fNoZOKR-9bEGLs8_lXA6tDW8CmEtw10l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209120027
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

From: Christophe Leroy <christophe.leroy@csgroup.eu>

Fix several annotations in assembly files on PPC32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
[Sathvika Vasireddy: Changed subject line from "objtool/powerpc: Activate
objtool on PPC32" to "powerpc: Fix objtool unannotated intra-function call
warnings on PPC32", and removed Kconfig change to enable objtool, as it
is a part of "objtool/powerpc: Enable objtool to be built on ppc" patch in
this series.]
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/kernel/cpu_setup_6xx.S          | 26 ++++++++++++------
 arch/powerpc/kernel/cpu_setup_fsl_booke.S    |  8 ++++--
 arch/powerpc/kernel/entry_32.S               |  9 ++++--
 arch/powerpc/kernel/head_40x.S               |  5 +++-
 arch/powerpc/kernel/head_8xx.S               |  5 +++-
 arch/powerpc/kernel/head_book3s_32.S         | 29 ++++++++++++++------
 arch/powerpc/kernel/head_fsl_booke.S         |  5 +++-
 arch/powerpc/kernel/swsusp_32.S              |  5 +++-
 arch/powerpc/kvm/fpu.S                       | 17 ++++++++----
 arch/powerpc/platforms/52xx/lite5200_sleep.S | 15 +++++++---
 10 files changed, 89 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/kernel/cpu_setup_6xx.S b/arch/powerpc/kernel/cpu_setup_6xx.S
index f8b5ff64b604..f29ce3dd6140 100644
--- a/arch/powerpc/kernel/cpu_setup_6xx.S
+++ b/arch/powerpc/kernel/cpu_setup_6xx.S
@@ -4,6 +4,8 @@
  *    Copyright (C) 2003 Benjamin Herrenschmidt (benh@kernel.crashing.org)
  */
 
+#include <linux/linkage.h>
+
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/cputable.h>
@@ -81,7 +83,7 @@ _GLOBAL(__setup_cpu_745x)
 	blr
 
 /* Enable caches for 603's, 604, 750 & 7400 */
-setup_common_caches:
+SYM_FUNC_START_LOCAL(setup_common_caches)
 	mfspr	r11,SPRN_HID0
 	andi.	r0,r11,HID0_DCE
 	ori	r11,r11,HID0_ICE|HID0_DCE
@@ -95,11 +97,12 @@ setup_common_caches:
 	sync
 	isync
 	blr
+SYM_FUNC_END(setup_common_caches)
 
 /* 604, 604e, 604ev, ...
  * Enable superscalar execution & branch history table
  */
-setup_604_hid0:
+SYM_FUNC_START_LOCAL(setup_604_hid0)
 	mfspr	r11,SPRN_HID0
 	ori	r11,r11,HID0_SIED|HID0_BHTE
 	ori	r8,r11,HID0_BTCD
@@ -110,6 +113,7 @@ setup_604_hid0:
 	sync
 	isync
 	blr
+SYM_FUNC_END(setup_604_hid0)
 
 /* 7400 <= rev 2.7 and 7410 rev = 1.0 suffer from some
  * erratas we work around here.
@@ -125,13 +129,14 @@ setup_604_hid0:
  * needed once we have applied workaround #5 (though it's
  * not set by Apple's firmware at least).
  */
-setup_7400_workarounds:
+SYM_FUNC_START_LOCAL(setup_7400_workarounds)
 	mfpvr	r3
 	rlwinm	r3,r3,0,20,31
 	cmpwi	0,r3,0x0207
 	ble	1f
 	blr
-setup_7410_workarounds:
+SYM_FUNC_END(setup_7400_workarounds)
+SYM_FUNC_START_LOCAL(setup_7410_workarounds)
 	mfpvr	r3
 	rlwinm	r3,r3,0,20,31
 	cmpwi	0,r3,0x0100
@@ -151,6 +156,7 @@ setup_7410_workarounds:
 	sync
 	isync
 	blr
+SYM_FUNC_END(setup_7410_workarounds)
 
 /* 740/750/7400/7410
  * Enable Store Gathering (SGE), Address Broadcast (ABE),
@@ -158,7 +164,7 @@ setup_7410_workarounds:
  * Dynamic Power Management (DPM), Speculative (SPD)
  * Clear Instruction cache throttling (ICTC)
  */
-setup_750_7400_hid0:
+SYM_FUNC_START_LOCAL(setup_750_7400_hid0)
 	mfspr	r11,SPRN_HID0
 	ori	r11,r11,HID0_SGE | HID0_ABE | HID0_BHTE | HID0_BTIC
 	oris	r11,r11,HID0_DPM@h
@@ -177,12 +183,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_NO_DPM)
 	sync
 	isync
 	blr
+SYM_FUNC_END(setup_750_7400_hid0)
 
 /* 750cx specific
  * Looks like we have to disable NAP feature for some PLL settings...
  * (waiting for confirmation)
  */
-setup_750cx:
+SYM_FUNC_START_LOCAL(setup_750cx)
 	mfspr	r10, SPRN_HID1
 	rlwinm	r10,r10,4,28,31
 	cmpwi	cr0,r10,7
@@ -196,11 +203,13 @@ setup_750cx:
 	andc	r6,r6,r7
 	stw	r6,CPU_SPEC_FEATURES(r4)
 	blr
+SYM_FUNC_END(setup_750cx)
 
 /* 750fx specific
  */
-setup_750fx:
+SYM_FUNC_START_LOCAL(setup_750fx)
 	blr
+SYM_FUNC_END(setup_750fx)
 
 /* MPC 745x
  * Enable Store Gathering (SGE), Branch Folding (FOLD)
@@ -212,7 +221,7 @@ setup_750fx:
  * Clear Instruction cache throttling (ICTC)
  * Enable L2 HW prefetch
  */
-setup_745x_specifics:
+SYM_FUNC_START_LOCAL(setup_745x_specifics)
 	/* We check for the presence of an L3 cache setup by
 	 * the firmware. If any, we disable NAP capability as
 	 * it's known to be bogus on rev 2.1 and earlier
@@ -270,6 +279,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_NO_DPM)
 	sync
 	isync
 	blr
+SYM_FUNC_END(setup_745x_specifics)
 
 /*
  * Initialize the FPU registers. This is needed to work around an errata
diff --git a/arch/powerpc/kernel/cpu_setup_fsl_booke.S b/arch/powerpc/kernel/cpu_setup_fsl_booke.S
index 4bf33f1b4193..f573a4f3bbe6 100644
--- a/arch/powerpc/kernel/cpu_setup_fsl_booke.S
+++ b/arch/powerpc/kernel/cpu_setup_fsl_booke.S
@@ -8,6 +8,8 @@
  * Benjamin Herrenschmidt <benh@kernel.crashing.org>
  */
 
+#include <linux/linkage.h>
+
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/cputable.h>
@@ -274,7 +276,7 @@ _GLOBAL(flush_dcache_L1)
 
 	blr
 
-has_L2_cache:
+SYM_FUNC_START_LOCAL(has_L2_cache)
 	/* skip L2 cache on P2040/P2040E as they have no L2 cache */
 	mfspr	r3, SPRN_SVR
 	/* shift right by 8 bits and clear E bit of SVR */
@@ -290,9 +292,10 @@ has_L2_cache:
 1:
 	li	r3, 0
 	blr
+SYM_FUNC_END(has_L2_cache)
 
 /* flush backside L2 cache */
-flush_backside_L2_cache:
+SYM_FUNC_START_LOCAL(flush_backside_L2_cache)
 	mflr	r10
 	bl	has_L2_cache
 	mtlr	r10
@@ -313,6 +316,7 @@ flush_backside_L2_cache:
 	bne	1b
 2:
 	blr
+SYM_FUNC_END(flush_backside_L2_cache)
 
 _GLOBAL(cpu_down_flush_e500v2)
 	mflr r0
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 1d599df6f169..f8480d88509f 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -18,6 +18,8 @@
 #include <linux/err.h>
 #include <linux/sys.h>
 #include <linux/threads.h>
+#include <linux/linkage.h>
+
 #include <asm/reg.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
@@ -74,17 +76,18 @@ _ASM_NOKPROBE_SYMBOL(prepare_transfer_to_handler)
 #endif /* CONFIG_PPC_BOOK3S_32 || CONFIG_E500 */
 
 #if defined(CONFIG_PPC_KUEP) && defined(CONFIG_PPC_BOOK3S_32)
-	.globl	__kuep_lock
-__kuep_lock:
+SYM_FUNC_START(__kuep_lock)
 	lwz	r9, THREAD+THSR0(r2)
 	update_user_segments_by_4 r9, r10, r11, r12
 	blr
+SYM_FUNC_END(__kuep_lock)
 
-__kuep_unlock:
+SYM_FUNC_START_LOCAL(__kuep_unlock)
 	lwz	r9, THREAD+THSR0(r2)
 	rlwinm  r9,r9,0,~SR_NX
 	update_user_segments_by_4 r9, r10, r11, r12
 	blr
+SYM_FUNC_END(__kuep_unlock)
 
 .macro	kuep_lock
 	bl	__kuep_lock
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 088f500896c7..9110fe9d6747 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -28,6 +28,8 @@
 #include <linux/init.h>
 #include <linux/pgtable.h>
 #include <linux/sizes.h>
+#include <linux/linkage.h>
+
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
@@ -662,7 +664,7 @@ start_here:
  * kernel initialization.  This maps the first 32 MBytes of memory 1:1
  * virtual to physical and more importantly sets the cache mode.
  */
-initial_mmu:
+SYM_FUNC_START_LOCAL(initial_mmu)
 	tlbia			/* Invalidate all TLB entries */
 	isync
 
@@ -711,6 +713,7 @@ initial_mmu:
 	mtspr	SPRN_EVPR,r0
 
 	blr
+SYM_FUNC_END(initial_mmu)
 
 _GLOBAL(abort)
         mfspr   r13,SPRN_DBCR0
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 0b05f2be66b9..c94ed5a08c93 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -18,6 +18,8 @@
 #include <linux/magic.h>
 #include <linux/pgtable.h>
 #include <linux/sizes.h>
+#include <linux/linkage.h>
+
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
@@ -625,7 +627,7 @@ start_here:
  * 24 Mbytes of data, and the 512k IMMR space.  Anything not covered by
  * these mappings is mapped by page tables.
  */
-initial_mmu:
+SYM_FUNC_START_LOCAL(initial_mmu)
 	li	r8, 0
 	mtspr	SPRN_MI_CTR, r8		/* remove PINNED ITLB entries */
 	lis	r10, MD_TWAM@h
@@ -686,6 +688,7 @@ initial_mmu:
 #endif
 	mtspr	SPRN_DER, r8
 	blr
+SYM_FUNC_END(initial_mmu)
 
 _GLOBAL(mmu_pin_tlb)
 	lis	r9, (1f - PAGE_OFFSET)@h
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 519b60695167..4af12447dc0b 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -18,6 +18,8 @@
 
 #include <linux/init.h>
 #include <linux/pgtable.h>
+#include <linux/linkage.h>
+
 #include <asm/reg.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
@@ -877,7 +879,7 @@ END_MMU_FTR_SECTION_IFCLR(MMU_FTR_HPTE_TABLE)
  * Load stuff into the MMU.  Intended to be called with
  * IR=0 and DR=0.
  */
-early_hash_table:
+SYM_FUNC_START_LOCAL(early_hash_table)
 	sync			/* Force all PTE updates to finish */
 	isync
 	tlbia			/* Clear all TLB entries */
@@ -888,8 +890,9 @@ early_hash_table:
 	ori	r6, r6, 3	/* 256kB table */
 	mtspr	SPRN_SDR1, r6
 	blr
+SYM_FUNC_END(early_hash_table)
 
-load_up_mmu:
+SYM_FUNC_START_LOCAL(load_up_mmu)
 	sync			/* Force all PTE updates to finish */
 	isync
 	tlbia			/* Clear all TLB entries */
@@ -918,6 +921,7 @@ BEGIN_MMU_FTR_SECTION
 	LOAD_BAT(7,r3,r4,r5)
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	blr
+SYM_FUNC_END(load_up_mmu)
 
 _GLOBAL(load_segment_registers)
 	li	r0, NUM_USER_SEGMENTS /* load up user segment register values */
@@ -1028,7 +1032,7 @@ END_MMU_FTR_SECTION_IFCLR(MMU_FTR_HPTE_TABLE)
  * this makes sure it's done.
  *  -- Cort
  */
-clear_bats:
+SYM_FUNC_START_LOCAL(clear_bats)
 	li	r10,0
 
 	mtspr	SPRN_DBAT0U,r10
@@ -1072,6 +1076,7 @@ BEGIN_MMU_FTR_SECTION
 	mtspr	SPRN_IBAT7L,r10
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	blr
+SYM_FUNC_END(clear_bats)
 
 _GLOBAL(update_bats)
 	lis	r4, 1f@h
@@ -1108,15 +1113,16 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	mtspr	SPRN_SRR1, r6
 	rfi
 
-flush_tlbs:
+SYM_FUNC_START_LOCAL(flush_tlbs)
 	lis	r10, 0x40
 1:	addic.	r10, r10, -0x1000
 	tlbie	r10
 	bgt	1b
 	sync
 	blr
+SYM_FUNC_END(flush_tlbs)
 
-mmu_off:
+SYM_FUNC_START_LOCAL(mmu_off)
  	addi	r4, r3, __after_mmu_off - _start
 	mfmsr	r3
 	andi.	r0,r3,MSR_DR|MSR_IR		/* MMU enabled? */
@@ -1128,9 +1134,10 @@ mmu_off:
 	mtspr	SPRN_SRR1,r3
 	sync
 	rfi
+SYM_FUNC_END(mmu_off)
 
 /* We use one BAT to map up to 256M of RAM at _PAGE_OFFSET */
-initial_bats:
+SYM_FUNC_START_LOCAL(initial_bats)
 	lis	r11,PAGE_OFFSET@h
 	tophys(r8,r11)
 #ifdef CONFIG_SMP
@@ -1146,9 +1153,10 @@ initial_bats:
 	mtspr	SPRN_IBAT0U,r11
 	isync
 	blr
+SYM_FUNC_END(initial_bats)
 
 #ifdef CONFIG_BOOTX_TEXT
-setup_disp_bat:
+SYM_FUNC_START_LOCAL(setup_disp_bat)
 	/*
 	 * setup the display bat prepared for us in prom.c
 	 */
@@ -1164,10 +1172,11 @@ setup_disp_bat:
 	mtspr	SPRN_DBAT3L,r8
 	mtspr	SPRN_DBAT3U,r11
 	blr
+SYM_FUNC_END(setup_disp_bat)
 #endif /* CONFIG_BOOTX_TEXT */
 
 #ifdef CONFIG_PPC_EARLY_DEBUG_CPM
-setup_cpm_bat:
+SYM_FUNC_START_LOCAL(setup_cpm_bat)
 	lis	r8, 0xf000
 	ori	r8, r8,	0x002a
 	mtspr	SPRN_DBAT1L, r8
@@ -1177,10 +1186,11 @@ setup_cpm_bat:
 	mtspr	SPRN_DBAT1U, r11
 
 	blr
+SYM_FUNC_END(setup_cpm_bat)
 #endif
 
 #ifdef CONFIG_PPC_EARLY_DEBUG_USBGECKO
-setup_usbgecko_bat:
+SYM_FUNC_START_LOCAL(setup_usbgecko_bat)
 	/* prepare a BAT for early io */
 #if defined(CONFIG_GAMECUBE)
 	lis	r8, 0x0c00
@@ -1199,6 +1209,7 @@ setup_usbgecko_bat:
 	mtspr	SPRN_DBAT1L, r8
 	mtspr	SPRN_DBAT1U, r11
 	blr
+SYM_FUNC_END(setup_usbgecko_bat)
 #endif
 
 	.data
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index f0db4f52bc00..744b096857a1 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -29,6 +29,8 @@
 #include <linux/init.h>
 #include <linux/threads.h>
 #include <linux/pgtable.h>
+#include <linux/linkage.h>
+
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
@@ -885,7 +887,7 @@ KernelSPE:
  * Translate the effec addr in r3 to phys addr. The phys addr will be put
  * into r3(higher 32bit) and r4(lower 32bit)
  */
-get_phys_addr:
+SYM_FUNC_START_LOCAL(get_phys_addr)
 	mfmsr	r8
 	mfspr	r9,SPRN_PID
 	rlwinm	r9,r9,16,0x3fff0000	/* turn PID into MAS6[SPID] */
@@ -907,6 +909,7 @@ get_phys_addr:
 	mfspr	r3,SPRN_MAS7
 #endif
 	blr
+SYM_FUNC_END(get_phys_addr)
 
 /*
  * Global functions
diff --git a/arch/powerpc/kernel/swsusp_32.S b/arch/powerpc/kernel/swsusp_32.S
index e0cbd63007f2..ffb79326483c 100644
--- a/arch/powerpc/kernel/swsusp_32.S
+++ b/arch/powerpc/kernel/swsusp_32.S
@@ -1,5 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/threads.h>
+#include <linux/linkage.h>
+
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/cputable.h>
@@ -400,7 +402,7 @@ _ASM_NOKPROBE_SYMBOL(swsusp_arch_resume)
 /* FIXME:This construct is actually not useful since we don't shut
  * down the instruction MMU, we could just flip back MSR-DR on.
  */
-turn_on_mmu:
+SYM_FUNC_START_LOCAL(turn_on_mmu)
 	mflr	r4
 	mtsrr0	r4
 	mtsrr1	r3
@@ -408,4 +410,5 @@ turn_on_mmu:
 	isync
 	rfi
 _ASM_NOKPROBE_SYMBOL(turn_on_mmu)
+SYM_FUNC_END(turn_on_mmu)
 
diff --git a/arch/powerpc/kvm/fpu.S b/arch/powerpc/kvm/fpu.S
index 315c94946bad..b68e7f26a81f 100644
--- a/arch/powerpc/kvm/fpu.S
+++ b/arch/powerpc/kvm/fpu.S
@@ -6,6 +6,8 @@
  */
 
 #include <linux/pgtable.h>
+#include <linux/linkage.h>
+
 #include <asm/reg.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
@@ -110,18 +112,22 @@ FPS_THREE_IN(fsel)
  * R8 = (double*)&param3 [load_three]
  * LR = instruction call function
  */
-fpd_load_three:
+SYM_FUNC_START_LOCAL(fpd_load_three)
 	lfd	2,0(r8)			/* load param3 */
-fpd_load_two:
+SYM_FUNC_START_LOCAL(fpd_load_two)
 	lfd	1,0(r7)			/* load param2 */
-fpd_load_one:
+SYM_FUNC_START_LOCAL(fpd_load_one)
 	lfd	0,0(r6)			/* load param1 */
-fpd_load_none:
+SYM_FUNC_START_LOCAL(fpd_load_none)
 	lfd	3,0(r3)			/* load up fpscr value */
 	MTFSF_L(3)
 	lwz	r6, 0(r4)		/* load cr */
 	mtcr	r6
 	blr
+SYM_FUNC_END(fpd_load_none)
+SYM_FUNC_END(fpd_load_one)
+SYM_FUNC_END(fpd_load_two)
+SYM_FUNC_END(fpd_load_three)
 
 /*
  * End of double instruction processing
@@ -131,13 +137,14 @@ fpd_load_none:
  * R5 = (double*)&result
  * LR = caller of instruction call function
  */
-fpd_return:
+SYM_FUNC_START_LOCAL(fpd_return)
 	mfcr	r6
 	stfd	0,0(r5)			/* save result */
 	mffs	0
 	stfd	0,0(r3)			/* save new fpscr value */
 	stw	r6,0(r4)		/* save new cr value */
 	blr
+SYM_FUNC_END(fpd_return)
 
 /*
  * Double operation with no input operand
diff --git a/arch/powerpc/platforms/52xx/lite5200_sleep.S b/arch/powerpc/platforms/52xx/lite5200_sleep.S
index afee8b1515a8..0b12647e7b42 100644
--- a/arch/powerpc/platforms/52xx/lite5200_sleep.S
+++ b/arch/powerpc/platforms/52xx/lite5200_sleep.S
@@ -1,4 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/linkage.h>
+
 #include <asm/reg.h>
 #include <asm/ppc_asm.h>
 #include <asm/processor.h>
@@ -178,7 +180,8 @@ sram_code:
 
 
 	/* local udelay in sram is needed */
-  udelay: /* r11 - tb_ticks_per_usec, r12 - usecs, overwrites r13 */
+SYM_FUNC_START_LOCAL(udelay)
+	/* r11 - tb_ticks_per_usec, r12 - usecs, overwrites r13 */
 	mullw	r12, r12, r11
 	mftb	r13	/* start */
 	add	r12, r13, r12 /* end */
@@ -187,6 +190,7 @@ sram_code:
 	cmp	cr0, r13, r12
 	blt	1b
 	blr
+SYM_FUNC_END(udelay)
 
 sram_code_end:
 
@@ -271,7 +275,7 @@ _ASM_NOKPROBE_SYMBOL(lite5200_wakeup)
 	SAVE_SR(n+2, addr+2);	\
 	SAVE_SR(n+3, addr+3);
 
-save_regs:
+SYM_FUNC_START_LOCAL(save_regs)
 	stw	r0, 0(r4)
 	stw	r1, 0x4(r4)
 	stw	r2, 0x8(r4)
@@ -317,6 +321,7 @@ save_regs:
 	SAVE_SPRN(TBRU,  0x5b)
 
 	blr
+SYM_FUNC_END(save_regs)
 
 
 /* restore registers */
@@ -336,7 +341,7 @@ save_regs:
 	LOAD_SR(n+2, addr+2);	\
 	LOAD_SR(n+3, addr+3);
 
-restore_regs:
+SYM_FUNC_START_LOCAL(restore_regs)
 	lis	r4, registers@h
 	ori	r4, r4, registers@l
 
@@ -393,6 +398,7 @@ restore_regs:
 
 	blr
 _ASM_NOKPROBE_SYMBOL(restore_regs)
+SYM_FUNC_END(restore_regs)
 
 
 
@@ -403,7 +409,7 @@ _ASM_NOKPROBE_SYMBOL(restore_regs)
  * Flush data cache
  * Do this by just reading lots of stuff into the cache.
  */
-flush_data_cache:
+SYM_FUNC_START_LOCAL(flush_data_cache)
 	lis	r3,CONFIG_KERNEL_START@h
 	ori	r3,r3,CONFIG_KERNEL_START@l
 	li	r4,NUM_CACHE_LINES
@@ -413,3 +419,4 @@ flush_data_cache:
 	addi	r3,r3,L1_CACHE_BYTES	/* Next line, please */
 	bdnz	1b
 	blr
+SYM_FUNC_END(flush_data_cache)
-- 
2.31.1

