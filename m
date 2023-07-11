Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6D774F4AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:16:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0mFt0pRwz3dnk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:16:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0m6Z1v4fz3dDx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 02:09:57 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4R0m5T0t1nz9sFN;
	Tue, 11 Jul 2023 18:09:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cb6bd6PfmnXE; Tue, 11 Jul 2023 18:09:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4R0m5C5dMsz9sFQ;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BC9D08B77A;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id F972A_zmHncX; Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.184])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E0E7D8B781;
	Tue, 11 Jul 2023 18:08:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 36BG8k5Y3696856
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 18:08:46 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 36BG8kEP3696855;
	Tue, 11 Jul 2023 18:08:46 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v4 14/15] powerpc/bug: Annotate reachable after warning trap
Date: Tue, 11 Jul 2023 18:08:40 +0200
Message-ID: <1d0c74a6106d5fecfd8f239321ba2da617dee670.1689091394.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1689091394.git.christophe.leroy@csgroup.eu>
References: <cover.1689091394.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689091706; l=2316; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Q4KoEmfRU5YGxWGaGueViyifVjWCMOMZMztPFWckfcQ=; b=Z4VKe0ry8lBipzOg6VJFLZuidr4j8nhCjOrfMebsrUEgIofqyeNOahLy1bn14jlt51SCs83Kn yHDafrf+qqJBxsDAcTnnwuarbxzmXAbOzHiQHatc92yccydDPFtkMA6
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

This commit is copied from commit bfb1a7c91fb7 ("x86/bug: Merge
annotate_reachable() into _BUG_FLAGS() asm")

'twi 31,0,0' is a BUG instruction, which is by default a dead end.

But the same instruction is used for WARNINGs and the execution
resumes with the following instruction. Mark it reachable so
that objtool knows that it is not a dead end in that case.

Also change the unreachable() annotation by __builtin_unreachable()
since objtool already knows that a BUG instruction is a dead end.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/bug.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index abb608dff15a..1c204ee4cc03 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -4,6 +4,7 @@
 #ifdef __KERNEL__
 
 #include <asm/asm-compat.h>
+#include <linux/objtool.h>
 
 #ifdef CONFIG_BUG
 
@@ -51,10 +52,11 @@
 	".previous\n"
 #endif
 
-#define BUG_ENTRY(insn, flags, ...)			\
+#define BUG_ENTRY(insn, flags, extra, ...)		\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
 		_EMIT_BUG_ENTRY				\
+		extra					\
 		: : "i" (__FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
@@ -67,12 +69,12 @@
  */
 
 #define BUG() do {						\
-	BUG_ENTRY("twi 31, 0, 0", 0);				\
-	unreachable();						\
+	BUG_ENTRY("twi 31, 0, 0", 0, "");			\
+	__builtin_unreachable();				\
 } while (0)
 #define HAVE_ARCH_BUG
 
-#define __WARN_FLAGS(flags) BUG_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags))
+#define __WARN_FLAGS(flags) BUG_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags), ASM_REACHABLE)
 
 #ifdef CONFIG_PPC64
 #define BUG_ON(x) do {						\
@@ -80,7 +82,7 @@
 		if (x)						\
 			BUG();					\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0", 0, "r" ((__force long)(x)));	\
+		BUG_ENTRY(PPC_TLNEI " %4, 0", 0, "", "r" ((__force long)(x)));	\
 	}							\
 } while (0)
 
@@ -92,7 +94,7 @@
 	} else {						\
 		BUG_ENTRY(PPC_TLNEI " %4, 0",			\
 			  BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
-			  "r" (__ret_warn_on));	\
+			  "", "r" (__ret_warn_on));	\
 	}							\
 	unlikely(__ret_warn_on);				\
 })
-- 
2.41.0

