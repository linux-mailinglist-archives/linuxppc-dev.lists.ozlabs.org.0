Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 582EA4B89C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 14:25:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzJcW5ct3z3dty
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 00:25:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G+BWaxtH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G+BWaxtH; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzJS253p0z3cV2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 00:18:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57FA46167F;
 Wed, 16 Feb 2022 13:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B93C340F1;
 Wed, 16 Feb 2022 13:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017504;
 bh=V6/ZfWZ1PAD3Y97L2QNR1QNU/2itdbWUv5bvEuYuqFQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G+BWaxtHTwqeKP/QpPO71xaAJ0BkMS3bmwMx/EXTxYhLqiD/HzsdOb4MriAju3yOR
 M7hRGfjLfaCWk059miGSd71d5x79vAxAFKFe2XRm69y5bH3YJO0RwmSEIdycc8bYxQ
 YKgq9w5PCvuZScjweCLAdy/HE1NVkfQbf5m06pksesoB7W/XASqrgE1EVpIgF1yNd7
 eG3j3wQxSmvdKjjsJgP7SPPaC6HdmpzUB+AiYzUdyeUhZodVQFpXDkyD2a2v94/cPg
 a//ISxhcqKOSu5DxmwwAG9H6AI0dylfA/i7kGuw6TY9ldeAc/9jZXWh7yd6a6Wby3g
 7p77UQ19zo26Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Subject: [PATCH v2 16/18] sh: remove CONFIG_SET_FS support
Date: Wed, 16 Feb 2022 14:13:30 +0100
Message-Id: <20220216131332.1489939-17-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, jcmvbkbc@gmail.com,
 guoren@kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, deller@gmx.de,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 mingo@redhat.com, geert@linux-m68k.org, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com, shorne@gmail.com,
 monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 nickhu@andestech.com, linux-mips@vger.kernel.org, dinguyen@kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

sh uses set_fs/get_fs only in one file, to handle address
errors in both user and kernel memory.

It already has an abstraction to differentiate between I/O
and memory, so adding a third class for kernel memory fits
into the same scheme and lets us kill off CONFIG_SET_FS.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/sh/Kconfig                   |  1 -
 arch/sh/include/asm/processor.h   |  1 -
 arch/sh/include/asm/segment.h     | 33 -------------------------------
 arch/sh/include/asm/thread_info.h |  2 --
 arch/sh/include/asm/uaccess.h     |  4 ----
 arch/sh/kernel/io_trapped.c       |  9 ++-------
 arch/sh/kernel/process_32.c       |  2 --
 arch/sh/kernel/traps_32.c         | 30 +++++++++++++++++-----------
 8 files changed, 21 insertions(+), 61 deletions(-)
 delete mode 100644 arch/sh/include/asm/segment.h

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 2474a04ceac4..f676e92b7d5b 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -65,7 +65,6 @@ config SUPERH
 	select PERF_EVENTS
 	select PERF_USE_VMALLOC
 	select RTC_LIB
-	select SET_FS
 	select SPARSE_IRQ
 	select TRACE_IRQFLAGS_SUPPORT
 	help
diff --git a/arch/sh/include/asm/processor.h b/arch/sh/include/asm/processor.h
index 3820d698846e..85a6c1c3c16e 100644
--- a/arch/sh/include/asm/processor.h
+++ b/arch/sh/include/asm/processor.h
@@ -3,7 +3,6 @@
 #define __ASM_SH_PROCESSOR_H
 
 #include <asm/cpu-features.h>
-#include <asm/segment.h>
 #include <asm/cache.h>
 
 #ifndef __ASSEMBLY__
