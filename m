Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD032DC002
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 13:09:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cwv70106ZzDqS6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 23:09:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cwv1N3ncLzDqQL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 23:04:05 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CwrQq3ZZ9z9tysw;
 Wed, 16 Dec 2020 11:07:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sqDfzrT1wIt0; Wed, 16 Dec 2020 11:07:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CwrQq2XvWz9tysr;
 Wed, 16 Dec 2020 11:07:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 608618B7CC;
 Wed, 16 Dec 2020 11:07:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id XS0rSuPVZnM0; Wed, 16 Dec 2020 11:07:32 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6487A8B7C7;
 Wed, 16 Dec 2020 11:07:31 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 12B96668B6; Wed, 16 Dec 2020 10:07:31 +0000 (UTC)
Message-Id: <f8edfd61fb956c1381c45a57f2b5f76d2881cd82.1608112797.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1608112796.git.christophe.leroy@csgroup.eu>
References: <cover.1608112796.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 1/7] powerpc/bpf: Remove classical BPF support for PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, kafai@fb.com,
 songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@chromium.org, naveen.n.rao@linux.ibm.com, sandipan@linux.ibm.com
Date: Wed, 16 Dec 2020 10:07:31 +0000 (UTC)
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
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the time being, PPC32 has Classical BPF support.

