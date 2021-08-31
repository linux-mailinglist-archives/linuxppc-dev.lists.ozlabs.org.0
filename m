Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A46E3FC391
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 10:06:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzKWV2lv3z2yng
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 18:05:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzKW05BTyz2xtQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 18:05:29 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GzKVp5fByz9sTk;
 Tue, 31 Aug 2021 10:05:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kp6tBVa-EcAi; Tue, 31 Aug 2021 10:05:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GzKVp4cqCz9sTX;
 Tue, 31 Aug 2021 10:05:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 777968B7D4;
 Tue, 31 Aug 2021 10:05:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xoszIsJnp8OF; Tue, 31 Aug 2021 10:05:22 +0200 (CEST)
Received: from po18078vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ED3098B774;
 Tue, 31 Aug 2021 10:05:21 +0200 (CEST)
Received: by po18078vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A6B206BCA8; Tue, 31 Aug 2021 08:05:21 +0000 (UTC)
Message-Id: <cbfc0376461d02867c75cee72bb9167e16f4d0b0.1630396954.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/32: Add support for out-of-line static calls
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 31 Aug 2021 08:05:21 +0000 (UTC)
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

The trampoline is initialy populated with a 'blr' and 3 'nop'.
Then, depending on the target distance, arch_static_call_transform()
will either replace the 'blr' by a direct 'bl <target>' or an
indirect jump throught CTR register via a lis/addi/mtctr/bctr sequence.

static_call selftest is running successfully with this change.

With this patch, __do_irq() has the following sequence to trace
irq entries:

	c00049c0 <__SCT__tp_func_irq_entry>:
	c00049c0:	48 00 00 70 	b       c0004a30 <__traceiter_irq_entry>
	c00049c4:	60 00 00 00 	nop
	c00049c8:	60 00 00 00 	nop
	c00049cc:	60 00 00 00 	nop
...
	c00055a4 <__do_irq>:
...
	c00055b4:	7c 7f 1b 78 	mr      r31,r3
...
	c00055f0:	81 22 00 00 	lwz     r9,0(r2)
	c00055f4:	39 29 00 01 	addi    r9,r9,1
	c00055f8:	91 22 00 00 	stw     r9,0(r2)
	c00055fc:	3d 20 c0 af 	lis     r9,-16209
	c0005600:	81 29 74 cc 	lwz     r9,29900(r9)
	c0005604:	2c 09 00 00 	cmpwi   r9,0
	c0005608:	41 82 00 10 	beq     c0005618 <__do_irq+0x74>
	c000560c:	80 69 00 04 	lwz     r3,4(r9)
	c0005610:	7f e4 fb 78 	mr      r4,r31
	c0005614:	4b ff f3 ad 	bl      c00049c0 <__SCT__tp_func_irq_entry>

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

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/static_call.h | 31 +++++++++++++++++++
 arch/powerpc/kernel/Makefile           |  2 +-
 arch/powerpc/kernel/static_call.c      | 43 ++++++++++++++++++++++++++
 4 files changed, 76 insertions(+), 1 deletion(-)
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
index 000000000000..7cbefd845afc
--- /dev/null
+++ b/arch/powerpc/include/asm/static_call.h
@@ -0,0 +1,31 @@
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
+	    "	nop						\n"	\
+	    "	nop						\n"	\
+	    "	nop						\n"	\
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
+	    "	nop						\n"	\
+	    "	nop						\n"	\
+	    "	nop						\n"	\
+	    ".type " STATIC_CALL_TRAMP_STR(name) ", @function	\n"	\
+	    ".size " STATIC_CALL_TRAMP_STR(name) ", . - " STATIC_CALL_TRAMP_STR(name) " \n" \
+	    ".popsection					\n")
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
index 000000000000..72754bcaf758
--- /dev/null
+++ b/arch/powerpc/kernel/static_call.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/memory.h>
+#include <linux/static_call.h>
+
+#include <asm/code-patching.h>
+
+static int patch_trampoline_32(u32 *addr, unsigned long target)
+{
+	int err;
+
+	err = patch_instruction(addr++, ppc_inst(PPC_RAW_LIS(_R12, PPC_HA(target))));
+	err |= patch_instruction(addr++, ppc_inst(PPC_RAW_ADDI(_R12, _R12, PPC_LO(target))));
+	err |= patch_instruction(addr++, ppc_inst(PPC_RAW_MTCTR(_R12)));
+	err |= patch_instruction(addr, ppc_inst(PPC_RAW_BCTR()));
+
+	return err;
+}
+
+void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
+{
+	int err;
+	unsigned long target = (long)func;
+
+	if (!tramp)
+		return;
+
+	mutex_lock(&text_mutex);
+
+	if (!func)
+		err = patch_instruction(tramp, ppc_inst(PPC_RAW_BLR()));
+	else if (is_offset_in_branch_range((long)target - (long)tramp))
+		err = patch_branch(tramp, target, 0);
+	else if (IS_ENABLED(CONFIG_PPC32))
+		err = patch_trampoline_32(tramp, target);
+	else
+		BUILD_BUG();
+
+	mutex_unlock(&text_mutex);
+
+	if (err)
+		panic("%s: patching failed %pS at %pS\n", __func__, func, tramp);
+}
+EXPORT_SYMBOL_GPL(arch_static_call_transform);
-- 
2.25.0

