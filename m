Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ABF4662F8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 13:01:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4ZKx69Tyz3cP5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 23:01:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4ZKV1ytGz2yb3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 23:00:43 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J4ZKL6DJgz9sSX;
 Thu,  2 Dec 2021 13:00:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zIl2SpClUTkL; Thu,  2 Dec 2021 13:00:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J4ZKL4wH9z9sSM;
 Thu,  2 Dec 2021 13:00:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 993858B7CF;
 Thu,  2 Dec 2021 13:00:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EeCYdGBNA92H; Thu,  2 Dec 2021 13:00:38 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.163])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3CD4F8B7BB;
 Thu,  2 Dec 2021 13:00:38 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1B2C0WXU177281
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 2 Dec 2021 13:00:32 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1B2C0Wwe177280;
 Thu, 2 Dec 2021 13:00:32 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 11/11] powerpc/code-patching: Replace patch_instruction()
 by ppc_inst_write() in selftests
Date: Thu,  2 Dec 2021 13:00:27 +0100
Message-Id: <7cf5335cc07ca9b6f8cdaa20ca9887fce4df3bea.1638446239.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <3ff9823c0a812a8a145d979a9600a6d4591b80ee.1638446239.git.christophe.leroy@csgroup.eu>
References: <3ff9823c0a812a8a145d979a9600a6d4591b80ee.1638446239.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1638446425; l=11271; s=20211009;
 h=from:subject:message-id; bh=eu/UtozL+LWI/F74I45fXXFSZD9lrFw/4yGMAolwIg8=;
 b=cMdwc1hcB5y/l893DJAdvXEDP13cSut0Mtia553m7kg4EvZAEPE4P7Wb7W/6oDr9hQdUYbtncuPb
 0kjkOW/kDayMwJnDxVFFWxyqNpBprOOep6PrKTfiycw6lDMFdJDM
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

The purpose of selftests is to check that instructions are
properly formed. Not to check that they properly run.

For that test it uses normal memory, not special test
memory.

In preparation of a future patch enforcing patch_instruction()
to be used only on valid text areas, implement a ppc_inst_write()
instruction which is the complement of ppc_inst_read(). This
new function writes the formated instruction in valid kernel
memory and doesn't bother about icache.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/inst.h       |  8 +++
 arch/powerpc/lib/test-code-patching.c | 85 ++++++++++++++-------------
 2 files changed, 53 insertions(+), 40 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 631436f3f5c3..21fe8594e078 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -131,6 +131,14 @@ static inline unsigned long ppc_inst_as_ulong(ppc_inst_t x)
 		return (u64)ppc_inst_val(x) << 32 | ppc_inst_suffix(x);
 }
 
+static inline void ppc_inst_write(u32 *ptr, ppc_inst_t x)
+{
+	if (!ppc_inst_prefixed(x))
+		*ptr = ppc_inst_val(x);
+	else
+		*(u64 *)ptr = ppc_inst_as_ulong(x);
+}
+
 #define PPC_INST_STR_LEN sizeof("00000000 00000000")
 
 static inline char *__ppc_inst_as_str(char str[PPC_INST_STR_LEN], ppc_inst_t x)
diff --git a/arch/powerpc/lib/test-code-patching.c b/arch/powerpc/lib/test-code-patching.c
index e358c9d8a03e..c44823292f73 100644
--- a/arch/powerpc/lib/test-code-patching.c
+++ b/arch/powerpc/lib/test-code-patching.c
@@ -54,39 +54,39 @@ static void __init test_branch_iform(void)
 	check(!instr_is_branch_iform(ppc_inst(0x7bfffffd)));
 
 	/* Absolute branch to 0x100 */
-	patch_instruction(iptr, ppc_inst(0x48000103));
+	ppc_inst_write(iptr, ppc_inst(0x48000103));
 	check(instr_is_branch_to_addr(iptr, 0x100));
 	/* Absolute branch to 0x420fc */
-	patch_instruction(iptr, ppc_inst(0x480420ff));
+	ppc_inst_write(iptr, ppc_inst(0x480420ff));
 	check(instr_is_branch_to_addr(iptr, 0x420fc));
 	/* Maximum positive relative branch, + 20MB - 4B */
-	patch_instruction(iptr, ppc_inst(0x49fffffc));
+	ppc_inst_write(iptr, ppc_inst(0x49fffffc));
 	check(instr_is_branch_to_addr(iptr, addr + 0x1FFFFFC));
 	/* Smallest negative relative branch, - 4B */
-	patch_instruction(iptr, ppc_inst(0x4bfffffc));
+	ppc_inst_write(iptr, ppc_inst(0x4bfffffc));
 	check(instr_is_branch_to_addr(iptr, addr - 4));
 	/* Largest negative relative branch, - 32 MB */
