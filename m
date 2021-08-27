Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CFF3F978A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 11:46:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gwvx14d1kz3bVC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 19:46:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwvwY0lTNz2xXw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 19:45:44 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GwvwN5yKJz9sV1;
 Fri, 27 Aug 2021 11:45:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IyUH4zBPhE44; Fri, 27 Aug 2021 11:45:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GwvwN4xWKz9sV0;
 Fri, 27 Aug 2021 11:45:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C9628B8FB;
 Fri, 27 Aug 2021 11:45:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0I7EVrGgS5nC; Fri, 27 Aug 2021 11:45:39 +0200 (CEST)
Received: from po18078vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 69D158B8EC;
 Fri, 27 Aug 2021 11:45:38 +0200 (CEST)
Received: by po18078vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 49C346BC92; Fri, 27 Aug 2021 09:45:37 +0000 (UTC)
Message-Id: <8077899fee81f08a7dffbf185569d3a1f7a2ab68.1630057495.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH] powerpc: Investigate static_call concept
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 27 Aug 2021 09:45:37 +0000 (UTC)
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
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Jason Baron <jbaron@akamai.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This RFC is to validate the concept of static_call on powerpc.

Highly copied from x86.

It replaces ppc_md.get_irq() which is called at every IRQ, by
a static call.

When updating the call, we just replace the instruction at the
trampoline address by a relative jump to the function.

For the time being, the case of out-of-range functions is not handled.

Note that even if we don't immediately use static calls in powerpc
code, supporting static calls would immediately benefit to core
functionnalities using it, like tracing.

Tested on powerpc 8xx.

With the patch:

	00000000 <__SCT__ppc_md_get_irq>:
	   0:	4e 80 00 20 	blr			<== Replaced by 'b <ppc_md.get_irq>' at runtime
...
	00000038 <__do_irq>:
	  38:	94 21 ff f0 	stwu    r1,-16(r1)
	  3c:	7c 08 02 a6 	mflr    r0
	  40:	90 01 00 14 	stw     r0,20(r1)
	  44:	48 00 00 01 	bl      44 <__do_irq+0xc>
				44: R_PPC_REL24	__SCT__ppc_md_get_irq
...

Before the patch:

	00000038 <__do_irq>:
	  38:	3d 20 00 00 	lis     r9,0
				3a: R_PPC_ADDR16_HA	ppc_md+0x20
	  3c:	94 21 ff f0 	stwu    r1,-16(r1)
	  40:	81 29 00 00 	lwz     r9,0(r9)
				42: R_PPC_ADDR16_LO	ppc_md+0x20
	  44:	7c 08 02 a6 	mflr    r0
	  48:	90 01 00 14 	stw     r0,20(r1)
	  4c:	7d 29 03 a6 	mtctr   r9
	  50:	4e 80 04 21 	bctrl
...

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/machdep.h     |  3 +++
 arch/powerpc/include/asm/static_call.h | 25 +++++++++++++++++++++++++
 arch/powerpc/kernel/Makefile           |  2 +-
 arch/powerpc/kernel/irq.c              |  2 +-
 arch/powerpc/kernel/setup-common.c     |  4 ++++
 arch/powerpc/kernel/static_call.c      | 16 ++++++++++++++++
 7 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/include/asm/static_call.h
 create mode 100644 arch/powerpc/kernel/static_call.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 36b72d972568..c3930ea63e59 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -247,6 +247,7 @@ config PPC
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
 	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
+	select HAVE_STATIC_CALL
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING
 	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 764f2732a821..ac9712312b76 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -7,6 +7,7 @@
 #include <linux/init.h>
 #include <linux/dma-mapping.h>
 #include <linux/export.h>
+#include <linux/static_call_types.h>
 
 #include <asm/setup.h>
 
@@ -295,5 +296,7 @@ static inline void log_error(char *buf, unsigned int err_type, int fatal)
 #define machine_late_initcall(mach, fn)		__define_machine_initcall(mach, fn, 7)
 #define machine_late_initcall_sync(mach, fn)	__define_machine_initcall(mach, fn, 7s)
 
