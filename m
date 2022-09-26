Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4C65E99DB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:49:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbYJS09clz3f90
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:49:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bAXIREln;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bAXIREln;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbYCQ0fPfz30MT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:44:49 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q4ZOMP024487;
	Mon, 26 Sep 2022 06:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=s+dyVnTUUL+TV0F1U7ucCK83xOS/uKhnZDux4PKWMVA=;
 b=bAXIRElnx2Mkk4ltPA75rEgZUk3h1XQROStCm+DQnPh+o1rfBro1qkZntWwh2b9j2M9v
 z8j5dC3U7Wiudxw240HAAdqsWmm6l7n7UTkIvefQnbQYCtWdS3DevaljeWEOQq1/f87m
 idtVaHaGeCKkZ56S7eBxvLe3YKHHmlUz0Ypc0Q/dDuPRcYN/w3jU4Wj7rzOp+kL5YOjf
 yEe8aiBT2p1pZT1YXXtbA87TMeXsgn61vLMVTIZhN+RysEALTorNbqwp+eikLveNIQoK
 7MFXTAmQq3rLuIS6yZFE2LzvRnBRlknQnCYZwpxwpt4C89OSgMuS+04lYZxi91JVAIwe Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtb6u57k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:44:02 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28Q6i1Er030474;
	Mon, 26 Sep 2022 06:44:01 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtb6u57j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:44:01 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28Q6ZOxa023332;
	Mon, 26 Sep 2022 06:43:59 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3jss5j20fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:43:59 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28Q6hvCN47579452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Sep 2022 06:43:57 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E9E96AE051;
	Mon, 26 Sep 2022 06:43:56 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46C1FAE045;
	Mon, 26 Sep 2022 06:43:56 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 26 Sep 2022 06:43:56 +0000 (GMT)
Received: from beng-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6C494605A5;
	Mon, 26 Sep 2022 16:43:54 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/6] powerpc/64: Add support for out-of-line static calls
Date: Mon, 26 Sep 2022 16:43:15 +1000
Message-Id: <20220926064316.765967-6-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926064316.765967-1-bgray@linux.ibm.com>
References: <20220926064316.765967-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TyEHX6T5KA-HqW3QG7fzGRrkxWjDicVV
X-Proofpoint-GUID: mYflydTudXsyrA5KR3kas7B91c6gF9RV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_04,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260039
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
Cc: christophe.leroy@c-s.fr, ajd@linux.ibm.com, peterz@infradead.org, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, ardb@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, jpoimboe@kernel.org
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

The trampolines are marked with `.localentry NAME, 1` to make the
linker save and restore the TOC on each call to the trampoline. This
allows the trampoline to safely target functions with different TOC
values.

However this directive also implies the TOC is not initialised on entry
to the trampoline. The kernel TOC is easily found in the PACA, but not
an arbitrary module TOC. Therefore the trampoline implementation depends
on whether it's in the kernel or not. If in the kernel, we initialise
the TOC using the PACA. If in a module, we have to initialise the TOC
with zero context, so it's quite expensive.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/Kconfig                     |  2 +-
 arch/powerpc/include/asm/code-patching.h |  1 +
 arch/powerpc/include/asm/static_call.h   | 80 +++++++++++++++++++--
 arch/powerpc/kernel/Makefile             |  3 +-
 arch/powerpc/kernel/static_call.c        | 90 ++++++++++++++++++++++--
 5 files changed, 164 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4c466acdc70d..e7a66635eade 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -248,7 +248,7 @@ config PPC
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
 	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
-	select HAVE_STATIC_CALL			if PPC32
+	select HAVE_STATIC_CALL			if PPC32 || PPC64_ELF_ABI_V2
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING
 	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 15efd8ab22da..8d1850080af8 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -132,6 +132,7 @@ int translate_branch(ppc_inst_t *instr, const u32 *dest, const u32 *src);
 bool is_conditional_branch(ppc_inst_t instr);
 
 #define OP_RT_RA_MASK	0xffff0000UL
+#define OP_SI_MASK	0x0000ffffUL
 #define LIS_R2		(PPC_RAW_LIS(_R2, 0))
 #define ADDIS_R2_R12	(PPC_RAW_ADDIS(_R2, _R12, 0))
 #define ADDI_R2_R2	(PPC_RAW_ADDI(_R2, _R2, 0))
diff --git a/arch/powerpc/include/asm/static_call.h b/arch/powerpc/include/asm/static_call.h
index de1018cc522b..3d6e82200cb7 100644
--- a/arch/powerpc/include/asm/static_call.h
+++ b/arch/powerpc/include/asm/static_call.h
@@ -2,12 +2,75 @@
 #ifndef _ASM_POWERPC_STATIC_CALL_H
 #define _ASM_POWERPC_STATIC_CALL_H
 
