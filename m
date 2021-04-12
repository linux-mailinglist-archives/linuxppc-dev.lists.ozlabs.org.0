Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FDD35CBAB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 18:26:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJvJS5zWDz3c8l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 02:26:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJvHs3fcyz3c8M
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 02:26:15 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FJvHf0gKTz9tyRc;
 Mon, 12 Apr 2021 18:26:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id eI-OtnajV8hN; Mon, 12 Apr 2021 18:26:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FJvHd6CFGz9tyRZ;
 Mon, 12 Apr 2021 18:26:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3EA498B78F;
 Mon, 12 Apr 2021 18:26:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ficxVWvXmek0; Mon, 12 Apr 2021 18:26:11 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BE3978B78E;
 Mon, 12 Apr 2021 18:26:10 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9BBAB679DE; Mon, 12 Apr 2021 16:26:10 +0000 (UTC)
Message-Id: <1bb9d3f49f3c720e62cb0842adc3813fe15f7505.1618244758.git.christophe.leroy@csgroup.eu>
In-Reply-To: <b286e07fb771a664b631cd07a40b09c06f26e64b.1618244758.git.christophe.leroy@csgroup.eu>
References: <b286e07fb771a664b631cd07a40b09c06f26e64b.1618244758.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/2] powerpc/bug: Provide better flexibility to
 WARN_ON/__WARN_FLAGS() with asm goto
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 12 Apr 2021 16:26:10 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Using asm goto in __WARN_FLAGS() and WARN_ON() allows more
flexibility to GCC.

For that add an entry to the exception table so that
program_check_exception() knowns where to resume execution
after a WARNING.

Here are two exemples. The first one is done on PPC32 (which
benefits from the previous patch), the second is on PPC64.

	unsigned long test(struct pt_regs *regs)
	{
		int ret;

		WARN_ON(regs->msr & MSR_PR);

		return regs->gpr[3];
	}

	unsigned long test9w(unsigned long a, unsigned long b)
	{
		if (WARN_ON(!b))
			return 0;
		return a / b;
	}

Before the patch:

	000003a8 <test>:
	 3a8:	81 23 00 84 	lwz     r9,132(r3)
	 3ac:	71 29 40 00 	andi.   r9,r9,16384
	 3b0:	40 82 00 0c 	bne     3bc <test+0x14>
	 3b4:	80 63 00 0c 	lwz     r3,12(r3)
	 3b8:	4e 80 00 20 	blr

	 3bc:	0f e0 00 00 	twui    r0,0
	 3c0:	80 63 00 0c 	lwz     r3,12(r3)
	 3c4:	4e 80 00 20 	blr

	0000000000000bf0 <.test9w>:
	 bf0:	7c 89 00 74 	cntlzd  r9,r4
	 bf4:	79 29 d1 82 	rldicl  r9,r9,58,6
	 bf8:	0b 09 00 00 	tdnei   r9,0
	 bfc:	2c 24 00 00 	cmpdi   r4,0
	 c00:	41 82 00 0c 	beq     c0c <.test9w+0x1c>
	 c04:	7c 63 23 92 	divdu   r3,r3,r4
	 c08:	4e 80 00 20 	blr

	 c0c:	38 60 00 00 	li      r3,0
	 c10:	4e 80 00 20 	blr

After the patch:

	000003a8 <test>:
	 3a8:	81 23 00 84 	lwz     r9,132(r3)
	 3ac:	71 29 40 00 	andi.   r9,r9,16384
	 3b0:	40 82 00 0c 	bne     3bc <test+0x14>
	 3b4:	80 63 00 0c 	lwz     r3,12(r3)
	 3b8:	4e 80 00 20 	blr

	 3bc:	0f e0 00 00 	twui    r0,0

	0000000000000c50 <.test9w>:
	 c50:	7c 89 00 74 	cntlzd  r9,r4
	 c54:	79 29 d1 82 	rldicl  r9,r9,58,6
	 c58:	0b 09 00 00 	tdnei   r9,0
	 c5c:	7c 63 23 92 	divdu   r3,r3,r4
	 c60:	4e 80 00 20 	blr

	 c70:	38 60 00 00 	li      r3,0
	 c74:	4e 80 00 20 	blr

In the first exemple, we see GCC doesn't need to duplicate what
happens after the trap.

In the second exemple, we see that GCC doesn't need to emit a test
and a branch in the likely path in addition to the trap.