The test_bpf module exhibits some failure:

	test_bpf: #298 LD_IND byte frag jited:1 ret 202 != 66 FAIL (1 times)
	test_bpf: #299 LD_IND halfword frag jited:1 ret 51958 != 17220 FAIL (1 times)
	test_bpf: #301 LD_IND halfword mixed head/frag jited:1 ret 51958 != 1305 FAIL (1 times)
	test_bpf: #303 LD_ABS byte frag jited:1 ret 202 != 66 FAIL (1 times)
	test_bpf: #304 LD_ABS halfword frag jited:1 ret 51958 != 17220 FAIL (1 times)
	test_bpf: #306 LD_ABS halfword mixed head/frag jited:1 ret 51958 != 1305 FAIL (1 times)

	test_bpf: Summary: 371 PASSED, 7 FAILED, [119/366 JIT'ed]

Fixing this is not worth the effort. Instead, remove support for
classical BPF and prepare for adding Extended BPF support instead.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig            |   1 -
 arch/powerpc/net/Makefile       |   4 -
 arch/powerpc/net/bpf_jit32.h    | 139 -------
 arch/powerpc/net/bpf_jit_asm.S  | 226 -----------
 arch/powerpc/net/bpf_jit_comp.c | 683 --------------------------------
 5 files changed, 1053 deletions(-)
 delete mode 100644 arch/powerpc/net/bpf_jit32.h
 delete mode 100644 arch/powerpc/net/bpf_jit_asm.S
 delete mode 100644 arch/powerpc/net/bpf_jit_comp.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index cf328e199308..6d1454d31a53 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -191,7 +191,6 @@ config PPC
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_C_RECORDMCOUNT
-	select HAVE_CBPF_JIT			if !PPC64
 	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
 	select HAVE_CONTEXT_TRACKING		if PPC64
diff --git a/arch/powerpc/net/Makefile b/arch/powerpc/net/Makefile
index c2dec3a68d4c..52c939cef5b2 100644
--- a/arch/powerpc/net/Makefile
+++ b/arch/powerpc/net/Makefile
@@ -2,8 +2,4 @@
 #
 # Arch-specific network modules
 #
-ifdef CONFIG_PPC64
 obj-$(CONFIG_BPF_JIT) += bpf_jit_comp64.o
-else
-obj-$(CONFIG_BPF_JIT) += bpf_jit_asm.o bpf_jit_comp.o
-endif
diff --git a/arch/powerpc/net/bpf_jit32.h b/arch/powerpc/net/bpf_jit32.h
deleted file mode 100644
index 448dfd4d98e1..000000000000
--- a/arch/powerpc/net/bpf_jit32.h
+++ /dev/null
@@ -1,139 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * bpf_jit32.h: BPF JIT compiler for PPC
- *
- * Copyright 2011 Matt Evans <matt@ozlabs.org>, IBM Corporation
- *
- * Split from bpf_jit.h
- */
-#ifndef _BPF_JIT32_H
-#define _BPF_JIT32_H
-
-#include <asm/asm-compat.h>
-#include "bpf_jit.h"
-
-#ifdef CONFIG_PPC64
-#define BPF_PPC_STACK_R3_OFF	48
-#define BPF_PPC_STACK_LOCALS	32
-#define BPF_PPC_STACK_BASIC	(48+64)
-#define BPF_PPC_STACK_SAVE	(18*8)
-#define BPF_PPC_STACKFRAME	(BPF_PPC_STACK_BASIC+BPF_PPC_STACK_LOCALS+ \
-				 BPF_PPC_STACK_SAVE)
-#define BPF_PPC_SLOWPATH_FRAME	(48+64)
-#else
-#define BPF_PPC_STACK_R3_OFF	24
-#define BPF_PPC_STACK_LOCALS	16
-#define BPF_PPC_STACK_BASIC	(24+32)
-#define BPF_PPC_STACK_SAVE	(18*4)
-#define BPF_PPC_STACKFRAME	(BPF_PPC_STACK_BASIC+BPF_PPC_STACK_LOCALS+ \
-				 BPF_PPC_STACK_SAVE)
-#define BPF_PPC_SLOWPATH_FRAME	(24+32)
-#endif
-
-#define REG_SZ         (BITS_PER_LONG/8)
-
-/*
- * Generated code register usage:
- *
- * As normal PPC C ABI (e.g. r1=sp, r2=TOC), with:
- *
- * skb		r3	(Entry parameter)
- * A register	r4
- * X register	r5
- * addr param	r6
- * r7-r10	scratch
- * skb->data	r14
- * skb headlen	r15	(skb->len - skb->data_len)
- * m[0]		r16
- * m[...]	...
- * m[15]	r31
- */
-#define r_skb		3
-#define r_ret		3
-#define r_A		4
-#define r_X		5
-#define r_addr		6
-#define r_scratch1	7
-#define r_scratch2	8
-#define r_D		14
-#define r_HL		15
-#define r_M		16
-
-#ifndef __ASSEMBLY__
-
-/*
- * Assembly helpers from arch/powerpc/net/bpf_jit.S:
- */
-#define DECLARE_LOAD_FUNC(func)	\
-	extern u8 func[], func##_negative_offset[], func##_positive_offset[]
-
-DECLARE_LOAD_FUNC(sk_load_word);
-DECLARE_LOAD_FUNC(sk_load_half);
-DECLARE_LOAD_FUNC(sk_load_byte);
-DECLARE_LOAD_FUNC(sk_load_byte_msh);
-
-#define PPC_LBZ_OFFS(r, base, i) do { if ((i) < 32768) EMIT(PPC_RAW_LBZ(r, base, i));   \
-		else {	EMIT(PPC_RAW_ADDIS(r, base, IMM_HA(i)));	      \
-			EMIT(PPC_RAW_LBZ(r, r, IMM_L(i))); } } while(0)
-
-#define PPC_LD_OFFS(r, base, i) do { if ((i) < 32768) EMIT(PPC_RAW_LD(r, base, i));     \
-		else {	EMIT(PPC_RAW_ADDIS(r, base, IMM_HA(i)));			\
-			EMIT(PPC_RAW_LD(r, r, IMM_L(i))); } } while(0)
-
-#define PPC_LWZ_OFFS(r, base, i) do { if ((i) < 32768) EMIT(PPC_RAW_LWZ(r, base, i));   \
-		else {	EMIT(PPC_RAW_ADDIS(r, base, IMM_HA(i)));			\
-			EMIT(PPC_RAW_LWZ(r, r, IMM_L(i))); } } while(0)
-
-#define PPC_LHZ_OFFS(r, base, i) do { if ((i) < 32768) EMIT(PPC_RAW_LHZ(r, base, i));   \
-		else {	EMIT(PPC_RAW_ADDIS(r, base, IMM_HA(i)));			\
-			EMIT(PPC_RAW_LHZ(r, r, IMM_L(i))); } } while(0)
-
-#ifdef CONFIG_PPC64
-#define PPC_LL_OFFS(r, base, i) do { PPC_LD_OFFS(r, base, i); } while(0)
-#else
-#define PPC_LL_OFFS(r, base, i) do { PPC_LWZ_OFFS(r, base, i); } while(0)
-#endif
-
-#ifdef CONFIG_SMP
-#ifdef CONFIG_PPC64
-#define PPC_BPF_LOAD_CPU(r)		\
-	do { BUILD_BUG_ON(sizeof_field(struct paca_struct, paca_index) != 2);	\
-		PPC_LHZ_OFFS(r, 13, offsetof(struct paca_struct, paca_index));	\
-	} while (0)
-#else
-#define PPC_BPF_LOAD_CPU(r)     \
-	do { BUILD_BUG_ON(sizeof_field(struct task_struct, cpu) != 4);		\
-		PPC_LHZ_OFFS(r, 2, offsetof(struct task_struct, cpu));		\
-	} while(0)
-#endif
-#else
-#define PPC_BPF_LOAD_CPU(r) do { EMIT(PPC_RAW_LI(r, 0)); } while(0)
-#endif
-
-#define PPC_LHBRX_OFFS(r, base, i) \
-		do { PPC_LI32(r, i); EMIT(PPC_RAW_LHBRX(r, r, base)); } while(0)
-#ifdef __LITTLE_ENDIAN__
-#define PPC_NTOHS_OFFS(r, base, i)	PPC_LHBRX_OFFS(r, base, i)
-#else
-#define PPC_NTOHS_OFFS(r, base, i)	PPC_LHZ_OFFS(r, base, i)
-#endif
-
-#define PPC_BPF_LL(r, base, i) do { EMIT(PPC_RAW_LWZ(r, base, i)); } while(0)
-#define PPC_BPF_STL(r, base, i) do { EMIT(PPC_RAW_STW(r, base, i)); } while(0)
-#define PPC_BPF_STLU(r, base, i) do { EMIT(PPC_RAW_STWU(r, base, i)); } while(0)
-
-#define SEEN_DATAREF 0x10000 /* might call external helpers */
-#define SEEN_XREG    0x20000 /* X reg is used */
-#define SEEN_MEM     0x40000 /* SEEN_MEM+(1<<n) = use mem[n] for temporary
-			      * storage */
-#define SEEN_MEM_MSK 0x0ffff
-
-struct codegen_context {
-	unsigned int seen;
-	unsigned int idx;
-	int pc_ret0; /* bpf index of first RET #0 instruction (if any) */
-};
-
-#endif
-
-#endif
diff --git a/arch/powerpc/net/bpf_jit_asm.S b/arch/powerpc/net/bpf_jit_asm.S
deleted file mode 100644
index 2f5030d8383f..000000000000
--- a/arch/powerpc/net/bpf_jit_asm.S
+++ /dev/null
@@ -1,226 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/* bpf_jit.S: Packet/header access helper functions
- * for PPC64 BPF compiler.
- *
- * Copyright 2011 Matt Evans <matt@ozlabs.org>, IBM Corporation
- */
-
-#include <asm/ppc_asm.h>
-#include <asm/asm-compat.h>
-#include "bpf_jit32.h"
-
-/*
- * All of these routines are called directly from generated code,
- * whose register usage is:
- *
- * r3		skb
- * r4,r5	A,X
- * r6		*** address parameter to helper ***
- * r7-r10	scratch
- * r14		skb->data
- * r15		skb headlen
- * r16-31	M[]
- */
-
-/*
- * To consider: These helpers are so small it could be better to just
- * generate them inline.  Inline code can do the simple headlen check
- * then branch directly to slow_path_XXX if required.  (In fact, could
- * load a spare GPR with the address of slow_path_generic and pass size
- * as an argument, making the call site a mtlr, li and bllr.)
- */
-	.globl	sk_load_word
-sk_load_word:
-	PPC_LCMPI	r_addr, 0
-	blt	bpf_slow_path_word_neg
-	.globl	sk_load_word_positive_offset
-sk_load_word_positive_offset:
-	/* Are we accessing past headlen? */
-	subi	r_scratch1, r_HL, 4
-	PPC_LCMP	r_scratch1, r_addr
-	blt	bpf_slow_path_word
-	/* Nope, just hitting the header.  cr0 here is eq or gt! */
-#ifdef __LITTLE_ENDIAN__
-	lwbrx	r_A, r_D, r_addr
-#else
-	lwzx	r_A, r_D, r_addr
-#endif
-	blr	/* Return success, cr0 != LT */
-
-	.globl	sk_load_half
-sk_load_half:
-	PPC_LCMPI	r_addr, 0
-	blt	bpf_slow_path_half_neg
-	.globl	sk_load_half_positive_offset
-sk_load_half_positive_offset:
-	subi	r_scratch1, r_HL, 2
-	PPC_LCMP	r_scratch1, r_addr
-	blt	bpf_slow_path_half
-#ifdef __LITTLE_ENDIAN__
-	lhbrx	r_A, r_D, r_addr
-#else
-	lhzx	r_A, r_D, r_addr
-#endif
-	blr
-
-	.globl	sk_load_byte
-sk_load_byte:
-	PPC_LCMPI	r_addr, 0
-	blt	bpf_slow_path_byte_neg
-	.globl	sk_load_byte_positive_offset
-sk_load_byte_positive_offset:
-	PPC_LCMP	r_HL, r_addr
-	ble	bpf_slow_path_byte
-	lbzx	r_A, r_D, r_addr
-	blr
-
-/*
- * BPF_LDX | BPF_B | BPF_MSH: ldxb  4*([offset]&0xf)
- * r_addr is the offset value
- */
-	.globl sk_load_byte_msh
-sk_load_byte_msh:
-	PPC_LCMPI	r_addr, 0
-	blt	bpf_slow_path_byte_msh_neg
-	.globl sk_load_byte_msh_positive_offset
-sk_load_byte_msh_positive_offset:
-	PPC_LCMP	r_HL, r_addr
-	ble	bpf_slow_path_byte_msh
-	lbzx	r_X, r_D, r_addr
-	rlwinm	r_X, r_X, 2, 32-4-2, 31-2
-	blr
-
-/* Call out to skb_copy_bits:
- * We'll need to back up our volatile regs first; we have
- * local variable space at r1+(BPF_PPC_STACK_BASIC).
- * Allocate a new stack frame here to remain ABI-compliant in
- * stashing LR.
- */
-#define bpf_slow_path_common(SIZE)				\
-	mflr	r0;						\
-	PPC_STL	r0, PPC_LR_STKOFF(r1);					\
-	/* R3 goes in parameter space of caller's frame */	\
-	PPC_STL	r_skb, (BPF_PPC_STACKFRAME+BPF_PPC_STACK_R3_OFF)(r1);		\
-	PPC_STL	r_A, (BPF_PPC_STACK_BASIC+(0*REG_SZ))(r1);		\
-	PPC_STL	r_X, (BPF_PPC_STACK_BASIC+(1*REG_SZ))(r1);		\
-	addi	r5, r1, BPF_PPC_STACK_BASIC+(2*REG_SZ);		\
-	PPC_STLU	r1, -BPF_PPC_SLOWPATH_FRAME(r1);		\
-	/* R3 = r_skb, as passed */				\
-	mr	r4, r_addr;					\
-	li	r6, SIZE;					\
-	bl	skb_copy_bits;					\
-	nop;							\
-	/* R3 = 0 on success */					\
-	addi	r1, r1, BPF_PPC_SLOWPATH_FRAME;			\
-	PPC_LL	r0, PPC_LR_STKOFF(r1);					\
-	PPC_LL	r_A, (BPF_PPC_STACK_BASIC+(0*REG_SZ))(r1);		\
-	PPC_LL	r_X, (BPF_PPC_STACK_BASIC+(1*REG_SZ))(r1);		\
-	mtlr	r0;						\
-	PPC_LCMPI	r3, 0;						\
-	blt	bpf_error;	/* cr0 = LT */			\
-	PPC_LL	r_skb, (BPF_PPC_STACKFRAME+BPF_PPC_STACK_R3_OFF)(r1);		\
-	/* Great success! */
-
-bpf_slow_path_word:
-	bpf_slow_path_common(4)
-	/* Data value is on stack, and cr0 != LT */
-	lwz	r_A, BPF_PPC_STACK_BASIC+(2*REG_SZ)(r1)
-	blr
-
-bpf_slow_path_half:
-	bpf_slow_path_common(2)
-	lhz	r_A, BPF_PPC_STACK_BASIC+(2*8)(r1)
-	blr
-
-bpf_slow_path_byte:
-	bpf_slow_path_common(1)
-	lbz	r_A, BPF_PPC_STACK_BASIC+(2*8)(r1)
-	blr
-
-bpf_slow_path_byte_msh:
-	bpf_slow_path_common(1)
-	lbz	r_X, BPF_PPC_STACK_BASIC+(2*8)(r1)
-	rlwinm	r_X, r_X, 2, 32-4-2, 31-2
-	blr
-
-/* Call out to bpf_internal_load_pointer_neg_helper:
- * We'll need to back up our volatile regs first; we have
- * local variable space at r1+(BPF_PPC_STACK_BASIC).
- * Allocate a new stack frame here to remain ABI-compliant in
- * stashing LR.
- */
-#define sk_negative_common(SIZE)				\
-	mflr	r0;						\
-	PPC_STL	r0, PPC_LR_STKOFF(r1);					\
-	/* R3 goes in parameter space of caller's frame */	\
-	PPC_STL	r_skb, (BPF_PPC_STACKFRAME+BPF_PPC_STACK_R3_OFF)(r1);		\
-	PPC_STL	r_A, (BPF_PPC_STACK_BASIC+(0*REG_SZ))(r1);		\
-	PPC_STL	r_X, (BPF_PPC_STACK_BASIC+(1*REG_SZ))(r1);		\
-	PPC_STLU	r1, -BPF_PPC_SLOWPATH_FRAME(r1);		\
-	/* R3 = r_skb, as passed */				\
-	mr	r4, r_addr;					\
-	li	r5, SIZE;					\
-	bl	bpf_internal_load_pointer_neg_helper;		\
-	nop;							\
-	/* R3 != 0 on success */				\
-	addi	r1, r1, BPF_PPC_SLOWPATH_FRAME;			\
-	PPC_LL	r0, PPC_LR_STKOFF(r1);					\
-	PPC_LL	r_A, (BPF_PPC_STACK_BASIC+(0*REG_SZ))(r1);		\
-	PPC_LL	r_X, (BPF_PPC_STACK_BASIC+(1*REG_SZ))(r1);		\
-	mtlr	r0;						\
-	PPC_LCMPLI	r3, 0;						\
-	beq	bpf_error_slow;	/* cr0 = EQ */			\
-	mr	r_addr, r3;					\
-	PPC_LL	r_skb, (BPF_PPC_STACKFRAME+BPF_PPC_STACK_R3_OFF)(r1);		\
-	/* Great success! */
-
-bpf_slow_path_word_neg:
-	lis     r_scratch1,-32	/* SKF_LL_OFF */
-	PPC_LCMP	r_addr, r_scratch1	/* addr < SKF_* */
-	blt	bpf_error	/* cr0 = LT */
-	.globl	sk_load_word_negative_offset
-sk_load_word_negative_offset:
-	sk_negative_common(4)
-	lwz	r_A, 0(r_addr)
-	blr
-
-bpf_slow_path_half_neg:
-	lis     r_scratch1,-32	/* SKF_LL_OFF */
-	PPC_LCMP	r_addr, r_scratch1	/* addr < SKF_* */
-	blt	bpf_error	/* cr0 = LT */
-	.globl	sk_load_half_negative_offset
-sk_load_half_negative_offset:
-	sk_negative_common(2)
-	lhz	r_A, 0(r_addr)
-	blr
-
-bpf_slow_path_byte_neg:
-	lis     r_scratch1,-32	/* SKF_LL_OFF */
-	PPC_LCMP	r_addr, r_scratch1	/* addr < SKF_* */
-	blt	bpf_error	/* cr0 = LT */
-	.globl	sk_load_byte_negative_offset
-sk_load_byte_negative_offset:
-	sk_negative_common(1)
-	lbz	r_A, 0(r_addr)
-	blr
-
-bpf_slow_path_byte_msh_neg:
-	lis     r_scratch1,-32	/* SKF_LL_OFF */
-	PPC_LCMP	r_addr, r_scratch1	/* addr < SKF_* */
-	blt	bpf_error	/* cr0 = LT */
-	.globl	sk_load_byte_msh_negative_offset
-sk_load_byte_msh_negative_offset:
-	sk_negative_common(1)
-	lbz	r_X, 0(r_addr)
-	rlwinm	r_X, r_X, 2, 32-4-2, 31-2
-	blr
-
-bpf_error_slow:
-	/* fabricate a cr0 = lt */
-	li	r_scratch1, -1
-	PPC_LCMPI	r_scratch1, 0
-bpf_error:
-	/* Entered with cr0 = lt */
-	li	r3, 0
-	/* Generated code will 'blt epilogue', returning 0. */
-	blr
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
deleted file mode 100644
index e809cb5a1631..000000000000
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ /dev/null
@@ -1,683 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* bpf_jit_comp.c: BPF JIT compiler
- *
- * Copyright 2011 Matt Evans <matt@ozlabs.org>, IBM Corporation
- *
- * Based on the x86 BPF compiler, by Eric Dumazet (eric.dumazet@gmail.com)
- * Ported to ppc32 by Denis Kirjanov <kda@linux-powerpc.org>
- */
-#include <linux/moduleloader.h>
-#include <asm/cacheflush.h>
-#include <asm/asm-compat.h>
-#include <linux/netdevice.h>
-#include <linux/filter.h>
-#include <linux/if_vlan.h>
-
-#include "bpf_jit32.h"
-
-static inline void bpf_flush_icache(void *start, void *end)
-{
-	smp_wmb();
-	flush_icache_range((unsigned long)start, (unsigned long)end);
-}
-
-static void bpf_jit_build_prologue(struct bpf_prog *fp, u32 *image,
-				   struct codegen_context *ctx)
-{
-	int i;
-	const struct sock_filter *filter = fp->insns;
-
-	if (ctx->seen & (SEEN_MEM | SEEN_DATAREF)) {
-		/* Make stackframe */
-		if (ctx->seen & SEEN_DATAREF) {
-			/* If we call any helpers (for loads), save LR */
-			EMIT(PPC_INST_MFLR | __PPC_RT(R0));
-			PPC_BPF_STL(0, 1, PPC_LR_STKOFF);
-
-			/* Back up non-volatile regs. */
-			PPC_BPF_STL(r_D, 1, -(REG_SZ*(32-r_D)));
-			PPC_BPF_STL(r_HL, 1, -(REG_SZ*(32-r_HL)));
-		}
-		if (ctx->seen & SEEN_MEM) {
-			/*
-			 * Conditionally save regs r15-r31 as some will be used
-			 * for M[] data.
-			 */
-			for (i = r_M; i < (r_M+16); i++) {
-				if (ctx->seen & (1 << (i-r_M)))
-					PPC_BPF_STL(i, 1, -(REG_SZ*(32-i)));
-			}
-		}
-		PPC_BPF_STLU(1, 1, -BPF_PPC_STACKFRAME);
-	}
-
-	if (ctx->seen & SEEN_DATAREF) {
-		/*
-		 * If this filter needs to access skb data,
-		 * prepare r_D and r_HL:
-		 *  r_HL = skb->len - skb->data_len
-		 *  r_D	 = skb->data
-		 */
-		PPC_LWZ_OFFS(r_scratch1, r_skb, offsetof(struct sk_buff,
-							 data_len));
-		PPC_LWZ_OFFS(r_HL, r_skb, offsetof(struct sk_buff, len));
-		EMIT(PPC_RAW_SUB(r_HL, r_HL, r_scratch1));
-		PPC_LL_OFFS(r_D, r_skb, offsetof(struct sk_buff, data));
-	}
-
-	if (ctx->seen & SEEN_XREG) {
-		/*
-		 * TODO: Could also detect whether first instr. sets X and
-		 * avoid this (as below, with A).
-		 */
-		EMIT(PPC_RAW_LI(r_X, 0));
-	}
-
-	/* make sure we dont leak kernel information to user */
-	if (bpf_needs_clear_a(&filter[0]))
-		EMIT(PPC_RAW_LI(r_A, 0));
-}
-
-static void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
-{
-	int i;
-
-	if (ctx->seen & (SEEN_MEM | SEEN_DATAREF)) {
-		EMIT(PPC_RAW_ADDI(1, 1, BPF_PPC_STACKFRAME));
-		if (ctx->seen & SEEN_DATAREF) {
-			PPC_BPF_LL(0, 1, PPC_LR_STKOFF);
-			EMIT(PPC_RAW_MTLR(0));
-			PPC_BPF_LL(r_D, 1, -(REG_SZ*(32-r_D)));
-			PPC_BPF_LL(r_HL, 1, -(REG_SZ*(32-r_HL)));
-		}
-		if (ctx->seen & SEEN_MEM) {
-			/* Restore any saved non-vol registers */
-			for (i = r_M; i < (r_M+16); i++) {
-				if (ctx->seen & (1 << (i-r_M)))
-					PPC_BPF_LL(i, 1, -(REG_SZ*(32-i)));
-			}
-		}
-	}
-	/* The RETs have left a return value in R3. */
-
-	EMIT(PPC_RAW_BLR());
-}
-
-#define CHOOSE_LOAD_FUNC(K, func) \
-	((int)K < 0 ? ((int)K >= SKF_LL_OFF ? func##_negative_offset : func) : func##_positive_offset)
-
-/* Assemble the body code between the prologue & epilogue. */
-static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
-			      struct codegen_context *ctx,
-			      unsigned int *addrs)
-{
-	const struct sock_filter *filter = fp->insns;
-	int flen = fp->len;
-	u8 *func;
-	unsigned int true_cond;
-	int i;
-
-	/* Start of epilogue code */
-	unsigned int exit_addr = addrs[flen];
-
-	for (i = 0; i < flen; i++) {
-		unsigned int K = filter[i].k;
-		u16 code = bpf_anc_helper(&filter[i]);
-
-		/*
-		 * addrs[] maps a BPF bytecode address into a real offset from
-		 * the start of the body code.
-		 */
-		addrs[i] = ctx->idx * 4;
-
-		switch (code) {
-			/*** ALU ops ***/
-		case BPF_ALU | BPF_ADD | BPF_X: /* A += X; */
-			ctx->seen |= SEEN_XREG;
-			EMIT(PPC_RAW_ADD(r_A, r_A, r_X));
-			break;
-		case BPF_ALU | BPF_ADD | BPF_K: /* A += K; */
-			if (!K)
-				break;
-			EMIT(PPC_RAW_ADDI(r_A, r_A, IMM_L(K)));
-			if (K >= 32768)
-				EMIT(PPC_RAW_ADDIS(r_A, r_A, IMM_HA(K)));
-			break;
-		case BPF_ALU | BPF_SUB | BPF_X: /* A -= X; */
-			ctx->seen |= SEEN_XREG;
-			EMIT(PPC_RAW_SUB(r_A, r_A, r_X));
-			break;
-		case BPF_ALU | BPF_SUB | BPF_K: /* A -= K */
-			if (!K)
-				break;
-			EMIT(PPC_RAW_ADDI(r_A, r_A, IMM_L(-K)));
-			if (K >= 32768)
-				EMIT(PPC_RAW_ADDIS(r_A, r_A, IMM_HA(-K)));
-			break;
-		case BPF_ALU | BPF_MUL | BPF_X: /* A *= X; */
-			ctx->seen |= SEEN_XREG;
-			EMIT(PPC_RAW_MULW(r_A, r_A, r_X));
-			break;
-		case BPF_ALU | BPF_MUL | BPF_K: /* A *= K */
-			if (K < 32768)
-				EMIT(PPC_RAW_MULI(r_A, r_A, K));
-			else {
-				PPC_LI32(r_scratch1, K);
-				EMIT(PPC_RAW_MULW(r_A, r_A, r_scratch1));
-			}
-			break;
-		case BPF_ALU | BPF_MOD | BPF_X: /* A %= X; */
-		case BPF_ALU | BPF_DIV | BPF_X: /* A /= X; */
-			ctx->seen |= SEEN_XREG;
-			EMIT(PPC_RAW_CMPWI(r_X, 0));
-			if (ctx->pc_ret0 != -1) {
-				PPC_BCC(COND_EQ, addrs[ctx->pc_ret0]);
-			} else {
-				PPC_BCC_SHORT(COND_NE, (ctx->idx*4)+12);
-				EMIT(PPC_RAW_LI(r_ret, 0));
-				PPC_JMP(exit_addr);
-			}
-			if (code == (BPF_ALU | BPF_MOD | BPF_X)) {
-				EMIT(PPC_RAW_DIVWU(r_scratch1, r_A, r_X));
-				EMIT(PPC_RAW_MULW(r_scratch1, r_X, r_scratch1));
-				EMIT(PPC_RAW_SUB(r_A, r_A, r_scratch1));
-			} else {
-				EMIT(PPC_RAW_DIVWU(r_A, r_A, r_X));
-			}
-			break;
-		case BPF_ALU | BPF_MOD | BPF_K: /* A %= K; */
-			PPC_LI32(r_scratch2, K);
-			EMIT(PPC_RAW_DIVWU(r_scratch1, r_A, r_scratch2));
-			EMIT(PPC_RAW_MULW(r_scratch1, r_scratch2, r_scratch1));
-			EMIT(PPC_RAW_SUB(r_A, r_A, r_scratch1));
-			break;
-		case BPF_ALU | BPF_DIV | BPF_K: /* A /= K */
-			if (K == 1)
-				break;
-			PPC_LI32(r_scratch1, K);
-			EMIT(PPC_RAW_DIVWU(r_A, r_A, r_scratch1));
-			break;
-		case BPF_ALU | BPF_AND | BPF_X:
-			ctx->seen |= SEEN_XREG;
-			EMIT(PPC_RAW_AND(r_A, r_A, r_X));
-			break;
-		case BPF_ALU | BPF_AND | BPF_K:
-			if (!IMM_H(K))
-				EMIT(PPC_RAW_ANDI(r_A, r_A, K));
-			else {
-				PPC_LI32(r_scratch1, K);
-				EMIT(PPC_RAW_AND(r_A, r_A, r_scratch1));
-			}
-			break;
-		case BPF_ALU | BPF_OR | BPF_X:
-			ctx->seen |= SEEN_XREG;
-			EMIT(PPC_RAW_OR(r_A, r_A, r_X));
-			break;
-		case BPF_ALU | BPF_OR | BPF_K:
-			if (IMM_L(K))
-				EMIT(PPC_RAW_ORI(r_A, r_A, IMM_L(K)));
-			if (K >= 65536)
-				EMIT(PPC_RAW_ORIS(r_A, r_A, IMM_H(K)));
-			break;
-		case BPF_ANC | SKF_AD_ALU_XOR_X:
-		case BPF_ALU | BPF_XOR | BPF_X: /* A ^= X */
-			ctx->seen |= SEEN_XREG;
-			EMIT(PPC_RAW_XOR(r_A, r_A, r_X));
-			break;
-		case BPF_ALU | BPF_XOR | BPF_K: /* A ^= K */
-			if (IMM_L(K))
-				EMIT(PPC_RAW_XORI(r_A, r_A, IMM_L(K)));
-			if (K >= 65536)
-				EMIT(PPC_RAW_XORIS(r_A, r_A, IMM_H(K)));
-			break;
-		case BPF_ALU | BPF_LSH | BPF_X: /* A <<= X; */
-			ctx->seen |= SEEN_XREG;
-			EMIT(PPC_RAW_SLW(r_A, r_A, r_X));
-			break;
-		case BPF_ALU | BPF_LSH | BPF_K:
-			if (K == 0)
-				break;
-			else
-				EMIT(PPC_RAW_SLWI(r_A, r_A, K));
-			break;
-		case BPF_ALU | BPF_RSH | BPF_X: /* A >>= X; */
-			ctx->seen |= SEEN_XREG;
-			EMIT(PPC_RAW_SRW(r_A, r_A, r_X));
-			break;
-		case BPF_ALU | BPF_RSH | BPF_K: /* A >>= K; */
-			if (K == 0)
-				break;
-			else
-				EMIT(PPC_RAW_SRWI(r_A, r_A, K));
-			break;
-		case BPF_ALU | BPF_NEG:
-			EMIT(PPC_RAW_NEG(r_A, r_A));
-			break;
-		case BPF_RET | BPF_K:
-			PPC_LI32(r_ret, K);
-			if (!K) {
-				if (ctx->pc_ret0 == -1)
-					ctx->pc_ret0 = i;
-			}
-			/*
-			 * If this isn't the very last instruction, branch to
-			 * the epilogue if we've stuff to clean up.  Otherwise,
-			 * if there's nothing to tidy, just return.  If we /are/
-			 * the last instruction, we're about to fall through to
-			 * the epilogue to return.
-			 */
-			if (i != flen - 1) {
-				/*
-				 * Note: 'seen' is properly valid only on pass
-				 * #2.	Both parts of this conditional are the
-				 * same instruction size though, meaning the
-				 * first pass will still correctly determine the
-				 * code size/addresses.
-				 */
-				if (ctx->seen)
-					PPC_JMP(exit_addr);
-				else
-					EMIT(PPC_RAW_BLR());
-			}
-			break;
-		case BPF_RET | BPF_A:
-			EMIT(PPC_RAW_MR(r_ret, r_A));
-			if (i != flen - 1) {
-				if (ctx->seen)
-					PPC_JMP(exit_addr);
-				else
-					EMIT(PPC_RAW_BLR());
-			}
-			break;
-		case BPF_MISC | BPF_TAX: /* X = A */
-			EMIT(PPC_RAW_MR(r_X, r_A));
-			break;
-		case BPF_MISC | BPF_TXA: /* A = X */
-			ctx->seen |= SEEN_XREG;
-			EMIT(PPC_RAW_MR(r_A, r_X));
-			break;
-
-			/*** Constant loads/M[] access ***/
-		case BPF_LD | BPF_IMM: /* A = K */
-			PPC_LI32(r_A, K);
-			break;
-		case BPF_LDX | BPF_IMM: /* X = K */
-			PPC_LI32(r_X, K);
-			break;
-		case BPF_LD | BPF_MEM: /* A = mem[K] */
-			EMIT(PPC_RAW_MR(r_A, r_M + (K & 0xf)));
-			ctx->seen |= SEEN_MEM | (1<<(K & 0xf));
-			break;
-		case BPF_LDX | BPF_MEM: /* X = mem[K] */
-			EMIT(PPC_RAW_MR(r_X, r_M + (K & 0xf)));
-			ctx->seen |= SEEN_MEM | (1<<(K & 0xf));
-			break;
-		case BPF_ST: /* mem[K] = A */
-			EMIT(PPC_RAW_MR(r_M + (K & 0xf), r_A));
-			ctx->seen |= SEEN_MEM | (1<<(K & 0xf));
-			break;
-		case BPF_STX: /* mem[K] = X */
-			EMIT(PPC_RAW_MR(r_M + (K & 0xf), r_X));
-			ctx->seen |= SEEN_XREG | SEEN_MEM | (1<<(K & 0xf));
-			break;
-		case BPF_LD | BPF_W | BPF_LEN: /*	A = skb->len; */
-			BUILD_BUG_ON(sizeof_field(struct sk_buff, len) != 4);
-			PPC_LWZ_OFFS(r_A, r_skb, offsetof(struct sk_buff, len));
-			break;
-		case BPF_LDX | BPF_W | BPF_ABS: /* A = *((u32 *)(seccomp_data + K)); */
-			PPC_LWZ_OFFS(r_A, r_skb, K);
-			break;
-		case BPF_LDX | BPF_W | BPF_LEN: /* X = skb->len; */
-			PPC_LWZ_OFFS(r_X, r_skb, offsetof(struct sk_buff, len));
-			break;
-
-			/*** Ancillary info loads ***/
-		case BPF_ANC | SKF_AD_PROTOCOL: /* A = ntohs(skb->protocol); */
-			BUILD_BUG_ON(sizeof_field(struct sk_buff,
-						  protocol) != 2);
-			PPC_NTOHS_OFFS(r_A, r_skb, offsetof(struct sk_buff,
-							    protocol));
-			break;
-		case BPF_ANC | SKF_AD_IFINDEX:
-		case BPF_ANC | SKF_AD_HATYPE:
-			BUILD_BUG_ON(sizeof_field(struct net_device,
-						ifindex) != 4);
-			BUILD_BUG_ON(sizeof_field(struct net_device,
-						type) != 2);
-			PPC_LL_OFFS(r_scratch1, r_skb, offsetof(struct sk_buff,
-								dev));
-			EMIT(PPC_RAW_CMPDI(r_scratch1, 0));
-			if (ctx->pc_ret0 != -1) {
-				PPC_BCC(COND_EQ, addrs[ctx->pc_ret0]);
-			} else {
-				/* Exit, returning 0; first pass hits here. */
-				PPC_BCC_SHORT(COND_NE, ctx->idx * 4 + 12);
-				EMIT(PPC_RAW_LI(r_ret, 0));
-				PPC_JMP(exit_addr);
-			}
-			if (code == (BPF_ANC | SKF_AD_IFINDEX)) {
-				PPC_LWZ_OFFS(r_A, r_scratch1,
-				     offsetof(struct net_device, ifindex));
-			} else {
-				PPC_LHZ_OFFS(r_A, r_scratch1,
-				     offsetof(struct net_device, type));
-			}
-
-			break;
-		case BPF_ANC | SKF_AD_MARK:
-			BUILD_BUG_ON(sizeof_field(struct sk_buff, mark) != 4);
-			PPC_LWZ_OFFS(r_A, r_skb, offsetof(struct sk_buff,
-							  mark));
-			break;
-		case BPF_ANC | SKF_AD_RXHASH:
-			BUILD_BUG_ON(sizeof_field(struct sk_buff, hash) != 4);
-			PPC_LWZ_OFFS(r_A, r_skb, offsetof(struct sk_buff,
-							  hash));
-			break;
-		case BPF_ANC | SKF_AD_VLAN_TAG:
-			BUILD_BUG_ON(sizeof_field(struct sk_buff, vlan_tci) != 2);
-
-			PPC_LHZ_OFFS(r_A, r_skb, offsetof(struct sk_buff,
-							  vlan_tci));
-			break;
-		case BPF_ANC | SKF_AD_VLAN_TAG_PRESENT:
-			PPC_LBZ_OFFS(r_A, r_skb, PKT_VLAN_PRESENT_OFFSET());
-			if (PKT_VLAN_PRESENT_BIT)
-				EMIT(PPC_RAW_SRWI(r_A, r_A, PKT_VLAN_PRESENT_BIT));
-			if (PKT_VLAN_PRESENT_BIT < 7)
-				EMIT(PPC_RAW_ANDI(r_A, r_A, 1));
-			break;
-		case BPF_ANC | SKF_AD_QUEUE:
-			BUILD_BUG_ON(sizeof_field(struct sk_buff,
-						  queue_mapping) != 2);
-			PPC_LHZ_OFFS(r_A, r_skb, offsetof(struct sk_buff,
-							  queue_mapping));
-			break;
-		case BPF_ANC | SKF_AD_PKTTYPE:
-			PPC_LBZ_OFFS(r_A, r_skb, PKT_TYPE_OFFSET());
-			EMIT(PPC_RAW_ANDI(r_A, r_A, PKT_TYPE_MAX));
-			EMIT(PPC_RAW_SRWI(r_A, r_A, 5));
-			break;
-		case BPF_ANC | SKF_AD_CPU:
-			PPC_BPF_LOAD_CPU(r_A);
-			break;
-			/*** Absolute loads from packet header/data ***/
-		case BPF_LD | BPF_W | BPF_ABS:
-			func = CHOOSE_LOAD_FUNC(K, sk_load_word);
-			goto common_load;
-		case BPF_LD | BPF_H | BPF_ABS:
-			func = CHOOSE_LOAD_FUNC(K, sk_load_half);
-			goto common_load;
-		case BPF_LD | BPF_B | BPF_ABS:
-			func = CHOOSE_LOAD_FUNC(K, sk_load_byte);
-		common_load:
-			/* Load from [K]. */
-			ctx->seen |= SEEN_DATAREF;
-			PPC_FUNC_ADDR(r_scratch1, func);
-			EMIT(PPC_RAW_MTLR(r_scratch1));
-			PPC_LI32(r_addr, K);
-			EMIT(PPC_RAW_BLRL());
-			/*
-			 * Helper returns 'lt' condition on error, and an
-			 * appropriate return value in r3
-			 */
-			PPC_BCC(COND_LT, exit_addr);
-			break;
-
-			/*** Indirect loads from packet header/data ***/
-		case BPF_LD | BPF_W | BPF_IND:
-			func = sk_load_word;
-			goto common_load_ind;
-		case BPF_LD | BPF_H | BPF_IND:
-			func = sk_load_half;
-			goto common_load_ind;
-		case BPF_LD | BPF_B | BPF_IND:
-			func = sk_load_byte;
-		common_load_ind:
-			/*
-			 * Load from [X + K].  Negative offsets are tested for
-			 * in the helper functions.
-			 */
-			ctx->seen |= SEEN_DATAREF | SEEN_XREG;
-			PPC_FUNC_ADDR(r_scratch1, func);
-			EMIT(PPC_RAW_MTLR(r_scratch1));
-			EMIT(PPC_RAW_ADDI(r_addr, r_X, IMM_L(K)));
-			if (K >= 32768)
-				EMIT(PPC_RAW_ADDIS(r_addr, r_addr, IMM_HA(K)));
-			EMIT(PPC_RAW_BLRL());
-			/* If error, cr0.LT set */
-			PPC_BCC(COND_LT, exit_addr);
-			break;
-
-		case BPF_LDX | BPF_B | BPF_MSH:
-			func = CHOOSE_LOAD_FUNC(K, sk_load_byte_msh);
-			goto common_load;
-			break;
-
-			/*** Jump and branches ***/
-		case BPF_JMP | BPF_JA:
-			if (K != 0)
-				PPC_JMP(addrs[i + 1 + K]);
-			break;
-
-		case BPF_JMP | BPF_JGT | BPF_K:
-		case BPF_JMP | BPF_JGT | BPF_X:
-			true_cond = COND_GT;
-			goto cond_branch;
-		case BPF_JMP | BPF_JGE | BPF_K:
-		case BPF_JMP | BPF_JGE | BPF_X:
-			true_cond = COND_GE;
-			goto cond_branch;
-		case BPF_JMP | BPF_JEQ | BPF_K:
-		case BPF_JMP | BPF_JEQ | BPF_X:
-			true_cond = COND_EQ;
-			goto cond_branch;
-		case BPF_JMP | BPF_JSET | BPF_K:
-		case BPF_JMP | BPF_JSET | BPF_X:
-			true_cond = COND_NE;
-		cond_branch:
-			/* same targets, can avoid doing the test :) */
-			if (filter[i].jt == filter[i].jf) {
-				if (filter[i].jt > 0)
-					PPC_JMP(addrs[i + 1 + filter[i].jt]);
-				break;
-			}
-
-			switch (code) {
-			case BPF_JMP | BPF_JGT | BPF_X:
-			case BPF_JMP | BPF_JGE | BPF_X:
-			case BPF_JMP | BPF_JEQ | BPF_X:
-				ctx->seen |= SEEN_XREG;
-				EMIT(PPC_RAW_CMPLW(r_A, r_X));
-				break;
-			case BPF_JMP | BPF_JSET | BPF_X:
-				ctx->seen |= SEEN_XREG;
-				EMIT(PPC_RAW_AND_DOT(r_scratch1, r_A, r_X));
-				break;
-			case BPF_JMP | BPF_JEQ | BPF_K:
-			case BPF_JMP | BPF_JGT | BPF_K:
-			case BPF_JMP | BPF_JGE | BPF_K:
-				if (K < 32768)
-					EMIT(PPC_RAW_CMPLWI(r_A, K));
-				else {
-					PPC_LI32(r_scratch1, K);
-					EMIT(PPC_RAW_CMPLW(r_A, r_scratch1));
-				}
-				break;
-			case BPF_JMP | BPF_JSET | BPF_K:
-				if (K < 32768)
-					/* PPC_ANDI is /only/ dot-form */
-					EMIT(PPC_RAW_ANDI(r_scratch1, r_A, K));
-				else {
-					PPC_LI32(r_scratch1, K);
-					EMIT(PPC_RAW_AND_DOT(r_scratch1, r_A,
-						    r_scratch1));
-				}
-				break;
-			}
-			/* Sometimes branches are constructed "backward", with
-			 * the false path being the branch and true path being
-			 * a fallthrough to the next instruction.
-			 */
-			if (filter[i].jt == 0)
-				/* Swap the sense of the branch */
-				PPC_BCC(true_cond ^ COND_CMP_TRUE,
-					addrs[i + 1 + filter[i].jf]);
-			else {
-				PPC_BCC(true_cond, addrs[i + 1 + filter[i].jt]);
-				if (filter[i].jf != 0)
-					PPC_JMP(addrs[i + 1 + filter[i].jf]);
-			}
-			break;
-		default:
-			/* The filter contains something cruel & unusual.
-			 * We don't handle it, but also there shouldn't be
-			 * anything missing from our list.
-			 */
-			if (printk_ratelimit())
-				pr_err("BPF filter opcode %04x (@%d) unsupported\n",
-				       filter[i].code, i);
-			return -ENOTSUPP;
-		}
-
-	}
-	/* Set end-of-body-code address for exit. */
-	addrs[i] = ctx->idx * 4;
-
-	return 0;
-}
-
-void bpf_jit_compile(struct bpf_prog *fp)
-{
-	unsigned int proglen;
-	unsigned int alloclen;
-	u32 *image = NULL;
-	u32 *code_base;
-	unsigned int *addrs;
-	struct codegen_context cgctx;
-	int pass;
-	int flen = fp->len;
-
-	if (!bpf_jit_enable)
-		return;
-
-	addrs = kcalloc(flen + 1, sizeof(*addrs), GFP_KERNEL);
-	if (addrs == NULL)
-		return;
-
-	/*
-	 * There are multiple assembly passes as the generated code will change
-	 * size as it settles down, figuring out the max branch offsets/exit
-	 * paths required.
-	 *
-	 * The range of standard conditional branches is +/- 32Kbytes.	Since
-	 * BPF_MAXINSNS = 4096, we can only jump from (worst case) start to
-	 * finish with 8 bytes/instruction.  Not feasible, so long jumps are
-	 * used, distinct from short branches.
-	 *
-	 * Current:
-	 *
-	 * For now, both branch types assemble to 2 words (short branches padded
-	 * with a NOP); this is less efficient, but assembly will always complete
-	 * after exactly 3 passes:
-	 *
-	 * First pass: No code buffer; Program is "faux-generated" -- no code
-	 * emitted but maximum size of output determined (and addrs[] filled
-	 * in).	 Also, we note whether we use M[], whether we use skb data, etc.
-	 * All generation choices assumed to be 'worst-case', e.g. branches all
-	 * far (2 instructions), return path code reduction not available, etc.
-	 *
-	 * Second pass: Code buffer allocated with size determined previously.
-	 * Prologue generated to support features we have seen used.  Exit paths
-	 * determined and addrs[] is filled in again, as code may be slightly
-	 * smaller as a result.
-	 *
-	 * Third pass: Code generated 'for real', and branch destinations
-	 * determined from now-accurate addrs[] map.
-	 *
-	 * Ideal:
-	 *
-	 * If we optimise this, near branches will be shorter.	On the
-	 * first assembly pass, we should err on the side of caution and
-	 * generate the biggest code.  On subsequent passes, branches will be
-	 * generated short or long and code size will reduce.  With smaller
-	 * code, more branches may fall into the short category, and code will
-	 * reduce more.
-	 *
-	 * Finally, if we see one pass generate code the same size as the
-	 * previous pass we have converged and should now generate code for
-	 * real.  Allocating at the end will also save the memory that would
-	 * otherwise be wasted by the (small) current code shrinkage.
-	 * Preferably, we should do a small number of passes (e.g. 5) and if we
-	 * haven't converged by then, get impatient and force code to generate
-	 * as-is, even if the odd branch would be left long.  The chances of a
-	 * long jump are tiny with all but the most enormous of BPF filter
-	 * inputs, so we should usually converge on the third pass.
-	 */
-
-	cgctx.idx = 0;
-	cgctx.seen = 0;
-	cgctx.pc_ret0 = -1;
-	/* Scouting faux-generate pass 0 */
-	if (bpf_jit_build_body(fp, 0, &cgctx, addrs))
-		/* We hit something illegal or unsupported. */
-		goto out;
-
-	/*
-	 * Pretend to build prologue, given the features we've seen.  This will
-	 * update ctgtx.idx as it pretends to output instructions, then we can
-	 * calculate total size from idx.
-	 */
-	bpf_jit_build_prologue(fp, 0, &cgctx);
-	bpf_jit_build_epilogue(0, &cgctx);
-
-	proglen = cgctx.idx * 4;
-	alloclen = proglen + FUNCTION_DESCR_SIZE;
-	image = module_alloc(alloclen);
-	if (!image)
-		goto out;
-
-	code_base = image + (FUNCTION_DESCR_SIZE/4);
-
-	/* Code generation passes 1-2 */
-	for (pass = 1; pass < 3; pass++) {
-		/* Now build the prologue, body code & epilogue for real. */
-		cgctx.idx = 0;
-		bpf_jit_build_prologue(fp, code_base, &cgctx);
-		bpf_jit_build_body(fp, code_base, &cgctx, addrs);
-		bpf_jit_build_epilogue(code_base, &cgctx);
-
-		if (bpf_jit_enable > 1)
-			pr_info("Pass %d: shrink = %d, seen = 0x%x\n", pass,
-				proglen - (cgctx.idx * 4), cgctx.seen);
-	}
-
-	if (bpf_jit_enable > 1)
-		/* Note that we output the base address of the code_base
-		 * rather than image, since opcodes are in code_base.
-		 */
-		bpf_jit_dump(flen, proglen, pass, code_base);
-
-	bpf_flush_icache(code_base, code_base + (proglen/4));
-
-#ifdef CONFIG_PPC64
-	/* Function descriptor nastiness: Address + TOC */
-	((u64 *)image)[0] = (u64)code_base;
-	((u64 *)image)[1] = local_paca->kernel_toc;
-#endif
-
-	fp->bpf_func = (void *)image;
-	fp->jited = 1;
-
-out:
-	kfree(addrs);
-	return;
-}
-
-void bpf_jit_free(struct bpf_prog *fp)
-{
-	if (fp->jited)
-		module_memfree(fp->bpf_func);
-
-	bpf_prog_unlock_free(fp);
-}
-- 
2.25.0