-	patch_instruction(iptr, ppc_inst(0x4a000000));
+	ppc_inst_write(iptr, ppc_inst(0x4a000000));
 	check(instr_is_branch_to_addr(iptr, addr - 0x2000000));
 
 	/* Branch to self, with link */
 	err = create_branch(&instr, iptr, addr, BRANCH_SET_LINK);
-	patch_instruction(iptr, instr);
+	ppc_inst_write(iptr, instr);
 	check(instr_is_branch_to_addr(iptr, addr));
 
 	/* Branch to self - 0x100, with link */
 	err = create_branch(&instr, iptr, addr - 0x100, BRANCH_SET_LINK);
-	patch_instruction(iptr, instr);
+	ppc_inst_write(iptr, instr);
 	check(instr_is_branch_to_addr(iptr, addr - 0x100));
 
 	/* Branch to self + 0x100, no link */
 	err = create_branch(&instr, iptr, addr + 0x100, 0);
-	patch_instruction(iptr, instr);
+	ppc_inst_write(iptr, instr);
 	check(instr_is_branch_to_addr(iptr, addr + 0x100));
 
 	/* Maximum relative negative offset, - 32 MB */
 	err = create_branch(&instr, iptr, addr - 0x2000000, BRANCH_SET_LINK);
-	patch_instruction(iptr, instr);
+	ppc_inst_write(iptr, instr);
 	check(instr_is_branch_to_addr(iptr, addr - 0x2000000));
 
 	/* Out of range relative negative offset, - 32 MB + 4*/
@@ -103,7 +103,7 @@ static void __init test_branch_iform(void)
 
 	/* Check flags are masked correctly */
 	err = create_branch(&instr, iptr, addr, 0xFFFFFFFC);
-	patch_instruction(iptr, instr);
+	ppc_inst_write(iptr, instr);
 	check(instr_is_branch_to_addr(iptr, addr));
 	check(ppc_inst_equal(instr, ppc_inst(0x48000000)));
 }
@@ -143,19 +143,19 @@ static void __init test_branch_bform(void)
 	check(!instr_is_branch_bform(ppc_inst(0x7bffffff)));
 
 	/* Absolute conditional branch to 0x100 */
-	patch_instruction(iptr, ppc_inst(0x43ff0103));
+	ppc_inst_write(iptr, ppc_inst(0x43ff0103));
 	check(instr_is_branch_to_addr(iptr, 0x100));
 	/* Absolute conditional branch to 0x20fc */
-	patch_instruction(iptr, ppc_inst(0x43ff20ff));
+	ppc_inst_write(iptr, ppc_inst(0x43ff20ff));
 	check(instr_is_branch_to_addr(iptr, 0x20fc));
 	/* Maximum positive relative conditional branch, + 32 KB - 4B */
-	patch_instruction(iptr, ppc_inst(0x43ff7ffc));
+	ppc_inst_write(iptr, ppc_inst(0x43ff7ffc));
 	check(instr_is_branch_to_addr(iptr, addr + 0x7FFC));
 	/* Smallest negative relative conditional branch, - 4B */
-	patch_instruction(iptr, ppc_inst(0x43fffffc));
+	ppc_inst_write(iptr, ppc_inst(0x43fffffc));
 	check(instr_is_branch_to_addr(iptr, addr - 4));
 	/* Largest negative relative conditional branch, - 32 KB */
-	patch_instruction(iptr, ppc_inst(0x43ff8000));
+	ppc_inst_write(iptr, ppc_inst(0x43ff8000));
 	check(instr_is_branch_to_addr(iptr, addr - 0x8000));
 
 	/* All condition code bits set & link */
@@ -163,22 +163,22 @@ static void __init test_branch_bform(void)
 
 	/* Branch to self */
 	err = create_cond_branch(&instr, iptr, addr, flags);
-	patch_instruction(iptr, instr);
+	ppc_inst_write(iptr, instr);
 	check(instr_is_branch_to_addr(iptr, addr));
 
 	/* Branch to self - 0x100 */
 	err = create_cond_branch(&instr, iptr, addr - 0x100, flags);
-	patch_instruction(iptr, instr);
+	ppc_inst_write(iptr, instr);
 	check(instr_is_branch_to_addr(iptr, addr - 0x100));
 
 	/* Branch to self + 0x100 */
 	err = create_cond_branch(&instr, iptr, addr + 0x100, flags);
-	patch_instruction(iptr, instr);
+	ppc_inst_write(iptr, instr);
 	check(instr_is_branch_to_addr(iptr, addr + 0x100));
 
 	/* Maximum relative negative offset, - 32 KB */
 	err = create_cond_branch(&instr, iptr, addr - 0x8000, flags);
