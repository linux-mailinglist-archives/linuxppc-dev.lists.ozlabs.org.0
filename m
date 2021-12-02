Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A335466308
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 13:03:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4ZNq1Zyyz3dwv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 23:03:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4ZKy5RLLz3cPP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 23:01:10 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J4ZKS2SPKz9sSv;
 Thu,  2 Dec 2021 13:00:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8tJds5jsB6aC; Thu,  2 Dec 2021 13:00:44 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J4ZKM0vTlz9sSs;
 Thu,  2 Dec 2021 13:00:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 09ACB8B7BB;
 Thu,  2 Dec 2021 13:00:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5TCzBRhqZpeH; Thu,  2 Dec 2021 13:00:38 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.163])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 408928B7C4;
 Thu,  2 Dec 2021 13:00:38 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1B2C0WEM177265
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 2 Dec 2021 13:00:32 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1B2C0WM6177264;
 Thu, 2 Dec 2021 13:00:32 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 07/11] powerpc/code-patching: Use test_trampoline for
 prefixed patch test
Date: Thu,  2 Dec 2021 13:00:23 +0100
Message-Id: <a450ef3f8653f75e1bd9aaf7a3889d379752f33b.1638446239.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <3ff9823c0a812a8a145d979a9600a6d4591b80ee.1638446239.git.christophe.leroy@csgroup.eu>
References: <3ff9823c0a812a8a145d979a9600a6d4591b80ee.1638446239.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1638446425; l=3074; s=20211009;
 h=from:subject:message-id; bh=1ovr+vJj/rE7GT/un8xNYmuW1nbDbL2W/227PNgRCuY=;
 b=wr4eKp/74jjSPfoRdXm/8Vwa+toe8BOaTlQ47KFVez17ETBBU6EeQBDzwrX+UYLAFU48OtAiAVoT
 3o6SghUKDiDGG7Vblov8mRL2lXxLrwdTP+5uA+AEG4/8oULr89jr
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the dedicated test_trampoline function for testing prefixed
patching like other tests and remove the hand coded assembly stuff.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/Makefile             |  2 +-
 arch/powerpc/lib/code-patching.c      | 24 +++++++++---------------
 arch/powerpc/lib/test_code-patching.S | 20 --------------------
 3 files changed, 10 insertions(+), 36 deletions(-)
 delete mode 100644 arch/powerpc/lib/test_code-patching.S

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 9e5d0f413b71..c2654894b468 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -19,7 +19,7 @@ CFLAGS_code-patching.o += -DDISABLE_BRANCH_PROFILING
 CFLAGS_feature-fixups.o += -DDISABLE_BRANCH_PROFILING
 endif
 
-obj-y += alloc.o code-patching.o feature-fixups.o pmem.o test_code-patching.o
+obj-y += alloc.o code-patching.o feature-fixups.o pmem.o
 
 ifndef CONFIG_KASAN
 obj-y	+=	string.o memcmp_$(BITS).o
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index e7a2a41ae8eb..2d878e67df3f 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -399,7 +399,7 @@ static int instr_is_branch_to_addr(const u32 *instr, unsigned long addr)
 
 static void __init test_trampoline(void)
 {
-	asm ("nop;\n");
+	asm ("nop;nop;\n");
 }
 
 #define check(x)	do {	\
@@ -708,25 +708,19 @@ static void __init test_translate_branch(void)
 	vfree(buf);
 }
 
-#ifdef CONFIG_PPC64
 static void __init test_prefixed_patching(void)
 {
-	extern unsigned int code_patching_test1[];
-	extern unsigned int code_patching_test1_expected[];
-	extern unsigned int end_code_patching_test1[];
+	u32 *iptr = (u32 *)ppc_function_entry(test_trampoline);
+	u32 expected[2] = {OP_PREFIX << 26, 0};
+	ppc_inst_t inst = ppc_inst_prefix(OP_PREFIX << 26, 0);
 
-	__patch_instruction(code_patching_test1,
-			    ppc_inst_prefix(OP_PREFIX << 26, 0x00000000),
-			    code_patching_test1);
+	if (!IS_ENABLED(CONFIG_PPC64))
+		return;
+
+	patch_instruction(iptr, inst);
 
-	check(!memcmp(code_patching_test1,
-		      code_patching_test1_expected,
-		      sizeof(unsigned int) *
-		      (end_code_patching_test1 - code_patching_test1)));
+	check(!memcmp(iptr, expected, sizeof(expected)));
 }
-#else
-static inline void test_prefixed_patching(void) {}
-#endif
 
 static int __init test_code_patching(void)
 {
diff --git a/arch/powerpc/lib/test_code-patching.S b/arch/powerpc/lib/test_code-patching.S
deleted file mode 100644
index a9be6107844e..000000000000
--- a/arch/powerpc/lib/test_code-patching.S
+++ /dev/null
@@ -1,20 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2020 IBM Corporation
- */
-#include <asm/ppc-opcode.h>
-
-	.text
-
-#define globl(x)		\
-	.globl x;	\
-x:
-
-globl(code_patching_test1)
-	nop
-	nop
-globl(end_code_patching_test1)
-
-globl(code_patching_test1_expected)
-	.long OP_PREFIX << 26
-	.long 0x0000000
-- 
2.33.1