+DECLARE_STATIC_CALL(ppc_md_get_irq, *ppc_md.get_irq);
+
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_MACHDEP_H */
diff --git a/arch/powerpc/include/asm/static_call.h b/arch/powerpc/include/asm/static_call.h
new file mode 100644
index 000000000000..335ee4ceaef9
--- /dev/null
+++ b/arch/powerpc/include/asm/static_call.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_STATIC_CALL_H
+#define _ASM_POWERPC_STATIC_CALL_H
+
+#define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)			\
+	asm(".pushsection .text, \"ax\"				\n"	\
+	    ".align 4						\n"	\
+	    ".globl " STATIC_CALL_TRAMP_STR(name) "		\n"	\
+	    STATIC_CALL_TRAMP_STR(name) ":			\n"	\
+	    "	b " #func "					\n"	\
+	    ".type " STATIC_CALL_TRAMP_STR(name) ", @function	\n"	\
+	    ".size " STATIC_CALL_TRAMP_STR(name) ", . - " STATIC_CALL_TRAMP_STR(name) " \n" \
+	    ".popsection					\n")
+
+#define ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)			\
+	asm(".pushsection .text, \"ax\"				\n"	\
+	    ".align 4						\n"	\
+	    ".globl " STATIC_CALL_TRAMP_STR(name) "		\n"	\
+	    STATIC_CALL_TRAMP_STR(name) ":			\n"	\
+	    "	blr						\n"	\
+	    ".type " STATIC_CALL_TRAMP_STR(name) ", @function	\n"	\
+	    ".size " STATIC_CALL_TRAMP_STR(name) ", . - " STATIC_CALL_TRAMP_STR(name) " \n" \
+	    ".popsection					\n")
+
+#endif /* _ASM_POWERPC_STATIC_CALL_H */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 7be36c1e1db6..08877252dff8 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -47,7 +47,7 @@ obj-y				:= cputable.o syscalls.o \
 				   udbg.o misc.o io.o misc_$(BITS).o \
 				   of_platform.o prom_parse.o firmware.o \
 				   hw_breakpoint_constraints.o interrupt.o \
-				   kdebugfs.o
+				   kdebugfs.o static_call.o
 obj-y				+= ptrace/
 obj-$(CONFIG_PPC64)		+= setup_64.o \
 				   paca.o nvram_64.o note.o
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 551b653228c4..872f46e20754 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -736,7 +736,7 @@ void __do_irq(struct pt_regs *regs)
 	 *
 	 * This will typically lower the interrupt line to the CPU
 	 */
-	irq = ppc_md.get_irq();
+	irq = static_call(ppc_md_get_irq)();
 
 	/* We can hard enable interrupts now to allow perf interrupts */
 	may_hard_irq_enable();
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index b1e43b69a559..57d06c163b7b 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -33,6 +33,7 @@
 #include <linux/of_platform.h>
 #include <linux/hugetlb.h>
 #include <linux/pgtable.h>
+#include <linux/static_call.h>
 #include <asm/io.h>
 #include <asm/paca.h>
 #include <asm/prom.h>
@@ -81,6 +82,8 @@ EXPORT_SYMBOL(ppc_md);
 struct machdep_calls *machine_id;
 EXPORT_SYMBOL(machine_id);
 
+DEFINE_STATIC_CALL_NULL(ppc_md_get_irq, *ppc_md.get_irq);
+
 int boot_cpuid = -1;
 EXPORT_SYMBOL_GPL(boot_cpuid);
 
@@ -613,6 +616,7 @@ void probe_machine(void)
 	     machine_id++) {
 		DBG("  %s ...", machine_id->name);
 		memcpy(&ppc_md, machine_id, sizeof(struct machdep_calls));
+		static_call_update(ppc_md_get_irq, ppc_md.get_irq);
 		if (ppc_md.probe()) {
 			DBG(" match !\n");
 			break;
diff --git a/arch/powerpc/kernel/static_call.c b/arch/powerpc/kernel/static_call.c
new file mode 100644
index 000000000000..a281f1759c39
--- /dev/null
+++ b/arch/powerpc/kernel/static_call.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/memory.h>
+#include <linux/static_call.h>
+
+#include <asm/code-patching.h>
+
+void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
+{
+	mutex_lock(&text_mutex);
+
+	if (tramp)
+		patch_branch(tramp, (unsigned long)func, 0);
+
+	mutex_unlock(&text_mutex);
+}
+EXPORT_SYMBOL_GPL(arch_static_call_transform);
-- 
2.25.0

