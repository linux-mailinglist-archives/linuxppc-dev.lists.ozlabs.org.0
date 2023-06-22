Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C358F739F11
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 12:57:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qmy4q571sz3bl6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 20:57:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qmy2G2ylCz30PC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 20:55:18 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Qmy1y1tjlz9sRl;
	Thu, 22 Jun 2023 12:55:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Z_ayM7DivRu; Thu, 22 Jun 2023 12:55:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Qmy1v5Ms0z9sRn;
	Thu, 22 Jun 2023 12:54:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B4BDF8B763;
	Thu, 22 Jun 2023 12:54:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ycc1lKp4m78l; Thu, 22 Jun 2023 12:54:59 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.14])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E0CF8B767;
	Thu, 22 Jun 2023 12:54:59 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 35MAss182382575
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jun 2023 12:54:54 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 35MAssQm2382574;
	Thu, 22 Jun 2023 12:54:54 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v2 06/14] Revert "powerpc/bug: Provide better flexibility to WARN_ON/__WARN_FLAGS() with asm goto"
Date: Thu, 22 Jun 2023 12:54:28 +0200
Message-Id: <3d9a833f451e27c24fe705d6ab845979590be73e.1687430631.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687430631.git.christophe.leroy@csgroup.eu>
References: <cover.1687430631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687431271; l=6894; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=3RW612N+R2QBIWLhCpp0GHyd7UuL3xMbkiHybzjsti0=; b=Q1k0TnkhFxsJspb3TJppu1qlix3KqPI/U898qpNW6SpPfkYI3E+m7FJG8ojioo129mjtHiJpR +KgFqEIQze+AJgKARehsZZ9dMnhWPRG+EXau6oRGXDicN5zWCK6Sy1Y
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit 1e688dd2a3d6759d416616ff07afc4bb836c4213.

That commit aimed at optimising the code around generation of
WARN_ON/BUG_ON but this leads to a lot of dead code erroneously
generated by GCC.

That dead code becomes a problem when we start using objtool validation
because objtool will abort validation with a warning as soon as it
detects unreachable code. This is because unreachable code might
be the indication that objtool doesn't properly decode object text.

     text	   data	    bss	    dec	    hex	filename
  9551585	3627834	 224376	13403795	 cc8693	vmlinux.before
  9535281	3628358	 224376	13388015	 cc48ef	vmlinux.after

Once this change is reverted, in a standard configuration (pmac32 +
function tracer) the text is reduced by 16k which is around 1.7%

Taking into account that other problems are encountered with that
'asm goto' in WARN_ON(), including build failures, keeping that
change is not worth it allthough it is primarily a compiler bug.

So revert it for now.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Naveen N Rao <naveen@kernel.org>
---
v2: Do not remove tools/testing/selftests/powerpc/primitives/asm/extable.h and leave EX_TABLE in asm/extable.h
---
 arch/powerpc/include/asm/book3s/64/kup.h |  2 +-
 arch/powerpc/include/asm/bug.h           | 67 ++++--------------------
 arch/powerpc/kernel/misc_32.S            |  2 +-
 arch/powerpc/kernel/traps.c              |  9 +---
 4 files changed, 15 insertions(+), 65 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index f33e064b9f5f..7c8cc0f096b1 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -90,7 +90,7 @@
 	/* Prevent access to userspace using any key values */
 	LOAD_REG_IMMEDIATE(\gpr2, AMR_KUAP_BLOCKED)
 999:	tdne	\gpr1, \gpr2
-	EMIT_WARN_ENTRY 999b, __FILE__, __LINE__, (BUGFLAG_WARNING | BUGFLAG_ONCE)
+	EMIT_BUG_ENTRY 999b, __FILE__, __LINE__, (BUGFLAG_WARNING | BUGFLAG_ONCE)
 	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_BOOK3S_KUAP, 67)
 #endif
 .endm
diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index ef42adb44aa3..a565995fb742 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -4,14 +4,13 @@
 #ifdef __KERNEL__
 
 #include <asm/asm-compat.h>
-#include <asm/extable.h>
 
 #ifdef CONFIG_BUG
 
 #ifdef __ASSEMBLY__
 #include <asm/asm-offsets.h>
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-.macro __EMIT_BUG_ENTRY addr,file,line,flags
+.macro EMIT_BUG_ENTRY addr,file,line,flags
 	 .section __bug_table,"aw"
 5001:	 .4byte \addr - .
 	 .4byte 5002f - .
@@ -23,7 +22,7 @@
 	 .previous
 .endm
 #else
-.macro __EMIT_BUG_ENTRY addr,file,line,flags
+.macro EMIT_BUG_ENTRY addr,file,line,flags
 	 .section __bug_table,"aw"
 5001:	 .4byte \addr - .
 	 .short \flags