-	patch_instruction(iptr, instr);
+	ppc_inst_write(iptr, instr);
 	check(instr_is_branch_to_addr(iptr, addr - 0x8000));
 
 	/* Out of range relative negative offset, - 32 KB + 4*/
@@ -195,7 +195,7 @@ static void __init test_branch_bform(void)
 
 	/* Check flags are masked correctly */
 	err = create_cond_branch(&instr, iptr, addr, 0xFFFFFFFC);
-	patch_instruction(iptr, instr);
+	ppc_inst_write(iptr, instr);
 	check(instr_is_branch_to_addr(iptr, addr));
 	check(ppc_inst_equal(instr, ppc_inst(0x43FF0000)));
 }
@@ -215,20 +215,22 @@ static void __init test_translate_branch(void)
 	/* Simple case, branch to self moved a little */
 	p = buf;
 	addr = (unsigned long)p;
-	patch_branch(p, addr, 0);
+	create_branch(&instr, p, addr, 0);
+	ppc_inst_write(p, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	q = p + 4;
 	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
+	ppc_inst_write(q, instr);
 	check(instr_is_branch_to_addr(q, addr));
 
 	/* Maximum negative case, move b . to addr + 32 MB */
 	p = buf;
 	addr = (unsigned long)p;
-	patch_branch(p, addr, 0);
+	create_branch(&instr, p, addr, 0);
+	ppc_inst_write(p, instr);
 	q = buf + 0x2000000;
 	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
+	ppc_inst_write(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
 	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x4a000000)));
@@ -236,10 +238,11 @@ static void __init test_translate_branch(void)
 	/* Maximum positive case, move x to x - 32 MB + 4 */
 	p = buf + 0x2000000;
 	addr = (unsigned long)p;
-	patch_branch(p, addr, 0);
+	create_branch(&instr, p, addr, 0);
+	ppc_inst_write(p, instr);
 	q = buf + 4;
 	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
+	ppc_inst_write(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
 	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x49fffffc)));
@@ -247,20 +250,22 @@ static void __init test_translate_branch(void)
 	/* Jump to x + 16 MB moved to x + 20 MB */
 	p = buf;
 	addr = 0x1000000 + (unsigned long)buf;
-	patch_branch(p, addr, BRANCH_SET_LINK);
+	create_branch(&instr, p, addr, BRANCH_SET_LINK);
+	ppc_inst_write(p, instr);
 	q = buf + 0x1400000;
 	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
+	ppc_inst_write(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
 
 	/* Jump to x + 16 MB moved to x - 16 MB + 4 */
 	p = buf + 0x1000000;
 	addr = 0x2000000 + (unsigned long)buf;
-	patch_branch(p, addr, 0);
+	create_branch(&instr, p, addr, 0);
+	ppc_inst_write(p, instr);
 	q = buf + 4;
 	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
+	ppc_inst_write(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
 
@@ -271,21 +276,21 @@ static void __init test_translate_branch(void)
 	p = buf;
 	addr = (unsigned long)p;
 	create_cond_branch(&instr, p, addr, 0);
-	patch_instruction(p, instr);
+	ppc_inst_write(p, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	q = buf + 4;
 	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
+	ppc_inst_write(q, instr);
 	check(instr_is_branch_to_addr(q, addr));
 
 	/* Maximum negative case, move b . to addr + 32 KB */
 	p = buf;
 	addr = (unsigned long)p;
 	create_cond_branch(&instr, p, addr, 0xFFFFFFFC);
-	patch_instruction(p, instr);
+	ppc_inst_write(p, instr);
 	q = buf + 0x8000;
 	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
+	ppc_inst_write(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
 	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x43ff8000)));
@@ -294,10 +299,10 @@ static void __init test_translate_branch(void)
 	p = buf + 0x8000;
 	addr = (unsigned long)p;
 	create_cond_branch(&instr, p, addr, 0xFFFFFFFC);
-	patch_instruction(p, instr);
+	ppc_inst_write(p, instr);
 	q = buf + 4;
 	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
+	ppc_inst_write(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
 	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x43ff7ffc)));
@@ -306,10 +311,10 @@ static void __init test_translate_branch(void)
 	p = buf;
 	addr = 0x3000 + (unsigned long)buf;
 	create_cond_branch(&instr, p, addr, BRANCH_SET_LINK);
-	patch_instruction(p, instr);
+	ppc_inst_write(p, instr);
 	q = buf + 0x5000;
 	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
+	ppc_inst_write(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
 
@@ -317,10 +322,10 @@ static void __init test_translate_branch(void)
 	p = buf + 0x2000;
 	addr = 0x4000 + (unsigned long)buf;
 	create_cond_branch(&instr, p, addr, 0);
-	patch_instruction(p, instr);
+	ppc_inst_write(p, instr);
 	q = buf + 4;
 	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
+	ppc_inst_write(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
 
-- 
2.33.1