+#ifdef CONFIG_PPC64_ELF_ABI_V2
+
+#ifdef MODULE
+
+#define __PPC_SCT(name, inst)					\
+	asm(".pushsection .text, \"ax\"				\n"	\
+	    ".align 6						\n"	\
+	    ".globl " STATIC_CALL_TRAMP_STR(name) "		\n"	\
+	    ".localentry " STATIC_CALL_TRAMP_STR(name) ", 1	\n"	\
+	    STATIC_CALL_TRAMP_STR(name) ":			\n"	\
+	    "	mflr	11					\n"	\
+	    "	bcl	20, 31, $+4				\n"	\
+	    "0:	mflr	12					\n"	\
+	    "	mtlr	11					\n"	\
+	    "	addi	12, 12, (" STATIC_CALL_TRAMP_STR(name) " - 0b)	\n"	\
+	    "	addis 2, 12, (.TOC.-" STATIC_CALL_TRAMP_STR(name) ")@ha	\n"	\
+	    "	addi 2, 2, (.TOC.-" STATIC_CALL_TRAMP_STR(name) ")@l	\n"	\
+	    "	" inst "					\n"	\
+	    "	ld	12, (2f - " STATIC_CALL_TRAMP_STR(name) ")(12)	\n"	\
+	    "	mtctr	12					\n"	\
+	    "	bctr						\n"	\
+	    "1:	li	3, 0					\n"	\
+	    "	blr						\n"	\
+	    ".balign 8						\n"	\
+	    "2:	.8byte 0					\n"	\
+	    ".type " STATIC_CALL_TRAMP_STR(name) ", @function	\n"	\
+	    ".size " STATIC_CALL_TRAMP_STR(name) ", . - " STATIC_CALL_TRAMP_STR(name) " \n" \
+	    ".popsection					\n")
+
+#else /* KERNEL */
+
+#define __PPC_SCT(name, inst)					\
+	asm(".pushsection .text, \"ax\"				\n"	\
+	    ".align 5						\n"	\
+	    ".globl " STATIC_CALL_TRAMP_STR(name) "		\n"	\
+	    ".localentry " STATIC_CALL_TRAMP_STR(name) ", 1	\n"	\
+	    STATIC_CALL_TRAMP_STR(name) ":			\n"	\
+	    "	ld	2, 16(13)				\n"	\
+	    "	" inst "					\n"	\
+	    "	addis	12, 2, 2f@toc@ha			\n"	\
+	    "	ld	12, 2f@toc@l(12)			\n"	\
+	    "	mtctr	12					\n"	\
+	    "	bctr						\n"	\
+	    "1:	li	3, 0					\n"	\
+	    "	blr						\n"	\
+	    ".balign 8						\n"	\
+	    "2:	.8byte 0					\n"	\
+	    ".type " STATIC_CALL_TRAMP_STR(name) ", @function	\n"	\
+	    ".size " STATIC_CALL_TRAMP_STR(name) ", . - " STATIC_CALL_TRAMP_STR(name) " \n" \
+	    ".popsection					\n")
+
+#endif /* MODULE */
+
+#define PPC_SCT_INST_MODULE		28		/* Offset of instruction to update */
+#define PPC_SCT_RET0_MODULE		44		/* Offset of label 1 */
+#define PPC_SCT_DATA_MODULE		56		/* Offset of label 2 (aligned) */
+
+#define PPC_SCT_INST_KERNEL		4		/* Offset of instruction to update */
+#define PPC_SCT_RET0_KERNEL		24		/* Offset of label 1 */
+#define PPC_SCT_DATA_KERNEL		32		/* Offset of label 2 (aligned) */
+
+#elif defined(CONFIG_PPC32)
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
@@ -19,11 +82,20 @@
 	    ".size " STATIC_CALL_TRAMP_STR(name) ", . - " STATIC_CALL_TRAMP_STR(name) " \n" \
 	    ".popsection					\n")
 
-#define PPC_SCT_RET0		20		/* Offset of label 1 */
-#define PPC_SCT_DATA		28		/* Offset of label 2 */
+#define PPC_SCT_INST_MODULE		0		/* Offset of instruction to update */
+#define PPC_SCT_RET0_MODULE		20		/* Offset of label 1 */
+#define PPC_SCT_DATA_MODULE		28		/* Offset of label 2 */
+
+#define PPC_SCT_INST_KERNEL		PPC_SCT_INST_MODULE
+#define PPC_SCT_RET0_KERNEL		PPC_SCT_RET0_MODULE
+#define PPC_SCT_DATA_KERNEL		PPC_SCT_DATA_MODULE
+
+#else /* !CONFIG_PPC64_ELF_ABI_V2 && !CONFIG_PPC32 */
+#error "Unsupported ABI"
+#endif /* CONFIG_PPC64_ELF_ABI_V2 */
 
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
index 863a7aa24650..ecbb74e1b4d3 100644
--- a/arch/powerpc/kernel/static_call.c
+++ b/arch/powerpc/kernel/static_call.c
@@ -4,30 +4,108 @@
 
 #include <asm/code-patching.h>
 
