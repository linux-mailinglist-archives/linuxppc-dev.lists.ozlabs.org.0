Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D613FC7EE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 15:13:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzSKl3g9Kz2ybB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 23:12:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzSKG2GRJz2yHD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 23:12:30 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GzSK802cBz9sTX;
 Tue, 31 Aug 2021 15:12:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oIgIQjJLmJuV; Tue, 31 Aug 2021 15:12:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GzSK75vDfz9sT9;
 Tue, 31 Aug 2021 15:12:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8A0E38B7EE;
 Tue, 31 Aug 2021 15:12:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nvzuqENngpjM; Tue, 31 Aug 2021 15:12:27 +0200 (CEST)
Received: from po18078vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 426448B7ED;
 Tue, 31 Aug 2021 15:12:27 +0200 (CEST)
Received: by po18078vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 00A596BCA2; Tue, 31 Aug 2021 13:12:26 +0000 (UTC)
Message-Id: <97f252fcd63e145f54fbf85124c75fb01e96e1bb.1630415517.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2] powerpc/32: Add support for out-of-line static calls
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 31 Aug 2021 13:12:26 +0000 (UTC)
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

Add support for out-of-line static calls on PPC32. This change
improve performance of calls to global function pointers by
using direct calls instead of indirect calls.

The trampoline is initialy populated with a 'blr' or branch to target,
followed by an unreachable long jump sequence.

In order to cater with parallele execution, the trampoline needs to
be updated in a way that ensures it remains consistent at all time.
This means we can't use the traditional lis/addi to load r12 with
the target address, otherwise there would be a window during which
the first instruction contains the upper part of the new target
address while the second instruction still contains the lower part of
the old target address. To avoid that the target address is stored
just after the 'bctr' and loaded from there with a single instruction.

Then, depending on the target distance, arch_static_call_transform()
will either replace the first instruction by a direct 'bl <target>' or
'nop' in order to have the trampoline fall through the long jump
sequence.

Performancewise the long jump sequence is probably not better than
the indirect calls set by GCC when we don't use static calls, but
such calls are unlikely to be required on powerpc32: With most
configurations the kernel size is far below 32 Mbytes so only
modules may happen to be too far. And even modules are likely to
be close enough as they are allocated below the kernel core and
as close as possible of the kernel text.

static_call selftest is running successfully with this change.

With this patch, __do_irq() has the following sequence to trace
irq entries:

	c0004a00 <__SCT__tp_func_irq_entry>:
	c0004a00:	48 00 00 e0 	b       c0004ae0 <__traceiter_irq_entry>
	c0004a04:	3d 80 c0 00 	lis     r12,-16384
	c0004a08:	81 8c 4a 14 	lwz     r12,18964(r12)
	c0004a0c:	7d 89 03 a6 	mtctr   r12
	c0004a10:	4e 80 04 20 	bctr
	c0004a14:	00 00 00 00 	.long 0x0
	c0004a18:	60 00 00 00 	nop
	c0004a1c:	60 00 00 00 	nop
...
	c0005654 <__do_irq>:
...
	c0005664:	7c 7f 1b 78 	mr      r31,r3
...
	c00056a0:	81 22 00 00 	lwz     r9,0(r2)
	c00056a4:	39 29 00 01 	addi    r9,r9,1
	c00056a8:	91 22 00 00 	stw     r9,0(r2)
	c00056ac:	3d 20 c0 af 	lis     r9,-16209
	c00056b0:	81 29 74 cc 	lwz     r9,29900(r9)
	c00056b4:	2c 09 00 00 	cmpwi   r9,0
	c00056b8:	41 82 00 10 	beq     c00056c8 <__do_irq+0x74>
	c00056bc:	80 69 00 04 	lwz     r3,4(r9)
	c00056c0:	7f e4 fb 78 	mr      r4,r31
	c00056c4:	4b ff f3 3d 	bl      c0004a00 <__SCT__tp_func_irq_entry>

Before this patch, __do_irq() was doing the following to trace irq
entries:

	c0005700 <__do_irq>:
...
	c0005710:	7c 7e 1b 78 	mr      r30,r3
...
	c000574c:	93 e1 00 0c 	stw     r31,12(r1)
	c0005750:	81 22 00 00 	lwz     r9,0(r2)
	c0005754:	39 29 00 01 	addi    r9,r9,1
	c0005758:	91 22 00 00 	stw     r9,0(r2)
	c000575c:	3d 20 c0 af 	lis     r9,-16209
	c0005760:	83 e9 f4 cc 	lwz     r31,-2868(r9)
	c0005764:	2c 1f 00 00 	cmpwi   r31,0
	c0005768:	41 82 00 24 	beq     c000578c <__do_irq+0x8c>
	c000576c:	81 3f 00 00 	lwz     r9,0(r31)
	c0005770:	80 7f 00 04 	lwz     r3,4(r31)
	c0005774:	7d 29 03 a6 	mtctr   r9
	c0005778:	7f c4 f3 78 	mr      r4,r30
	c000577c:	4e 80 04 21 	bctrl
	c0005780:	85 3f 00 0c 	lwzu    r9,12(r31)
	c0005784:	2c 09 00 00 	cmpwi   r9,0
	c0005788:	40 82 ff e4 	bne     c000576c <__do_irq+0x6c>

