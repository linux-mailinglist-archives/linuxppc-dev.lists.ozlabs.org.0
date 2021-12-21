Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4741447B9CD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 07:01:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJ5Rq1DBvz3cGq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 17:01:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JJ5Q95k2Zz30RK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 16:59:45 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 31C5A81FD1;
 Tue, 21 Dec 2021 00:59:37 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH llvm 4/6] powerpc/64/asm: Do not reassign labels
Date: Tue, 21 Dec 2021 16:59:02 +1100
Message-Id: <20211221055904.555763-5-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211221055904.555763-1-aik@ozlabs.ru>
References: <20211221055904.555763-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, Alan Modra <amodra@au1.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Daniel Axtens <dja@axtens.net>

The LLVM integrated assembler really does not like us reassigning things
to the same label:

<instantiation>:7:9: error: invalid reassignment of non-absolute variable 'fs_label'

This happens across a bunch of platforms:
https://github.com/ClangBuiltLinux/linux/issues/1043
https://github.com/ClangBuiltLinux/linux/issues/1008
https://github.com/ClangBuiltLinux/linux/issues/920
https://github.com/ClangBuiltLinux/linux/issues/1050

There is no hope of getting this fixed in LLVM (see
https://github.com/ClangBuiltLinux/linux/issues/1043#issuecomment-641571200
and https://bugs.llvm.org/show_bug.cgi?id=47798#c1 )
so if we want to build with LLVM_IAS, we need to hack
around it ourselves.

For us the big problem comes from this:

\#define USE_FIXED_SECTION(sname)				\
	fs_label = start_##sname;				\
	fs_start = sname##_start;				\
	use_ftsec sname;

\#define USE_TEXT_SECTION()
	fs_label = start_text;					\
	fs_start = text_start;					\
	.text

and in particular fs_label.

This works around it by not setting those 'variables' and requiring
that users of the variables instead track for themselves what section
they are in. This isn't amazing, by any stretch, but it gets us further
in the compilation.

Note that even though users have to keep track of the section, using
a wrong one produces an error with both binutils and llvm which prevents
from using wrong section at the compile time:

llvm error example:

AS      arch/powerpc/kernel/head_64.o
<unknown>:0: error: Cannot represent a difference across sections
make[3]: *** [/home/aik/p/kernels-llvm/llvm/scripts/Makefile.build:388: arch/powerpc/kernel/head_64.o] Error 1

binutils error example:

/home/aik/p/kernels-llvm/llvm/arch/powerpc/kernel/exceptions-64s.S: Assembler messages:
/home/aik/p/kernels-llvm/llvm/arch/powerpc/kernel/exceptions-64s.S:1974: Error: can't resolve `system_call_common' {.text section} - `start_r
eal_vectors' {.head.text.real_vectors section}
make[3]: *** [/home/aik/p/kernels-llvm/llvm/scripts/Makefile.build:388: arch/powerpc/kernel/head_64.o] Error 1

Signed-off-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/include/asm/head-64.h   | 12 +++++------
 arch/powerpc/kernel/exceptions-64s.S | 32 ++++++++++++++--------------
 arch/powerpc/kernel/head_64.S        | 18 ++++++++--------
 arch/powerpc/kernel/interrupt_64.S   |  2 +-
 4 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/include/asm/head-64.h b/arch/powerpc/include/asm/head-64.h
index 242204e12993..d73153b0275d 100644
--- a/arch/powerpc/include/asm/head-64.h
+++ b/arch/powerpc/include/asm/head-64.h
@@ -98,13 +98,9 @@ linker_stub_catch:						\
 	. = sname##_len;
 
 #define USE_FIXED_SECTION(sname)				\
-	fs_label = start_##sname;				\
-	fs_start = sname##_start;				\
 	use_ftsec sname;
 
 #define USE_TEXT_SECTION()					\
-	fs_label = start_text;					\
-	fs_start = text_start;					\
 	.text
 
 #define CLOSE_FIXED_SECTION(sname)				\
@@ -161,13 +157,15 @@ end_##sname:
  * - ABS_ADDR is used to find the absolute address of any symbol, from within
  *   a fixed section.
  */
-#define DEFINE_FIXED_SYMBOL(label)				\
-	label##_absolute = (label - fs_label + fs_start)
+// define label as being _in_ sname
+#define DEFINE_FIXED_SYMBOL(label, sname) \
+	label##_absolute = (label - start_ ## sname + sname ## _start)
 
 #define FIXED_SYMBOL_ABS_ADDR(label)				\
 	(label##_absolute)
 
-#define ABS_ADDR(label) (label - fs_label + fs_start)
+// find label from _within_ sname
+#define ABS_ADDR(label, sname) (label - start_ ## sname + sname ## _start)
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 83d37678f7cf..44b70bf535e3 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -48,7 +48,7 @@
 	.balign IFETCH_ALIGN_BYTES;				\
 	.global name;						\
 	_ASM_NOKPROBE_SYMBOL(name);				\
-	DEFINE_FIXED_SYMBOL(name);				\
+	DEFINE_FIXED_SYMBOL(name, text);			\
 name:
 
 #define TRAMP_REAL_BEGIN(name)					\
@@ -76,18 +76,18 @@ name:
 	ld	reg,PACAKBASE(r13);	/* get high part of &label */	\
 	ori	reg,reg,FIXED_SYMBOL_ABS_ADDR(label)
 
-#define __LOAD_HANDLER(reg, label)					\
+#define __LOAD_HANDLER(reg, label, section)					\
 	ld	reg,PACAKBASE(r13);					\
-	ori	reg,reg,(ABS_ADDR(label))@l
+	ori	reg,reg,(ABS_ADDR(label, section))@l
 
 /*
  * Branches from unrelocated code (e.g., interrupts) to labels outside
  * head-y require >64K offsets.
  */
-#define __LOAD_FAR_HANDLER(reg, label)					\
+#define __LOAD_FAR_HANDLER(reg, label, section)					\
 	ld	reg,PACAKBASE(r13);					\
-	ori	reg,reg,(ABS_ADDR(label))@l;				\
-	addis	reg,reg,(ABS_ADDR(label))@h
+	ori	reg,reg,(ABS_ADDR(label, section))@l;				\
+	addis	reg,reg,(ABS_ADDR(label, section))@h
 
 /*
  * Interrupt code generation macros
@@ -363,7 +363,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
  * This switches to virtual mode and sets MSR[RI].
  */
 .macro __GEN_COMMON_ENTRY name
-DEFINE_FIXED_SYMBOL(\name\()_common_real)
+DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
 \name\()_common_real:
 	.if IKVM_REAL
 		KVMTEST \name kvm_interrupt
@@ -386,7 +386,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 	.endif
 
 	.balign IFETCH_ALIGN_BYTES
-DEFINE_FIXED_SYMBOL(\name\()_common_virt)
+DEFINE_FIXED_SYMBOL(\name\()_common_virt, text)
 \name\()_common_virt:
 	.if IKVM_VIRT
 		KVMTEST \name kvm_interrupt
@@ -400,7 +400,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
  * want to run in real mode.
  */
 .macro __GEN_REALMODE_COMMON_ENTRY name
-DEFINE_FIXED_SYMBOL(\name\()_common_real)
+DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
 \name\()_common_real:
 	.if IKVM_REAL
 		KVMTEST \name kvm_interrupt
@@ -835,12 +835,12 @@ SOFT_MASK_TABLE(0xc000000000003000, 0xc000000000004000)
 
 #ifdef CONFIG_RELOCATABLE
 TRAMP_VIRT_BEGIN(system_call_vectored_tramp)
-	__LOAD_HANDLER(r10, system_call_vectored_common)
+	__LOAD_HANDLER(r10, system_call_vectored_common, virt_trampolines)
 	mtctr	r10
 	bctr
 
 TRAMP_VIRT_BEGIN(system_call_vectored_sigill_tramp)
-	__LOAD_HANDLER(r10, system_call_vectored_sigill)
+	__LOAD_HANDLER(r10, system_call_vectored_sigill, virt_trampolines)
 	mtctr	r10
 	bctr
 #endif
@@ -949,7 +949,7 @@ TRAMP_REAL_BEGIN(system_reset_idle_wake)
 	/* We are waking up from idle, so may clobber any volatile register */
 	cmpwi	cr1,r5,2
 	bltlr	cr1	/* no state loss, return to idle caller with r3=SRR1 */
-	__LOAD_FAR_HANDLER(r12, DOTSYM(idle_return_gpr_loss))
+	__LOAD_FAR_HANDLER(r12, DOTSYM(idle_return_gpr_loss), real_trampolines)
 	mtctr	r12
 	bctr
 #endif
@@ -1945,12 +1945,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
 	HMT_MEDIUM
 
 	.if ! \virt
-	__LOAD_HANDLER(r10, system_call_common_real)
+	__LOAD_HANDLER(r10, system_call_common_real, real_vectors)
 	mtctr	r10
 	bctr
 	.else
 #ifdef CONFIG_RELOCATABLE
-	__LOAD_HANDLER(r10, system_call_common)
+	__LOAD_HANDLER(r10, system_call_common, virt_vectors)
 	mtctr	r10
 	bctr
 #else
@@ -2004,7 +2004,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	 * Requires __LOAD_FAR_HANDLER beause kvmppc_hcall lives
 	 * outside the head section.
 	 */
-	__LOAD_FAR_HANDLER(r10, kvmppc_hcall)
+	__LOAD_FAR_HANDLER(r10, kvmppc_hcall, real_trampolines)
 	mtctr   r10
 	bctr
 #else
@@ -3028,7 +3028,7 @@ USE_FIXED_SECTION(virt_trampolines)
 	.align	7
 	.globl	__end_interrupts
 __end_interrupts:
-DEFINE_FIXED_SYMBOL(__end_interrupts)
+DEFINE_FIXED_SYMBOL(__end_interrupts, virt_trampolines)
 
 CLOSE_FIXED_SECTION(real_vectors);
 CLOSE_FIXED_SECTION(real_trampolines);
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index a08c050ff645..5c5181e8d5f1 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -126,7 +126,7 @@ __secondary_hold_acknowledge:
 	. = 0x5c
 	.globl	__run_at_load
 __run_at_load:
-DEFINE_FIXED_SYMBOL(__run_at_load)
+DEFINE_FIXED_SYMBOL(__run_at_load, first_256B)
 	.long	RUN_AT_LOAD_DEFAULT
 #endif
 
@@ -156,7 +156,7 @@ __secondary_hold:
 	/* Tell the master cpu we're here */
 	/* Relocation is off & we are located at an address less */
 	/* than 0x100, so only need to grab low order offset.    */
-	std	r24,(ABS_ADDR(__secondary_hold_acknowledge))(0)
+	std	r24,(ABS_ADDR(__secondary_hold_acknowledge, first_256B))(0)
 	sync
 
 	li	r26,0
@@ -164,7 +164,7 @@ __secondary_hold:
 	tovirt(r26,r26)
 #endif
 	/* All secondary cpus wait here until told to start. */
-100:	ld	r12,(ABS_ADDR(__secondary_hold_spinloop))(r26)
+100:	ld	r12,(ABS_ADDR(__secondary_hold_spinloop, first_256B))(r26)
 	cmpdi	0,r12,0
 	beq	100b
 
@@ -649,15 +649,15 @@ __after_prom_start:
 3:
 #endif
 	/* # bytes of memory to copy */
-	lis	r5,(ABS_ADDR(copy_to_here))@ha
-	addi	r5,r5,(ABS_ADDR(copy_to_here))@l
+	lis	r5,(ABS_ADDR(copy_to_here, text))@ha
+	addi	r5,r5,(ABS_ADDR(copy_to_here, text))@l
 
 	bl	copy_and_flush		/* copy the first n bytes	 */
 					/* this includes the code being	 */
 					/* executed here.		 */
 	/* Jump to the copy of this code that we just made */
-	addis	r8,r3,(ABS_ADDR(4f))@ha
-	addi	r12,r8,(ABS_ADDR(4f))@l
+	addis	r8,r3,(ABS_ADDR(4f, text))@ha
+	addi	r12,r8,(ABS_ADDR(4f, text))@l
 	mtctr	r12
 	bctr
 
@@ -669,8 +669,8 @@ p_end: .8byte _end - copy_to_here
 	 * Now copy the rest of the kernel up to _end, add
 	 * _end - copy_to_here to the copy limit and run again.
 	 */
-	addis   r8,r26,(ABS_ADDR(p_end))@ha
-	ld      r8,(ABS_ADDR(p_end))@l(r8)
+	addis   r8,r26,(ABS_ADDR(p_end, text))@ha
+	ld      r8,(ABS_ADDR(p_end, text))@l(r8)
 	add	r5,r5,r8
 5:	bl	copy_and_flush		/* copy the rest */
 
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 2ad223597ca2..d3180139e35a 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -695,7 +695,7 @@ interrupt_return_macro hsrr
 
 	.globl __end_soft_masked
 __end_soft_masked:
-DEFINE_FIXED_SYMBOL(__end_soft_masked)
+DEFINE_FIXED_SYMBOL(__end_soft_masked, text)
 #endif /* CONFIG_PPC_BOOK3S */
 
 #ifdef CONFIG_PPC_BOOK3S
-- 
2.30.2