+static void* ppc_function_toc(u32 *func)
+{
+#ifdef CONFIG_PPC64_ELF_ABI_V2
+	u32 insn1 = *func;
+	u32 insn2 = *(func+1);
+	u64 si1 = sign_extend64((insn1 & OP_SI_MASK) << 16, 31);
+	u64 si2 = sign_extend64(insn2 & OP_SI_MASK, 15);
+	u64 addr = ((u64) func + si1) + si2;
+
+	if ((((insn1 & OP_RT_RA_MASK) == ADDIS_R2_R12) ||
+	     ((insn1 & OP_RT_RA_MASK) == LIS_R2)) &&
+	    ((insn2 & OP_RT_RA_MASK) == ADDI_R2_R2))
+		return (void*)addr;
+#endif
+	return NULL;
+}
+
+static bool shares_toc(void *func1, void *func2)
+{
+	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2)) {
+		void* func1_toc;
+		void* func2_toc;
+
+		if (func1 == NULL || func2 == NULL)
+			return false;
+
+		/* Assume the kernel only uses a single TOC */
+		if (core_kernel_text((unsigned long)func1) &&
+		    core_kernel_text((unsigned long)func2))
+			return true;
+
+		/* Fall back to calculating the TOC from common patterns
+		 * if modules are involved
+		 */
+		func1_toc = ppc_function_toc(func1);
+		func2_toc = ppc_function_toc(func2);
+		return func1_toc != NULL && func2_toc != NULL && (func1_toc == func2_toc);
+	}
+
+	return true;
+}
+
+static void* get_inst_addr(void *tramp)
+{
+	return tramp + (core_kernel_text((unsigned long)tramp)
+				? PPC_SCT_INST_KERNEL
+				: PPC_SCT_INST_MODULE);
+}
+
+static void* get_ret0_addr(void* tramp)
+{
+	return tramp + (core_kernel_text((unsigned long)tramp)
+				? PPC_SCT_RET0_KERNEL
+				: PPC_SCT_RET0_MODULE);
+}
+
+static void* get_data_addr(void *tramp)
+{
+	return tramp + (core_kernel_text((unsigned long) tramp)
+				? PPC_SCT_DATA_KERNEL
+				: PPC_SCT_DATA_MODULE);
+}
+
 void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
 {
 	int err;
 	bool is_ret0 = (func == __static_call_return0);
-	unsigned long target = (unsigned long)(is_ret0 ? tramp + PPC_SCT_RET0 : func);
-	bool is_short = is_offset_in_branch_range((long)target - (long)tramp);
+	bool is_short;
+	void* target = is_ret0 ? get_ret0_addr(tramp) : func;
+	void* tramp_inst = get_inst_addr(tramp);
 
 	if (!tramp)
 		return;
 
+	if (is_ret0)
+		is_short = true;
+	else if (shares_toc(tramp, target))
+		is_short = is_offset_in_branch_range(
+			(long)ppc_function_entry(target) - (long)tramp_inst);
+	else
+		/* Combine out-of-range with not sharing a TOC. Though it's possible an
+		 * out-of-range target shares a TOC, handling this separately complicates
+		 * the trampoline. It's simpler to always use the global entry point
+		 * in this case.
+		 */
+		is_short = false;
+
 	mutex_lock(&text_mutex);
 
 	if (func && !is_short) {
-		err = patch_instruction(tramp + PPC_SCT_DATA, ppc_inst(target));
+		err = patch_memory(get_data_addr(tramp), target);
 		if (err)
 			goto out;
 	}
 
 	if (!func)
-		err = patch_instruction(tramp, ppc_inst(PPC_RAW_BLR()));
+		err = patch_instruction(tramp_inst, ppc_inst(PPC_RAW_BLR()));
 	else if (is_short)
-		err = patch_branch(tramp, target, 0);
+		err = patch_branch(tramp_inst, ppc_function_entry(target), 0);
 	else
-		err = patch_instruction(tramp, ppc_inst(PPC_RAW_NOP()));
+		err = patch_instruction(tramp_inst, ppc_inst(PPC_RAW_NOP()));
+
 out:
 	mutex_unlock(&text_mutex);
 
-- 
2.37.3