We've got some WARN_ON() in .softirqentry.text section so it needs
to be added in the OTHER_TEXT_SECTIONS in modpost.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/kup.h |  2 +-
 arch/powerpc/include/asm/bug.h           | 51 +++++++++++++++++++-----
 arch/powerpc/include/asm/extable.h       | 14 +++++++
 arch/powerpc/include/asm/ppc_asm.h       | 11 +----
 arch/powerpc/kernel/entry_64.S           |  2 +-
 arch/powerpc/kernel/exceptions-64e.S     |  2 +-
 arch/powerpc/kernel/misc_32.S            |  2 +-
 arch/powerpc/kernel/traps.c              |  9 ++++-
 scripts/mod/modpost.c                    |  2 +-
 9 files changed, 69 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 9700da3a4093..a22839cba32e 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -90,7 +90,7 @@
 	/* Prevent access to userspace using any key values */
 	LOAD_REG_IMMEDIATE(\gpr2, AMR_KUAP_BLOCKED)
 999:	tdne	\gpr1, \gpr2
-	EMIT_BUG_ENTRY 999b, __FILE__, __LINE__, (BUGFLAG_WARNING | BUGFLAG_ONCE)
+	EMIT_WARN_ENTRY 999b, __FILE__, __LINE__, (BUGFLAG_WARNING | BUGFLAG_ONCE)
 	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_BOOK3S_KUAP, 67)
 #endif
 .endm
diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 101dea4eec8d..d92afdbd4449 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -4,6 +4,7 @@
 #ifdef __KERNEL__
 
 #include <asm/asm-compat.h>
+#include <asm/extable.h>
 
 #ifdef CONFIG_BUG
 
@@ -30,6 +31,11 @@
 .endm
 #endif /* verbose */
 
+.macro EMIT_WARN_ENTRY addr,file,line,flags
+	EX_TABLE(\addr,\addr+4)
+	EMIT_BUG_ENTRY \addr,\file,\line,\flags
+.endm
+
 #else /* !__ASSEMBLY__ */
 /* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
    sizeof(struct bug_entry), respectively */
@@ -58,6 +64,16 @@
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
 