Behind the fact of now using a direct 'bl' instead of a
'load/mtctr/bctr' sequence, we can also see that we get one less
register on the stack.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Use indirect load in long jump sequence to cater with parallele execution and preemption.
---
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/static_call.h | 25 ++++++++++++++++++
 arch/powerpc/kernel/Makefile           |  2 +-
 arch/powerpc/kernel/static_call.c      | 36 ++++++++++++++++++++++++++
 4 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/static_call.h
 create mode 100644 arch/powerpc/kernel/static_call.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 36b72d972568..a0fe69d8ec83 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -247,6 +247,7 @@ config PPC
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
 	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
+	select HAVE_STATIC_CALL			if PPC32
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING
 	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
diff --git a/arch/powerpc/include/asm/static_call.h b/arch/powerpc/include/asm/static_call.h
new file mode 100644
index 000000000000..2402c6d32439
--- /dev/null
+++ b/arch/powerpc/include/asm/static_call.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_STATIC_CALL_H
+#define _ASM_POWERPC_STATIC_CALL_H
+
+#define __POWERPC_SCT(name, inst)					\
+	asm(".pushsection .text, \"ax\"				\n"	\
+	    ".align 5						\n"	\
+	    ".globl " STATIC_CALL_TRAMP_STR(name) "		\n"	\
+	    STATIC_CALL_TRAMP_STR(name) ":			\n"	\
+	    inst "						\n"	\
+	    "	lis	12,1f@ha				\n"	\
+	    "	lwz	12,1f@l(12)				\n"	\
+	    "	mtctr	12					\n"	\
+	    "	bctr						\n"	\
+	    "1:	.long 0						\n"	\
+	    "	nop						\n"	\
+	    "	nop						\n"	\
+	    ".type " STATIC_CALL_TRAMP_STR(name) ", @function	\n"	\
+	    ".size " STATIC_CALL_TRAMP_STR(name) ", . - " STATIC_CALL_TRAMP_STR(name) " \n" \
+	    ".popsection					\n")
+
+#define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)	__POWERPC_SCT(name, "b " #func)
+#define ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)	__POWERPC_SCT(name, "blr")
+
+#endif /* _ASM_POWERPC_STATIC_CALL_H */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 7be36c1e1db6..0e3640e14eb1 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -106,7 +106,7 @@ extra-y				+= vmlinux.lds
 
 obj-$(CONFIG_RELOCATABLE)	+= reloc_$(BITS).o
 
-obj-$(CONFIG_PPC32)		+= entry_32.o setup_32.o early_32.o
+obj-$(CONFIG_PPC32)		+= entry_32.o setup_32.o early_32.o static_call.o
 obj-$(CONFIG_PPC64)		+= dma-iommu.o iommu.o
 obj-$(CONFIG_KGDB)		+= kgdb.o
 obj-$(CONFIG_BOOTX_TEXT)	+= btext.o
diff --git a/arch/powerpc/kernel/static_call.c b/arch/powerpc/kernel/static_call.c
new file mode 100644
index 000000000000..e5e78205ccb4
--- /dev/null
+++ b/arch/powerpc/kernel/static_call.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/memory.h>
+#include <linux/static_call.h>
+
+#include <asm/code-patching.h>
+
+void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
+{
+	int err;
+	unsigned long target = (long)func;
+	bool is_short = is_offset_in_branch_range((long)target - (long)tramp);
+
+	if (!tramp)
+		return;
+
+	mutex_lock(&text_mutex);
+
+	if (func && !is_short) {
+		err = patch_instruction(tramp + 20, ppc_inst(target));
+		if (err)
+			goto out;
+	}
+
+	if (!func)
+		err = patch_instruction(tramp, ppc_inst(PPC_RAW_BLR()));
+	else if (is_short)
+		err = patch_branch(tramp, target, 0);
+	else
+		err = patch_instruction(tramp, ppc_inst(PPC_RAW_NOP()));
+out:
+	mutex_unlock(&text_mutex);
+
+	if (err)
+		panic("%s: patching failed %pS at %pS\n", __func__, func, tramp);
+}
+EXPORT_SYMBOL_GPL(arch_static_call_transform);
-- 
2.25.0

