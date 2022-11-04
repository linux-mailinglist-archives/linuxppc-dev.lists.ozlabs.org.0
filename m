Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD51619EC4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 18:32:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3nkB46CRz3f6l
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Nov 2022 04:32:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SYmONNRy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SYmONNRy;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3nfC5fw7z30JR
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Nov 2022 04:28:35 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4HO4q5026780;
	Fri, 4 Nov 2022 17:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5oG9VLNTKWFZZSjnnN91d7FXuieKou49WS7o/zIMUEE=;
 b=SYmONNRyj2nA6xoWwXwQ3CflYcGaT9abJgkFzN4TnAQcXBqg08yCIbv3zyKoqIBhbDV0
 x8/e6J/HxMNapVrshDk00RT1a02ZxEuP8qh/Fi1NuwDtXtUE+SAFEGUbtiMZgCfCZg0N
 jhIJJFYuAJI3791aBr8yMVr7ZRIUzmope8wJnSopG3b+HFSvPTWb3eIWwLrT/p4LXRGh
 dD/emUBogvUYT2FxKH1wumncDIxvXxzAVeoMOzGaI0k/ownBd9W7aO4zaHn99Dm7P4aB
 0NMze/yF4wxucSfxo7PSo6rzUGp58wpGpNowr8JnSBy2ZXGYmKxKD/VGDGBvP6dgFM9n bA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kn246c1ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 17:28:19 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A4HLJl1024103;
	Fri, 4 Nov 2022 17:28:17 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06fra.de.ibm.com with ESMTP id 3kguejg0r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 17:28:17 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A4HMeZ450659586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Nov 2022 17:22:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5ABCA405B;
	Fri,  4 Nov 2022 17:28:14 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36D84A4054;
	Fri,  4 Nov 2022 17:28:14 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  4 Nov 2022 17:28:14 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ibmuc.com (unknown [9.43.196.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AE79E60100;
	Sat,  5 Nov 2022 04:28:10 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/6] powerpc/64s: Helpers to switch between linear and vmapped stack pointers
Date: Sat,  5 Nov 2022 04:27:33 +1100
Message-Id: <20221104172737.391978-3-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104172737.391978-1-ajd@linux.ibm.com>
References: <20221104172737.391978-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jprTIc7_8JhXsZK2E0BDu5H4nrRSFOhf
X-Proofpoint-GUID: jprTIc7_8JhXsZK2E0BDu5H4nrRSFOhf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_11,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040108
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
Cc: linux-hardening@vger.kernel.org, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc unfortunately has too many places where we run stuff in real mode.

With CONFIG_VMAP_STACK enabled, this means we need to be able to swap the
stack pointer to use the linear mapping when we enter a real mode section,
and back afterwards.

Store the top bits of the stack pointer in both the linear map and the
vmalloc space in the PACA, and add some helper macros/functions to swap
between them.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

---

Some of the helpers that are currently unused will be used in the next
version of the series for the KVM real mode handling
---
 arch/powerpc/include/asm/book3s/64/stack.h | 71 ++++++++++++++++++++++
 arch/powerpc/include/asm/opal.h            |  1 +
 arch/powerpc/include/asm/paca.h            |  4 ++
 arch/powerpc/include/asm/processor.h       |  6 ++
 arch/powerpc/kernel/asm-offsets.c          |  8 +++
 arch/powerpc/kernel/entry_64.S             |  7 +++
 arch/powerpc/kernel/process.c              |  4 ++
 arch/powerpc/kernel/smp.c                  |  7 +++
 arch/powerpc/xmon/xmon.c                   |  4 ++
 9 files changed, 112 insertions(+)
 create mode 100644 arch/powerpc/include/asm/book3s/64/stack.h

diff --git a/arch/powerpc/include/asm/book3s/64/stack.h b/arch/powerpc/include/asm/book3s/64/stack.h
new file mode 100644
index 000000000000..6b31adb1a026
--- /dev/null
+++ b/arch/powerpc/include/asm/book3s/64/stack.h
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+// Helpers for VMAP_STACK on book3s64
+// Copyright (C) 2022 IBM Corporation (Andrew Donnellan)
+
+#ifndef _ASM_POWERPC_BOOK3S_64_STACK_H
+#define _ASM_POWERPC_BOOK3S_64_STACK_H
+
+#include <asm/thread_info.h>
+
+#if defined(CONFIG_VMAP_STACK) && defined(CONFIG_PPC_BOOK3S_64)
+
+#ifdef __ASSEMBLY__
+// Switch the current stack pointer in r1 between a linear map address and a
+// vmalloc address. Used when we need to go in and out of real mode with
+// CONFIG_VMAP_STACK enabled.
+//
+// tmp: scratch register that can be clobbered
+
+#define SWAP_STACK_LINEAR(tmp)			\
+	ld	tmp, PACAKSTACK_LINEAR_BASE(r13);	\
+	andi.	r1, r1, THREAD_SIZE - 1;		\
+	or	r1, r1, tmp;
+#define SWAP_STACK_VMALLOC(tmp)			\
+	ld	tmp, PACAKSTACK_VMALLOC_BASE(r13);	\
+	andi.	r1, r1, THREAD_SIZE - 1;		\
+	or	r1, r1, tmp;
+
+#else // __ASSEMBLY__
+
+#include <asm/paca.h>
+#include <asm/reg.h>
+#include <linux/mm.h>
+
+#define stack_pa(ptr) (is_vmalloc_addr((ptr)) ? (void *)vmalloc_to_phys((void *)(ptr)) : (void *)ptr)
+
+static __always_inline void swap_stack_linear(void)
+{
+	current_stack_pointer = get_paca()->kstack_linear_base |	\
+		(current_stack_pointer & (THREAD_SIZE - 1));
+}
+
+static __always_inline void swap_stack_vmalloc(void)
+{
+	current_stack_pointer = get_paca()->kstack_vmalloc_base |	\
+		(current_stack_pointer & (THREAD_SIZE - 1));
+}
+
+#endif // __ASSEMBLY__
+
+#else // CONFIG_VMAP_STACK && CONFIG_PPC_BOOK3S_64
+
+#define SWAP_STACK_LINEAR(tmp)
+#define SWAP_STACK_VMALLOC(tmp)
+
+static __always_inline void *stack_pa(void *ptr)
+{
+	return ptr;
+}
+
+static __always_inline void swap_stack_linear(void)
+{
+}
+
+static __always_inline void swap_stack_vmalloc(void)
+{
+}
+
+#endif // CONFIG_VMAP_STACK && CONFIG_PPC_BOOK3S_64
+
+#endif // _ASM_POWERPC_BOOK3S_64_STACK_H
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 726125a534de..0360360ad2cf 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -13,6 +13,7 @@
 #ifndef __ASSEMBLY__
 
 #include <linux/notifier.h>
+#include <asm/book3s/64/stack.h>
 
 /* We calculate number of sg entries based on PAGE_SIZE */
 #define SG_ENTRIES_PER_NODE ((PAGE_SIZE - 16) / sizeof(struct opal_sg_entry))
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 09f1790d0ae1..51d060036fa1 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -163,6 +163,10 @@ struct paca_struct {
 	 */
 	struct task_struct *__current;	/* Pointer to current */
 	u64 kstack;			/* Saved Kernel stack addr */
+#if defined(CONFIG_VMAP_STACK) && defined(CONFIG_PPC_BOOK3S_64)
+	u64 kstack_vmalloc_base;	/* Base address of stack in the vmalloc mapping */
+	u64 kstack_linear_base;		/* Base address of stack in the linear mapping */
+#endif /* CONFIG_VMAP_STACK && CONFIG_PPC_BOOK3S_64 */
 	u64 saved_r1;			/* r1 save for RTAS calls or PM or EE=0 */
 	u64 saved_msr;			/* MSR saved here by enter_rtas */
 #ifdef CONFIG_PPC64
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 631802999d59..999078452aa4 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -132,6 +132,12 @@ struct debug_reg {
 
 struct thread_struct {
 	unsigned long	ksp;		/* Kernel stack pointer */
+#if defined(CONFIG_VMAP_STACK) && defined(CONFIG_PPC_BOOK3S_64)
+	// Kernel stack base addresses in vmalloc and linear mappings
+	// Used for swapping to linear map in real mode code
+	unsigned long	ksp_vmalloc_base;
+	unsigned long	ksp_linear_base;
+#endif /* CONFIG_VMAP_STACK && CONFIG_PPC_BOOK3S_64 */
 
 #ifdef CONFIG_PPC64
 	unsigned long	ksp_vsid;
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 4ce2a4aa3985..46ace958d3ce 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -99,6 +99,10 @@ int main(void)
 #endif
 
 	OFFSET(KSP, thread_struct, ksp);
+#ifdef CONFIG_VMAP_STACK
+	OFFSET(KSP_VMALLOC_BASE, thread_struct, ksp_vmalloc_base);
+	OFFSET(KSP_LINEAR_BASE, thread_struct, ksp_linear_base);
+#endif /* CONFIG_VMAP_STACK */
 	OFFSET(PT_REGS, thread_struct, regs);
 #ifdef CONFIG_BOOKE
 	OFFSET(THREAD_NORMSAVES, thread_struct, normsave[0]);
@@ -181,6 +185,10 @@ int main(void)
 	OFFSET(PACAPACAINDEX, paca_struct, paca_index);
 	OFFSET(PACAPROCSTART, paca_struct, cpu_start);
 	OFFSET(PACAKSAVE, paca_struct, kstack);
+#if defined(CONFIG_VMAP_STACK) && defined(CONFIG_PPC_BOOK3S_64)
+	OFFSET(PACAKSTACK_VMALLOC_BASE, paca_struct, kstack_vmalloc_base);
+	OFFSET(PACAKSTACK_LINEAR_BASE, paca_struct, kstack_linear_base);
+#endif /* CONFIG_VMAP_STACK && CONFIG_PPC_BOOK3S_64 */
 	OFFSET(PACACURRENT, paca_struct, __current);
 	DEFINE(PACA_THREAD_INFO, offsetof(struct paca_struct, __current) +
 				 offsetof(struct task_struct, thread_info));
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index af25db6e0205..cd9e56b25934 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -253,6 +253,13 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	mr	r1,r8		/* start using new stack pointer */
 	std	r7,PACAKSAVE(r13)
 
+#if defined(CONFIG_VMAP_STACK) && defined(CONFIG_PPC_BOOK3S_64)
+	ld	r8,KSP_LINEAR_BASE(r4)
+	std	r8,PACAKSTACK_LINEAR_BASE(r13)
+	ld	r8,KSP_VMALLOC_BASE(r4)
+	std	r8,PACAKSTACK_VMALLOC_BASE(r13)
+#endif /* CONFIG_VMAP_STACK && CONFIG_PPC_BOOK3S_64 */
+
 	ld	r6,_CCR(r1)
 	mtcrf	0xFF,r6
 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 67da147fe34d..07917726c629 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1782,6 +1782,10 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	kregs = (struct pt_regs *) sp;
 	sp -= STACK_FRAME_OVERHEAD;
 	p->thread.ksp = sp;
+#if defined(CONFIG_VMAP_STACK) && defined(CONFIG_PPC_BOOK3S_64)
+	p->thread.ksp_vmalloc_base = sp & ~(THREAD_SIZE - 1);
+	p->thread.ksp_linear_base = (u64)__va(vmalloc_to_pfn((void *)sp) << PAGE_SHIFT);
+#endif /* CONFIG_VMAP_STACK && CONFIG_PPC_BOOK3S_64 */
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 	for (i = 0; i < nr_wp_slots(); i++)
 		p->thread.ptrace_bps[i] = NULL;
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 0da6e59161cd..466ccab5adb8 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -60,6 +60,7 @@
 #include <asm/ftrace.h>
 #include <asm/kup.h>
 #include <asm/fadump.h>
+#include <asm/book3s/64/stack.h>
 
 #ifdef DEBUG
 #include <asm/udbg.h>
@@ -1250,6 +1251,12 @@ static void cpu_idle_thread_init(unsigned int cpu, struct task_struct *idle)
 	paca_ptrs[cpu]->__current = idle;
 	paca_ptrs[cpu]->kstack = (unsigned long)task_stack_page(idle) +
 				 THREAD_SIZE - STACK_FRAME_OVERHEAD;
+#if defined(CONFIG_VMAP_STACK) && defined(CONFIG_PPC_BOOK3S_64)
+	paca_ptrs[cpu]->kstack_linear_base = is_vmalloc_addr((void *)paca_ptrs[cpu]->kstack) ?
+		vmalloc_to_phys((void *)(paca_ptrs[cpu]->kstack)) :
+		paca_ptrs[cpu]->kstack;
+	paca_ptrs[cpu]->kstack_vmalloc_base = paca_ptrs[cpu]->kstack & (THREAD_SIZE - 1);
+#endif // CONFIG_VMAP_STACK && CONFIG_PPC_BOOK3S_64
 #endif
 	task_thread_info(idle)->cpu = cpu;
 	secondary_current = current_set[cpu] = idle;
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index f51c882bf902..236287c4a231 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2697,6 +2697,10 @@ static void dump_one_paca(int cpu)
 	DUMP(p, __current, "%-*px");
 	DUMP(p, kstack, "%#-*llx");
 	printf(" %-*s = 0x%016llx\n", 25, "kstack_base", p->kstack & ~(THREAD_SIZE - 1));
+#if defined(CONFIG_VMAP_STACK) && defined(CONFIG_PPC_BOOK3S_64)
+	DUMP(p, kstack_linear_base, "%#-*llx");
+	DUMP(p, kstack_vmalloc_base, "%#-*llx");
+#endif
 #ifdef CONFIG_STACKPROTECTOR
 	DUMP(p, canary, "%#-*lx");
 #endif
-- 
2.38.1