diff --git a/arch/sh/include/asm/segment.h b/arch/sh/include/asm/segment.h
deleted file mode 100644
index 02e54a3335d6..000000000000
--- a/arch/sh/include/asm/segment.h
+++ /dev/null
@@ -1,33 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_SH_SEGMENT_H
-#define __ASM_SH_SEGMENT_H
-
-#ifndef __ASSEMBLY__
-
-typedef struct {
-	unsigned long seg;
-} mm_segment_t;
-
-#define MAKE_MM_SEG(s)	((mm_segment_t) { (s) })
-
-/*
- * The fs value determines whether argument validity checking should be
- * performed or not.  If get_fs() == USER_DS, checking is performed, with
- * get_fs() == KERNEL_DS, checking is bypassed.
- *
- * For historical reasons, these macros are grossly misnamed.
- */
-#define KERNEL_DS	MAKE_MM_SEG(0xFFFFFFFFUL)
-#ifdef CONFIG_MMU
-#define USER_DS		MAKE_MM_SEG(PAGE_OFFSET)
-#else
-#define USER_DS		KERNEL_DS
-#endif
-
-#define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
-
-#define get_fs()	(current_thread_info()->addr_limit)
-#define set_fs(x)	(current_thread_info()->addr_limit = (x))
-
-#endif /* __ASSEMBLY__ */
-#endif /* __ASM_SH_SEGMENT_H */
diff --git a/arch/sh/include/asm/thread_info.h b/arch/sh/include/asm/thread_info.h
index 598d0184ffea..b119b859a0a3 100644
--- a/arch/sh/include/asm/thread_info.h
+++ b/arch/sh/include/asm/thread_info.h
@@ -30,7 +30,6 @@ struct thread_info {
 	__u32			status;		/* thread synchronous flags */
 	__u32			cpu;
 	int			preempt_count; /* 0 => preemptable, <0 => BUG */
-	mm_segment_t		addr_limit;	/* thread address space */
 	unsigned long		previous_sp;	/* sp of previous stack in case
 						   of nested IRQ stacks */
 	__u8			supervisor_stack[0];
@@ -58,7 +57,6 @@ struct thread_info {
 	.status		= 0,			\
 	.cpu		= 0,			\
 	.preempt_count	= INIT_PREEMPT_COUNT,	\
-	.addr_limit	= KERNEL_DS,		\
 }
 
 /* how to get the current stack pointer from C */
diff --git a/arch/sh/include/asm/uaccess.h b/arch/sh/include/asm/uaccess.h
index ccd219d74851..a79609eb14be 100644
--- a/arch/sh/include/asm/uaccess.h
+++ b/arch/sh/include/asm/uaccess.h
@@ -2,11 +2,7 @@
 #ifndef __ASM_SH_UACCESS_H
 #define __ASM_SH_UACCESS_H
 
-#include <asm/segment.h>
 #include <asm/extable.h>
-
-#define user_addr_max()	(current_thread_info()->addr_limit.seg)
-
 #include <asm-generic/access_ok.h>
 
 /*
diff --git a/arch/sh/kernel/io_trapped.c b/arch/sh/kernel/io_trapped.c
index 004ad0130b10..e803b14ef12e 100644
--- a/arch/sh/kernel/io_trapped.c
+++ b/arch/sh/kernel/io_trapped.c
@@ -270,7 +270,6 @@ static struct mem_access trapped_io_access = {
 
 int handle_trapped_io(struct pt_regs *regs, unsigned long address)
 {
-	mm_segment_t oldfs;
 	insn_size_t instruction;
 	int tmp;
 
@@ -281,16 +280,12 @@ int handle_trapped_io(struct pt_regs *regs, unsigned long address)
 
 	WARN_ON(user_mode(regs));
 
-	oldfs = get_fs();
-	set_fs(KERNEL_DS);
-	if (copy_from_user(&instruction, (void *)(regs->pc),
-			   sizeof(instruction))) {
-		set_fs(oldfs);
+	if (copy_from_kernel_nofault(&instruction, (void *)(regs->pc),
+				     sizeof(instruction))) {
 		return 0;
 	}
 
 	tmp = handle_unaligned_access(instruction, regs,
 				      &trapped_io_access, 1, address);
-	set_fs(oldfs);
 	return tmp == 0;
 }
diff --git a/arch/sh/kernel/process_32.c b/arch/sh/kernel/process_32.c
index 1c28e3cddb60..ca01286a0610 100644
--- a/arch/sh/kernel/process_32.c
+++ b/arch/sh/kernel/process_32.c
@@ -123,7 +123,6 @@ int copy_thread(unsigned long clone_flags, unsigned long usp, unsigned long arg,
 #if defined(CONFIG_SH_FPU)
 		childregs->sr |= SR_FD;
 #endif
-		ti->addr_limit = KERNEL_DS;
 		ti->status &= ~TS_USEDFPU;
 		p->thread.fpu_counter = 0;
 		return 0;
@@ -132,7 +131,6 @@ int copy_thread(unsigned long clone_flags, unsigned long usp, unsigned long arg,
 
 	if (usp)
 		childregs->regs[15] = usp;
-	ti->addr_limit = USER_DS;
 
 	if (clone_flags & CLONE_SETTLS)
 		childregs->gbr = tls;
diff --git a/arch/sh/kernel/traps_32.c b/arch/sh/kernel/traps_32.c
index b3c715bc254b..6cdda3a621a1 100644
--- a/arch/sh/kernel/traps_32.c
+++ b/arch/sh/kernel/traps_32.c
@@ -75,6 +75,23 @@ static struct mem_access user_mem_access = {
 	copy_to_user,
 };
 
+static unsigned long copy_from_kernel_wrapper(void *dst, const void __user *src,
+					      unsigned long cnt)
+{
+	return copy_from_kernel_nofault(dst, (const void __force *)src, cnt);
+}
+
+static unsigned long copy_to_kernel_wrapper(void __user *dst, const void *src,
+					    unsigned long cnt)
+{
+	return copy_to_kernel_nofault((void __force *)dst, src, cnt);
+}
+
+static struct mem_access kernel_mem_access = {
+	copy_from_kernel_wrapper,
+	copy_to_kernel_wrapper,
+};
+
 /*
  * handle an instruction that does an unaligned memory access by emulating the
  * desired behaviour
@@ -473,7 +490,6 @@ asmlinkage void do_address_error(struct pt_regs *regs,
 				 unsigned long address)
 {
 	unsigned long error_code = 0;
-	mm_segment_t oldfs;
 	insn_size_t instruction;
 	int tmp;
 
@@ -489,13 +505,10 @@ asmlinkage void do_address_error(struct pt_regs *regs,
 		local_irq_enable();
 		inc_unaligned_user_access();
 
-		oldfs = force_uaccess_begin();
 		if (copy_from_user(&instruction, (insn_size_t __user *)(regs->pc & ~1),
 				   sizeof(instruction))) {
-			force_uaccess_end(oldfs);
 			goto uspace_segv;
 		}
-		force_uaccess_end(oldfs);
 
 		/* shout about userspace fixups */
 		unaligned_fixups_notify(current, instruction, regs);
@@ -518,11 +531,9 @@ asmlinkage void do_address_error(struct pt_regs *regs,
 			goto uspace_segv;
 		}
 
-		oldfs = force_uaccess_begin();
 		tmp = handle_unaligned_access(instruction, regs,
 					      &user_mem_access, 0,
 					      address);
-		force_uaccess_end(oldfs);
 
 		if (tmp == 0)
 			return; /* sorted */
@@ -538,21 +549,18 @@ asmlinkage void do_address_error(struct pt_regs *regs,
 		if (regs->pc & 1)
 			die("unaligned program counter", regs, error_code);
 
-		set_fs(KERNEL_DS);
-		if (copy_from_user(&instruction, (void __user *)(regs->pc),
+		if (copy_from_kernel_nofault(&instruction, (void *)(regs->pc),
 				   sizeof(instruction))) {
 			/* Argh. Fault on the instruction itself.
 			   This should never happen non-SMP
 			*/
-			set_fs(oldfs);
 			die("insn faulting in do_address_error", regs, 0);
 		}
 
 		unaligned_fixups_notify(current, instruction, regs);
 
-		handle_unaligned_access(instruction, regs, &user_mem_access,
+		handle_unaligned_access(instruction, regs, &kernel_mem_access,
 					0, address);
-		set_fs(oldfs);
 	}
 }
 
-- 
2.29.2