@@ -32,18 +31,6 @@
 .endm
 #endif /* verbose */
 
-.macro EMIT_WARN_ENTRY addr,file,line,flags
-	EX_TABLE(\addr,\addr+4)
-	__EMIT_BUG_ENTRY \addr,\file,\line,\flags
-.endm
-
-.macro EMIT_BUG_ENTRY addr,file,line,flags
-	.if \flags & 1 /* BUGFLAG_WARNING */
-	.err /* Use EMIT_WARN_ENTRY for warnings */
-	.endif
-	__EMIT_BUG_ENTRY \addr,\file,\line,\flags
-.endm
-
 #else /* !__ASSEMBLY__ */
 /* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
    sizeof(struct bug_entry), respectively */
@@ -73,16 +60,6 @@
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
 
-#define WARN_ENTRY(insn, flags, label, ...)		\
-	asm_volatile_goto(				\
-		"1:	" insn "\n"			\
-		EX_TABLE(1b, %l[label])			\
-		_EMIT_BUG_ENTRY				\
-		: : "i" (__FILE__), "i" (__LINE__),	\
-		  "i" (flags),				\
-		  "i" (sizeof(struct bug_entry)),	\
-		  ##__VA_ARGS__ : : label)
-
 /*
  * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
  * optimisations. However depending on the complexity of the condition
@@ -95,16 +72,7 @@
 } while (0)
 #define HAVE_ARCH_BUG
 
-#define __WARN_FLAGS(flags) do {				\
-	__label__ __label_warn_on;				\
-								\
-	WARN_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags), __label_warn_on); \
-	barrier_before_unreachable();				\
-	__builtin_unreachable();				\
-								\
-__label_warn_on:						\
-	break;							\
-} while (0)
+#define __WARN_FLAGS(flags) BUG_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags))
 
 #ifdef CONFIG_PPC64
 #define BUG_ON(x) do {						\
@@ -117,25 +85,15 @@ __label_warn_on:						\
 } while (0)
 
 #define WARN_ON(x) ({						\
-	bool __ret_warn_on = false;				\
-	do {							\
-		if (__builtin_constant_p((x))) {		\
-			if (!(x)) 				\
-				break; 				\
+	int __ret_warn_on = !!(x);				\
+	if (__builtin_constant_p(__ret_warn_on)) {		\
+		if (__ret_warn_on)				\
 			__WARN();				\
-			__ret_warn_on = true;			\
-		} else {					\
-			__label__ __label_warn_on;		\
-								\
-			WARN_ENTRY(PPC_TLNEI " %4, 0",		\
-				   BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
-				   __label_warn_on,		\
-				   "r" ((__force long)(x)));	\
-			break;					\
-__label_warn_on:						\
-			__ret_warn_on = true;			\
-		}						\
-	} while (0);						\
+	} else {						\
+		BUG_ENTRY(PPC_TLNEI " %4, 0",			\
+			  BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
+			  "r" (__ret_warn_on));	\
+	}							\
 	unlikely(__ret_warn_on);				\
 })
 
@@ -148,11 +106,8 @@ __label_warn_on:						\
 #ifdef __ASSEMBLY__
 .macro EMIT_BUG_ENTRY addr,file,line,flags
 .endm
-.macro EMIT_WARN_ENTRY addr,file,line,flags
-.endm
 #else /* !__ASSEMBLY__ */
 #define _EMIT_BUG_ENTRY
-#define _EMIT_WARN_ENTRY
 #endif
 #endif /* CONFIG_BUG */
 
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index daf8f87d2372..fd11ec42df89 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -237,7 +237,7 @@ _GLOBAL(copy_page)
 	addi	r3,r3,-4
 
 0:	twnei	r5, 0	/* WARN if r3 is not cache aligned */
-	EMIT_WARN_ENTRY 0b,__FILE__,__LINE__, BUGFLAG_WARNING
+	EMIT_BUG_ENTRY 0b,__FILE__,__LINE__, BUGFLAG_WARNING
 
 	addi	r4,r4,-4
 
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index e59ec6d32d37..7ef147e2a20d 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1508,13 +1508,8 @@ static void do_program_check(struct pt_regs *regs)
 
 		if (!(regs->msr & MSR_PR) &&  /* not user-mode */
 		    report_bug(bugaddr, regs) == BUG_TRAP_TYPE_WARN) {
-			const struct exception_table_entry *entry;
-
-			entry = search_exception_tables(bugaddr);
-			if (entry) {
-				regs_set_return_ip(regs, extable_fixup(entry) + regs->nip - bugaddr);
-				return;
-			}
+			regs_add_return_ip(regs, 4);
+			return;
 		}
 
 		if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE) && user_mode(regs)) {
-- 
2.40.1

