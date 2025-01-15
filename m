Return-Path: <linuxppc-dev+bounces-5317-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53099A12EA9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 23:51:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLnP5bmKz3dBY;
	Thu, 16 Jan 2025 09:50:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736981449;
	cv=none; b=YmFcL26GknMipn3bka/UxWuBdyMfKOoBFO/x2zJ5nwBLwqSSNYE3q+nQ50fZWg8oC8cv1ZJgx6ayraj3ERAI5d4Gv3yKDxrRUZKwymFLiiOp/N5MF807yTXsYpXNpws1TlKdC1RfbH2XKaFIPSzmYWrJJ8e25l+SNUAzZXCEC9+iT1FN0F6SCtK0xEKlRSkW+IwYfAqqzb6UkXtnIHlmFmF9obNFoFPerZhplnTkHyQphjA4fJsq+8eew4ENyCvkgS82tU49iYTYK+CdgVwsvlX3rkyJyup/RvTbMsTUo5IovmHKzCKy6lt5dT9W9ZvAK4DLdug1U4soWr21ClQd7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736981449; c=relaxed/relaxed;
	bh=VKdHw/qdMwDUW18Ht1RVEl8s++dYXED6cbCr6EBIbC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NwnxrSWGWZIXsYWtb4QmyX51eby6JdkVN0pEa3cqRy3r3vF04FNeg7/601TeoUAGXX1QNVwSCbBvknGrcQX8x+O8EJQg55cpItKF+aLlICgQBvH9Du2Z7Df6v/ZJiXUJO77+J4bMCjBlKfeoXI2os962SJcGZfFvz4d1+Qo2La5C/Y07tm0nJxAbg1xbkKkzJGgO7cv15xYBKaevTf+AwIZxUscx9EUVguszDGZjKJi6JhC5yUBruzkbTQt2iqYGdRh9SCg75CA76Ppsgqfs8RgBgUFRLblS1BrIVRT4cHYV8qLbAKgHfkOo9s5MBCRhDXkhCHEMC8s9RQq8cG+MtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLnP0qXKz3cdD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 09:50:49 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLct50S8z9sSq;
	Wed, 15 Jan 2025 23:43:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kzmB7gqQMCTP; Wed, 15 Jan 2025 23:43:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLct3ptxz9sSn;
	Wed, 15 Jan 2025 23:43:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F3AF8B77A;
	Wed, 15 Jan 2025 23:43:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xL4HBP5zkE8F; Wed, 15 Jan 2025 23:43:26 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 08F088B774;
	Wed, 15 Jan 2025 23:43:23 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Julien Thierry <jthierry@redhat.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Raphael Gault <raphael.gault@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 14/15] powerpc/bug: Annotate reachable after warning trap
Date: Wed, 15 Jan 2025 23:42:54 +0100
Message-ID: <25e776852c18471a78dca172c6253e16e8d28c51.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980964; l=2325; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=buhY3GoC0LGY1HUaDu1bTWqVjA42DPm4i5qlmE4s1Nc=; b=Zzx0LN7CaVkiZJDwdxeV+ibCLDFY96znMCMxLBDAlvwLJ2kQLdeuupSEGG4ZBBiXYwNYUUDFV Q5UGbSOaXY1D8KkUN/X3yxxwGstc0o5rsND8gM0oXshr0I9HPzvQNOo
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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
index 1db485aacbd9..c41e9f903b5b 100644
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
+#define __WARN_FLAGS(flags) BUG_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags), ANNOTATE_REACHABLE(1b))
 
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
2.47.0


