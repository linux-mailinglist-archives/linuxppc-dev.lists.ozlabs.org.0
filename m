Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 117695A8E97
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 08:46:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJBRF00K5z3cdP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 16:46:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fgd5Bkhm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fgd5Bkhm;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJ9Ml0n6bz3bZB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 15:58:42 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2815YtAm009081;
	Thu, 1 Sep 2022 05:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2ceMbmuPz7+4lyZ0SYcNbtzSIgfdR2p6RPESoTtegSc=;
 b=Fgd5BkhmfbgAUL4Pu74lnMgtfTVFxwc4JjYdx1kbcgxQPgZ2qyAhVHLhF79Brp1Synhz
 0SQJFac4gG+xB3liEVFdMUQKNGuegWZ+csVVLh78yGxa0YTVjUMb40EbOvu08ALwgRde
 omUyXvyfsIGo9ynxo91a+rZXW6ymLsDVeF6gUGCLRC0dbvj0sU/w2bMG+jqOVtddiOA6
 r5j0ODZ3ZFnt78taJJ7AUhDr2oXh0LUg+9O+PyCUSa3TWbVFV1c3+ZAQ/ZXTW0wwvzMU
 DFM+c02Ko0Az/pS0Ydnr+tJum7q9pg6YQhrhsAN/Sa3/T2/yYN94sO0hHGRx88YXyfkE MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3japqf0sxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 05:58:36 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2815a1O7015863;
	Thu, 1 Sep 2022 05:58:36 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3japqf0swq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 05:58:36 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2815pqYO021978;
	Thu, 1 Sep 2022 05:58:34 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06ams.nl.ibm.com with ESMTP id 3j7ahj68w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 05:58:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2815wVY435062240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Sep 2022 05:58:31 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD02CAE051;
	Thu,  1 Sep 2022 05:58:31 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F419AE055;
	Thu,  1 Sep 2022 05:58:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  1 Sep 2022 05:58:31 +0000 (GMT)
Received: from beng-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D5A3A604D1;
	Thu,  1 Sep 2022 15:58:28 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/4] powerpc/64: Add support for out-of-line static calls
Date: Thu,  1 Sep 2022 15:58:22 +1000
Message-Id: <20220901055823.152983-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901055823.152983-1-bgray@linux.ibm.com>
References: <20220901055823.152983-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OICweyCOCxh8_wFUjuDB83OheXYOlIvT
X-Proofpoint-ORIG-GUID: ajxkcKND9i2hRpvZEhmjjZl7_VH09PCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_03,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1011
 phishscore=0 mlxlogscore=971 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010023
X-Mailman-Approved-At: Thu, 01 Sep 2022 16:45:35 +1000
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
Cc: christophe.leroy@c-s.fr, Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement static call support for 64 bit V2 ABI. This requires
making sure the TOC is kept correct across kernel-module
boundaries. As a secondary concern, it tries to use the local
entry point of a target wherever possible. It does so by
checking if both tramp & target are kernel code, and falls
back to detecting the common global entry point patterns
if modules are involved. Detecting the global entry point is
also required for setting the local entry point as the trampoline
target: if we cannot detect the local entry point, then we need to
convservatively initialise r12 and use the global entry point.

The implementation is incorrect as-is, because a trampoline cannot
use the stack. Doing so has the same issue described in 85baa095,
where parameters passed relative to the stack pointer (large arg count
or varargs) are broken. However the trampoline must guarantee the
TOC be restored before the caller uses it again.

Static call sites are themselves static, so it is feasible to handle
this by patching the callsites. However the linker currently
does not seem to realise that the trampoline treats r2 as volatile
(even with an alternative trampoline that does not have a separate
local entry point), and so does not insert the appropriate restoration
at the call site.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/Kconfig                     | 13 +++-
 arch/powerpc/include/asm/code-patching.h |  1 +
 arch/powerpc/include/asm/static_call.h   | 45 ++++++++++++-
 arch/powerpc/kernel/Makefile             |  3 +-
 arch/powerpc/kernel/static_call.c        | 80 ++++++++++++++++++++++--
 5 files changed, 132 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4c466acdc70d..1d5abbeb2c40 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -248,7 +248,7 @@ config PPC
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
 	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
-	select HAVE_STATIC_CALL			if PPC32
+	select HAVE_STATIC_CALL			if PPC_ENABLE_STATIC_CALL
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING
 	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
@@ -1023,6 +1023,17 @@ config PPC_RTAS_FILTER
 	  Say Y unless you know what you are doing and the filter is causing
 	  problems for you.
 
+config PPC_ENABLE_STATIC_CALL
+	bool "Enable static calls"
+	default y
+	depends on PPC32 || PPC64_ELF_ABI_V2
+	help
+	  PowerPC static calls with the ELF V2 ABI are not as straightforward
+	  as checking if the target is in range of a branch or not. They must
+	  also ensure the TOC remains consistent. This leads to complex
+	  performance results, so it's useful to make them configurable to
+	  allow testing with the generic implementation too.
+
 endmenu
 
 config ISA_DMA_API
diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 3de90748bce7..319cb1eef71c 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -126,6 +126,7 @@ int translate_branch(ppc_inst_t *instr, const u32 *dest, const u32 *src);
 bool is_conditional_branch(ppc_inst_t instr);
 
 #define OP_RT_RA_MASK	0xffff0000UL
+#define OP_SI_MASK	0x0000ffffUL
 #define LIS_R2		(PPC_RAW_LIS(_R2, 0))
 #define ADDIS_R2_R12	(PPC_RAW_ADDIS(_R2, _R12, 0))
 #define ADDI_R2_R2	(PPC_RAW_ADDI(_R2, _R2, 0))
diff --git a/arch/powerpc/include/asm/static_call.h b/arch/powerpc/include/asm/static_call.h
index de1018cc522b..d85ff3f88c8e 100644
--- a/arch/powerpc/include/asm/static_call.h
+++ b/arch/powerpc/include/asm/static_call.h
@@ -2,12 +2,49 @@
 #ifndef _ASM_POWERPC_STATIC_CALL_H
 #define _ASM_POWERPC_STATIC_CALL_H
 
+#if defined(CONFIG_PPC64_ELF_ABI_V2)
+
+#define __PPC_SCT(name, inst)					\
+	asm(".pushsection .text, \"ax\"				\n"	\
+	    ".align 6						\n"	\
+	    ".globl " STATIC_CALL_TRAMP_STR(name) "		\n"	\
+	    STATIC_CALL_TRAMP_STR(name) ":			\n"	\
+	    "	addis	2, 12, (.TOC.-" STATIC_CALL_TRAMP_STR(name) ")@ha \n"	\
+	    "	addi	2, 2, (.TOC.-" STATIC_CALL_TRAMP_STR(name) ")@l   \n"	\
+	    ".localentry " STATIC_CALL_TRAMP_STR(name) ", .-" STATIC_CALL_TRAMP_STR(name) "\n" \
+	    "	" inst "					\n"	\
+	    "	mflr	0					\n"	\
+	    "	std	0, 16(1)				\n"	\
+	    "	stdu	1, -32(1)				\n"	\
+	    "	std	2, 24(1)				\n"	\
+	    "	addis	12, 2, 2f@toc@ha			\n"	\
+	    "	ld	12, 2f@toc@l(12)			\n"	\
+	    "	mtctr	12					\n"	\
+	    "	bctrl						\n"	\
+	    "	ld	2, 24(1)				\n"	\
+	    "	addi	1, 1, 32				\n"	\
+	    "	ld	0, 16(1)				\n"	\
+	    "	mtlr	0					\n"	\
+	    "	blr						\n"	\
+	    "1:	li	3, 0					\n"	\
+	    "	blr						\n"	\
+	    ".balign 8						\n"	\
+	    "2:	.8byte 0					\n"	\
+	    ".type " STATIC_CALL_TRAMP_STR(name) ", @function	\n"	\
+	    ".size " STATIC_CALL_TRAMP_STR(name) ", . - " STATIC_CALL_TRAMP_STR(name) " \n" \
+	    ".popsection					\n")
+
+#define PPC_SCT_RET0		64		/* Offset of label 1 */
+#define PPC_SCT_DATA		72		/* Offset of label 2 (aligned) */
+
+#elif defined(PPC32)
+
 #define __PPC_SCT(name, inst)					\
 	asm(".pushsection .text, \"ax\"				\n"	\
 	    ".align 5						\n"	\
 	    ".globl " STATIC_CALL_TRAMP_STR(name) "		\n"	\
 	    STATIC_CALL_TRAMP_STR(name) ":			\n"	\
-	    inst "						\n"	\
+	    "	" inst "					\n"	\
 	    "	lis	12,2f@ha				\n"	\
 	    "	lwz	12,2f@l(12)				\n"	\
 	    "	mtctr	12					\n"	\
@@ -22,8 +59,12 @@
 #define PPC_SCT_RET0		20		/* Offset of label 1 */
 #define PPC_SCT_DATA		28		/* Offset of label 2 */
 
+#else /* !CONFIG_PPC64_ELF_ABI_V2 && !PPC32 */
+#error "Unsupported ABI"
+#endif /* CONFIG_PPC64_ELF_ABI_V2 */
+
 #define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)	__PPC_SCT(name, "b " #func)
 #define ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)	__PPC_SCT(name, "blr")
-#define ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)	__PPC_SCT(name, "b .+20")
+#define ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)	__PPC_SCT(name, "b 1f")
 
 #endif /* _ASM_POWERPC_STATIC_CALL_H */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 06d2d1f78f71..a30d0d0f5499 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -128,8 +128,9 @@ extra-y				+= vmlinux.lds
 
 obj-$(CONFIG_RELOCATABLE)	+= reloc_$(BITS).o
 
-obj-$(CONFIG_PPC32)		+= entry_32.o setup_32.o early_32.o static_call.o
+obj-$(CONFIG_PPC32)		+= entry_32.o setup_32.o early_32.o
 obj-$(CONFIG_PPC64)		+= dma-iommu.o iommu.o
+obj-$(CONFIG_HAVE_STATIC_CALL)	+= static_call.o
 obj-$(CONFIG_KGDB)		+= kgdb.o
 obj-$(CONFIG_BOOTX_TEXT)	+= btext.o
 obj-$(CONFIG_SMP)		+= smp.o
diff --git a/arch/powerpc/kernel/static_call.c b/arch/powerpc/kernel/static_call.c
index 863a7aa24650..ed3bc361fdb0 100644
--- a/arch/powerpc/kernel/static_call.c
+++ b/arch/powerpc/kernel/static_call.c
@@ -1,33 +1,101 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <asm/code-patching.h>
+#include <linux/export.h>
+#include <linux/kconfig.h>
+#include <linux/kernel.h>
 #include <linux/memory.h>
 #include <linux/static_call.h>
+#include <linux/syscalls.h>
 
-#include <asm/code-patching.h>
+#ifdef CONFIG_PPC64_ELF_ABI_V2
+
+static void* ppc_function_toc(u32 *func) {
+	u32 insn1 = *func;
+	u32 insn2 = *(func+1);
+	u64 si1 = sign_extend64((insn1 & OP_SI_MASK) << 16, 31);
+	u64 si2 = sign_extend64(insn2 & OP_SI_MASK, 15);
+	u64 addr = ((u64) func + si1) + si2;
+
+	if ((((insn1 & OP_RT_RA_MASK) == ADDIS_R2_R12) ||
+	     ((insn1 & OP_RT_RA_MASK) == LIS_R2)) &&
+	    ((insn2 & OP_RT_RA_MASK) == ADDI_R2_R2))
+		return (void*) addr;
+	else
+		return NULL;
+}
+
+static bool shares_toc(void *func1, void *func2) {
+	void* func1_toc;
+	void* func2_toc;
+
+	if (func1 == NULL || func2 == NULL)
+		return false;
+
+	/* Assume the kernel only uses a single TOC */
+	if (core_kernel_text((unsigned long)func1) &&
+	    core_kernel_text((unsigned long)func2))
+		return true;
+
+	/* Fall back to calculating the TOC from common patterns
+	 * if modules are involved
+	 */
+	func1_toc = ppc_function_toc(func1);
+	func2_toc = ppc_function_toc(func2);
+	return func1_toc != NULL && func2_toc != NULL && (func1_toc == func2_toc);
+}
+
+#endif /* CONFIG_PPC64_ELF_ABI_V2 */
 
 void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
 {
 	int err;
 	bool is_ret0 = (func == __static_call_return0);
 	unsigned long target = (unsigned long)(is_ret0 ? tramp + PPC_SCT_RET0 : func);
-	bool is_short = is_offset_in_branch_range((long)target - (long)tramp);
+	bool is_short;
+	void* tramp_entry;
 
 	if (!tramp)
 		return;
 
+	tramp_entry = (void*)ppc_function_entry(tramp);
+
+#ifdef CONFIG_PPC64_ELF_ABI_V2
+	if (shares_toc(tramp, (void*)target)) {
+		/* Confirm that the local entry point is in range */
+		is_short = is_offset_in_branch_range(
+			(long)ppc_function_entry((void*)target) - (long)tramp_entry);
+	} else {
+		/* Combine out-of-range with not sharing a TOC. Though it's possible an
+		 * out-of-range target shares a TOC, handling this separately complicates
+		 * the trampoline. It's simpler to always use the global entry point
+		 * in this case.
+		 */
+		is_short = false;
+	}
+#else /* !CONFIG_PPC64_ELF_ABI_V2 */
+	is_short = is_offset_in_branch_range((long)target - (long)tramp);
+#endif /* CONFIG_PPC64_ELF_ABI_V2 */
+
 	mutex_lock(&text_mutex);
 
 	if (func && !is_short) {
-		err = patch_instruction(tramp + PPC_SCT_DATA, ppc_inst(target));
+		/* This assumes that the update is atomic. The current implementation uses
+		 * stw/std and the store location is aligned. A sync is issued by one of the
+		 * patch_instruction/patch_branch functions below.
+		 */
+		err = PTR_ERR_OR_ZERO(patch_memory(
+			tramp + PPC_SCT_DATA, &target, sizeof(target)));
 		if (err)
 			goto out;
 	}
 
 	if (!func)
-		err = patch_instruction(tramp, ppc_inst(PPC_RAW_BLR()));
+		err = patch_instruction(tramp_entry, ppc_inst(PPC_RAW_BLR()));
 	else if (is_short)
-		err = patch_branch(tramp, target, 0);
+		err = patch_branch(tramp_entry, ppc_function_entry((void*) target), 0);
 	else
-		err = patch_instruction(tramp, ppc_inst(PPC_RAW_NOP()));
+		err = patch_instruction(tramp_entry, ppc_inst(PPC_RAW_NOP()));
+
 out:
 	mutex_unlock(&text_mutex);
 
-- 
2.37.2