+#define WARN_ENTRY(insn, flags, label, ...)		\
+	asm_volatile_goto(				\
+		"1:	" insn "\n"			\
+		EX_TABLE(1b, %l[label])			\
+		_EMIT_BUG_ENTRY				\
+		: : "i" (__FILE__), "i" (__LINE__),	\
+		  "i" (flags),				\
+		  "i" (sizeof(struct bug_entry)),	\
+		  ##__VA_ARGS__ : : label)
+
 /*
  * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
  * optimisations. However depending on the complexity of the condition
@@ -70,7 +86,15 @@
 } while (0)
 #define HAVE_ARCH_BUG
 
-#define __WARN_FLAGS(flags) BUG_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags))
+#define __WARN_FLAGS(flags) do {				\
+	__label__ __label_warn_on;				\
+								\
+	WARN_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags), __label_warn_on); \
+	unreachable();						\
+								\
+__label_warn_on:						\
+	break;							\
+} while (0)
 
 #ifdef CONFIG_PPC64
 #define BUG_ON(x) do {						\
@@ -83,15 +107,24 @@
 } while (0)
 
 #define WARN_ON(x) ({						\
-	int __ret_warn_on = !!(x);				\
-	if (__builtin_constant_p(__ret_warn_on)) {		\
-		if (__ret_warn_on)				\
+	bool __ret_warn_on = false;				\
+	do {							\
+		if (__builtin_constant_p((x))) {		\
+			if (!(x)) 				\
+				break; 				\
 			__WARN();				\
-	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0",			\
-			  BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
-			  "r" (__ret_warn_on));	\
-	}							\
+			__ret_warn_on = true;			\
+		} else {					\
+			__label__ __label_warn_on;		\
+								\
+			WARN_ENTRY(PPC_TLNEI " %4, 0",		\
+				   BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
+				   __label_warn_on, "r" (x));	\
+			break;					\
+__label_warn_on:						\
+			__ret_warn_on = true;			\
+		}						\
+	} while (0);						\
 	unlikely(__ret_warn_on);				\
 })
 
diff --git a/arch/powerpc/include/asm/extable.h b/arch/powerpc/include/asm/extable.h
index eb91b2d2935a..26ce2e5c0fa8 100644
--- a/arch/powerpc/include/asm/extable.h
+++ b/arch/powerpc/include/asm/extable.h
@@ -17,6 +17,8 @@
 
 #define ARCH_HAS_RELATIVE_EXTABLE
 
+#ifndef __ASSEMBLY__
+
 struct exception_table_entry {
 	int insn;
 	int fixup;
@@ -28,3 +30,15 @@ static inline unsigned long extable_fixup(const struct exception_table_entry *x)
 }
 
 #endif
+
+/*
+ * Helper macro for exception table entries
+ */
+#define EX_TABLE(_fault, _target)		\
+	stringify_in_c(.section __ex_table,"a";)\
+	stringify_in_c(.balign 4;)		\
+	stringify_in_c(.long (_fault) - . ;)	\
+	stringify_in_c(.long (_target) - . ;)	\
+	stringify_in_c(.previous)
+
+#endif
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 8998122fc7e2..a74e1561535a 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -10,6 +10,7 @@
 #include <asm/ppc-opcode.h>
 #include <asm/firmware.h>
 #include <asm/feature-fixups.h>
+#include <asm/extable.h>
 
 #ifdef __ASSEMBLY__
 
@@ -772,16 +773,6 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
 
 #endif /*  __ASSEMBLY__ */
 
-/*
- * Helper macro for exception table entries
- */
-#define EX_TABLE(_fault, _target)		\
-	stringify_in_c(.section __ex_table,"a";)\
-	stringify_in_c(.balign 4;)		\
-	stringify_in_c(.long (_fault) - . ;)	\
-	stringify_in_c(.long (_target) - . ;)	\
-	stringify_in_c(.previous)
-
 #ifdef CONFIG_PPC_FSL_BOOK3E
 #define BTB_FLUSH(reg)			\
 	lis reg,BUCSR_INIT@h;		\
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 6c4d9e276c4d..faa64cc90f02 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -835,7 +835,7 @@ _GLOBAL(enter_rtas)
 	 */
 	lbz	r0,PACAIRQSOFTMASK(r13)
 1:	tdeqi	r0,IRQS_ENABLED
-	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,BUGFLAG_WARNING
+	EMIT_WARN_ENTRY 1b,__FILE__,__LINE__,BUGFLAG_WARNING
 #endif
 
 	/* Hard-disable interrupts */
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index e8eb9992a270..3f8c51390a04 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -1249,7 +1249,7 @@ fast_exception_return:
 	/* The interrupt should not have soft enabled. */
 	lbz	r7,PACAIRQSOFTMASK(r13)
 1:	tdeqi	r7,IRQS_ENABLED
-	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,BUGFLAG_WARNING
+	EMIT_WARN_ENTRY 1b,__FILE__,__LINE__,BUGFLAG_WARNING
 #endif
 	b	fast_exception_return
 
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index 6a076bef2932..21390f3119a9 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -237,7 +237,7 @@ _GLOBAL(copy_page)
 	addi	r3,r3,-4
 
 0:	twnei	r5, 0	/* WARN if r3 is not cache aligned */
-	EMIT_BUG_ENTRY 0b,__FILE__,__LINE__, BUGFLAG_WARNING
+	EMIT_WARN_ENTRY 0b,__FILE__,__LINE__, BUGFLAG_WARNING
 
 	addi	r4,r4,-4
 
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index efba99870691..ee40a637313d 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1467,8 +1467,13 @@ static void do_program_check(struct pt_regs *regs)
 
 		if (!(regs->msr & MSR_PR) &&  /* not user-mode */
 		    report_bug(bugaddr, regs) == BUG_TRAP_TYPE_WARN) {
-			regs->nip += 4;
-			return;
+			const struct exception_table_entry *entry;
+
+			entry = search_exception_tables(bugaddr);
+			if (entry) {
+				regs->nip = extable_fixup(entry) + regs->nip - bugaddr;
+				return;
+			}
 		}
 		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
 		return;
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 24725e50c7b4..34745f239208 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -926,7 +926,7 @@ static void check_section(const char *modname, struct elf_info *elf,
 		".kprobes.text", ".cpuidle.text", ".noinstr.text"
 #define OTHER_TEXT_SECTIONS ".ref.text", ".head.text", ".spinlock.text", \
 		".fixup", ".entry.text", ".exception.text", ".text.*", \
-		".coldtext"
+		".coldtext .softirqentry.text"
 
 #define INIT_SECTIONS      ".init.*"
 #define MEM_INIT_SECTIONS  ".meminit.*"
-- 
2.25.0

