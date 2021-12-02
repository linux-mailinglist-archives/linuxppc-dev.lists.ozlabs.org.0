Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E79E466310
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 13:05:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4ZQN1brPz3f9V
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 23:05:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4ZLC24Gfz3cPj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 23:01:22 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J4ZKW28J7z9sSX;
 Thu,  2 Dec 2021 13:00:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oyz4Bcd30JjJ; Thu,  2 Dec 2021 13:00:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J4ZKM1DNsz9sSy;
 Thu,  2 Dec 2021 13:00:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 10F478B7C6;
 Thu,  2 Dec 2021 13:00:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WRNqzq7jb3q3; Thu,  2 Dec 2021 13:00:38 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.163])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A5428B7C7;
 Thu,  2 Dec 2021 13:00:38 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1B2C0WQH177277
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 2 Dec 2021 13:00:32 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1B2C0W5E177276;
 Thu, 2 Dec 2021 13:00:32 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 10/11] powerpc/code-patching: Move code patching selftests
 in its own file
Date: Thu,  2 Dec 2021 13:00:26 +0100
Message-Id: <c0c30504f04eb546a48ff77127a8bccd12a3d809.1638446239.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <3ff9823c0a812a8a145d979a9600a6d4591b80ee.1638446239.git.christophe.leroy@csgroup.eu>
References: <3ff9823c0a812a8a145d979a9600a6d4591b80ee.1638446239.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1638446425; l=23253; s=20211009;
 h=from:subject:message-id; bh=jiDsQyUYV+FTpNQpg1z0yXfQUVTyCj8qpz9LeMgy/VA=;
 b=vqId3rN+yfT5mdAh+Y9k+XbV8mXXPoiO+2lZYJGO7SEVQ5P5ZHdLSpbJwj2QFvf1yVgesxi8vQsv
 RCf9V6YVATs1Ybqi7IkZWoI7bMSkybzY64X/AhpmRM5vNr7MLSz6
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

Code patching selftests are half of code-patching.c.
As they are guarded by CONFIG_CODE_PATCHING_SELFTESTS,
they'd be better in their own file.

Also add a missing __init for instr_is_branch_to_addr()

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/Makefile                     |   2 +
 arch/powerpc/lib/code-patching.c              | 355 ------------------
 .../{code-patching.c => test-code-patching.c} | 353 +----------------
 3 files changed, 3 insertions(+), 707 deletions(-)
 copy arch/powerpc/lib/{code-patching.c => test-code-patching.c} (56%)

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index c2654894b468..3e183f4b4bda 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -21,6 +21,8 @@ endif
 
 obj-y += alloc.o code-patching.o feature-fixups.o pmem.o
 
+obj-$(CONFIG_CODE_PATCHING_SELFTEST) += test-code-patching.o
+
 ifndef CONFIG_KASAN
 obj-y	+=	string.o memcmp_$(BITS).o
 obj-$(CONFIG_PPC32)	+= strlen_32.o
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index e07de5db06c0..906d43463366 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -3,13 +3,10 @@
  *  Copyright 2008 Michael Ellerman, IBM Corporation.
  */
 
-#include <linux/kernel.h>
 #include <linux/kprobes.h>
 #include <linux/vmalloc.h>
 #include <linux/init.h>
-#include <linux/mm.h>
 #include <linux/cpuhotplug.h>
-#include <linux/slab.h>
 #include <linux/uaccess.h>
 
 #include <asm/tlbflush.h>
@@ -354,355 +351,3 @@ int translate_branch(ppc_inst_t *instr, const u32 *dest, const u32 *src)
 
 	return 1;
 }
-
-#ifdef CONFIG_CODE_PATCHING_SELFTEST
-
-static int instr_is_branch_to_addr(const u32 *instr, unsigned long addr)
-{
-	if (instr_is_branch_iform(ppc_inst_read(instr)) ||
-	    instr_is_branch_bform(ppc_inst_read(instr)))
-		return branch_target(instr) == addr;
-
-	return 0;
-}
-
-static void __init test_trampoline(void)
-{
-	asm ("nop;nop;\n");
-}
-
-#define check(x)	do {	\
-	if (!(x))		\
-		pr_err("code-patching: test failed at line %d\n", __LINE__); \
-} while (0)
-
-static void __init test_branch_iform(void)
-{
-	int err;
-	ppc_inst_t instr;
-	u32 tmp[2];
-	u32 *iptr = tmp;
-	unsigned long addr = (unsigned long)tmp;
-
-	/* The simplest case, branch to self, no flags */
-	check(instr_is_branch_iform(ppc_inst(0x48000000)));
-	/* All bits of target set, and flags */
-	check(instr_is_branch_iform(ppc_inst(0x4bffffff)));
-	/* High bit of opcode set, which is wrong */
-	check(!instr_is_branch_iform(ppc_inst(0xcbffffff)));
-	/* Middle bits of opcode set, which is wrong */
-	check(!instr_is_branch_iform(ppc_inst(0x7bffffff)));
-
-	/* Simplest case, branch to self with link */
-	check(instr_is_branch_iform(ppc_inst(0x48000001)));
-	/* All bits of targets set */
-	check(instr_is_branch_iform(ppc_inst(0x4bfffffd)));
-	/* Some bits of targets set */
-	check(instr_is_branch_iform(ppc_inst(0x4bff00fd)));
-	/* Must be a valid branch to start with */
-	check(!instr_is_branch_iform(ppc_inst(0x7bfffffd)));
-
-	/* Absolute branch to 0x100 */
-	patch_instruction(iptr, ppc_inst(0x48000103));
-	check(instr_is_branch_to_addr(iptr, 0x100));
-	/* Absolute branch to 0x420fc */
-	patch_instruction(iptr, ppc_inst(0x480420ff));
-	check(instr_is_branch_to_addr(iptr, 0x420fc));
-	/* Maximum positive relative branch, + 20MB - 4B */
-	patch_instruction(iptr, ppc_inst(0x49fffffc));
-	check(instr_is_branch_to_addr(iptr, addr + 0x1FFFFFC));
-	/* Smallest negative relative branch, - 4B */
-	patch_instruction(iptr, ppc_inst(0x4bfffffc));
-	check(instr_is_branch_to_addr(iptr, addr - 4));
-	/* Largest negative relative branch, - 32 MB */
-	patch_instruction(iptr, ppc_inst(0x4a000000));
-	check(instr_is_branch_to_addr(iptr, addr - 0x2000000));
-
-	/* Branch to self, with link */
-	err = create_branch(&instr, iptr, addr, BRANCH_SET_LINK);
-	patch_instruction(iptr, instr);
-	check(instr_is_branch_to_addr(iptr, addr));
-
-	/* Branch to self - 0x100, with link */
-	err = create_branch(&instr, iptr, addr - 0x100, BRANCH_SET_LINK);
-	patch_instruction(iptr, instr);
-	check(instr_is_branch_to_addr(iptr, addr - 0x100));
-
-	/* Branch to self + 0x100, no link */
-	err = create_branch(&instr, iptr, addr + 0x100, 0);
-	patch_instruction(iptr, instr);
-	check(instr_is_branch_to_addr(iptr, addr + 0x100));
-
-	/* Maximum relative negative offset, - 32 MB */
-	err = create_branch(&instr, iptr, addr - 0x2000000, BRANCH_SET_LINK);
-	patch_instruction(iptr, instr);
-	check(instr_is_branch_to_addr(iptr, addr - 0x2000000));
-
-	/* Out of range relative negative offset, - 32 MB + 4*/
-	err = create_branch(&instr, iptr, addr - 0x2000004, BRANCH_SET_LINK);
-	check(err);
-
-	/* Out of range relative positive offset, + 32 MB */
-	err = create_branch(&instr, iptr, addr + 0x2000000, BRANCH_SET_LINK);
-	check(err);
-
-	/* Unaligned target */
-	err = create_branch(&instr, iptr, addr + 3, BRANCH_SET_LINK);
-	check(err);
-
-	/* Check flags are masked correctly */
-	err = create_branch(&instr, iptr, addr, 0xFFFFFFFC);
-	patch_instruction(iptr, instr);
-	check(instr_is_branch_to_addr(iptr, addr));
-	check(ppc_inst_equal(instr, ppc_inst(0x48000000)));
-}
-
-static void __init test_create_function_call(void)
-{
-	u32 *iptr;
-	unsigned long dest;
-	ppc_inst_t instr;
-
-	/* Check we can create a function call */
-	iptr = (u32 *)ppc_function_entry(test_trampoline);
-	dest = ppc_function_entry(test_create_function_call);
-	create_branch(&instr, iptr, dest, BRANCH_SET_LINK);
-	patch_instruction(iptr, instr);
-	check(instr_is_branch_to_addr(iptr, dest));
-}
-
-static void __init test_branch_bform(void)
-{
-	int err;
-	unsigned long addr;
-	ppc_inst_t instr;
-	u32 tmp[2];
-	u32 *iptr = tmp;
-	unsigned int flags;
-
-	addr = (unsigned long)iptr;
-
-	/* The simplest case, branch to self, no flags */
-	check(instr_is_branch_bform(ppc_inst(0x40000000)));
-	/* All bits of target set, and flags */
-	check(instr_is_branch_bform(ppc_inst(0x43ffffff)));
-	/* High bit of opcode set, which is wrong */
-	check(!instr_is_branch_bform(ppc_inst(0xc3ffffff)));
-	/* Middle bits of opcode set, which is wrong */
-	check(!instr_is_branch_bform(ppc_inst(0x7bffffff)));
-
-	/* Absolute conditional branch to 0x100 */
-	patch_instruction(iptr, ppc_inst(0x43ff0103));
-	check(instr_is_branch_to_addr(iptr, 0x100));
-	/* Absolute conditional branch to 0x20fc */
-	patch_instruction(iptr, ppc_inst(0x43ff20ff));
-	check(instr_is_branch_to_addr(iptr, 0x20fc));
-	/* Maximum positive relative conditional branch, + 32 KB - 4B */
-	patch_instruction(iptr, ppc_inst(0x43ff7ffc));
-	check(instr_is_branch_to_addr(iptr, addr + 0x7FFC));
-	/* Smallest negative relative conditional branch, - 4B */
-	patch_instruction(iptr, ppc_inst(0x43fffffc));
-	check(instr_is_branch_to_addr(iptr, addr - 4));
-	/* Largest negative relative conditional branch, - 32 KB */
-	patch_instruction(iptr, ppc_inst(0x43ff8000));
-	check(instr_is_branch_to_addr(iptr, addr - 0x8000));
-
-	/* All condition code bits set & link */
-	flags = 0x3ff000 | BRANCH_SET_LINK;
-
-	/* Branch to self */
-	err = create_cond_branch(&instr, iptr, addr, flags);
-	patch_instruction(iptr, instr);
-	check(instr_is_branch_to_addr(iptr, addr));
-
-	/* Branch to self - 0x100 */
-	err = create_cond_branch(&instr, iptr, addr - 0x100, flags);
-	patch_instruction(iptr, instr);
-	check(instr_is_branch_to_addr(iptr, addr - 0x100));
-
-	/* Branch to self + 0x100 */
-	err = create_cond_branch(&instr, iptr, addr + 0x100, flags);
-	patch_instruction(iptr, instr);
-	check(instr_is_branch_to_addr(iptr, addr + 0x100));
-
-	/* Maximum relative negative offset, - 32 KB */
-	err = create_cond_branch(&instr, iptr, addr - 0x8000, flags);
-	patch_instruction(iptr, instr);
-	check(instr_is_branch_to_addr(iptr, addr - 0x8000));
-
-	/* Out of range relative negative offset, - 32 KB + 4*/
-	err = create_cond_branch(&instr, iptr, addr - 0x8004, flags);
-	check(err);
-
-	/* Out of range relative positive offset, + 32 KB */
-	err = create_cond_branch(&instr, iptr, addr + 0x8000, flags);
-	check(err);
-
-	/* Unaligned target */
-	err = create_cond_branch(&instr, iptr, addr + 3, flags);
-	check(err);
-
-	/* Check flags are masked correctly */
-	err = create_cond_branch(&instr, iptr, addr, 0xFFFFFFFC);
-	patch_instruction(iptr, instr);
-	check(instr_is_branch_to_addr(iptr, addr));
-	check(ppc_inst_equal(instr, ppc_inst(0x43FF0000)));
-}
-
-static void __init test_translate_branch(void)
-{
-	unsigned long addr;
-	void *p, *q;
-	ppc_inst_t instr;
-	void *buf;
-
-	buf = vmalloc(PAGE_ALIGN(0x2000000 + 1));
-	check(buf);
-	if (!buf)
-		return;
-
-	/* Simple case, branch to self moved a little */
-	p = buf;
-	addr = (unsigned long)p;
-	patch_branch(p, addr, 0);
-	check(instr_is_branch_to_addr(p, addr));
-	q = p + 4;
-	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
-	check(instr_is_branch_to_addr(q, addr));
-
-	/* Maximum negative case, move b . to addr + 32 MB */
-	p = buf;
-	addr = (unsigned long)p;
-	patch_branch(p, addr, 0);
-	q = buf + 0x2000000;
-	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
-	check(instr_is_branch_to_addr(p, addr));
-	check(instr_is_branch_to_addr(q, addr));
-	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x4a000000)));
-
-	/* Maximum positive case, move x to x - 32 MB + 4 */
-	p = buf + 0x2000000;
-	addr = (unsigned long)p;
-	patch_branch(p, addr, 0);
-	q = buf + 4;
-	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
-	check(instr_is_branch_to_addr(p, addr));
-	check(instr_is_branch_to_addr(q, addr));
-	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x49fffffc)));
-
-	/* Jump to x + 16 MB moved to x + 20 MB */
-	p = buf;
-	addr = 0x1000000 + (unsigned long)buf;
-	patch_branch(p, addr, BRANCH_SET_LINK);
-	q = buf + 0x1400000;
-	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
-	check(instr_is_branch_to_addr(p, addr));
-	check(instr_is_branch_to_addr(q, addr));
-
-	/* Jump to x + 16 MB moved to x - 16 MB + 4 */
-	p = buf + 0x1000000;
-	addr = 0x2000000 + (unsigned long)buf;
-	patch_branch(p, addr, 0);
-	q = buf + 4;
-	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
-	check(instr_is_branch_to_addr(p, addr));
-	check(instr_is_branch_to_addr(q, addr));
-
-
-	/* Conditional branch tests */
-
-	/* Simple case, branch to self moved a little */
-	p = buf;
-	addr = (unsigned long)p;
-	create_cond_branch(&instr, p, addr, 0);
-	patch_instruction(p, instr);
-	check(instr_is_branch_to_addr(p, addr));
-	q = buf + 4;
-	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
-	check(instr_is_branch_to_addr(q, addr));
-
-	/* Maximum negative case, move b . to addr + 32 KB */
-	p = buf;
-	addr = (unsigned long)p;
-	create_cond_branch(&instr, p, addr, 0xFFFFFFFC);
-	patch_instruction(p, instr);
-	q = buf + 0x8000;
-	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
-	check(instr_is_branch_to_addr(p, addr));
-	check(instr_is_branch_to_addr(q, addr));
-	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x43ff8000)));
-
-	/* Maximum positive case, move x to x - 32 KB + 4 */
-	p = buf + 0x8000;
-	addr = (unsigned long)p;
-	create_cond_branch(&instr, p, addr, 0xFFFFFFFC);
-	patch_instruction(p, instr);
-	q = buf + 4;
-	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
-	check(instr_is_branch_to_addr(p, addr));
-	check(instr_is_branch_to_addr(q, addr));
-	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x43ff7ffc)));
-
-	/* Jump to x + 12 KB moved to x + 20 KB */
-	p = buf;
-	addr = 0x3000 + (unsigned long)buf;
-	create_cond_branch(&instr, p, addr, BRANCH_SET_LINK);
-	patch_instruction(p, instr);
-	q = buf + 0x5000;
-	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
-	check(instr_is_branch_to_addr(p, addr));
-	check(instr_is_branch_to_addr(q, addr));
-
-	/* Jump to x + 8 KB moved to x - 8 KB + 4 */
-	p = buf + 0x2000;
-	addr = 0x4000 + (unsigned long)buf;
-	create_cond_branch(&instr, p, addr, 0);
-	patch_instruction(p, instr);
-	q = buf + 4;
-	translate_branch(&instr, q, p);
-	patch_instruction(q, instr);
-	check(instr_is_branch_to_addr(p, addr));
-	check(instr_is_branch_to_addr(q, addr));
-
-	/* Free the buffer we were using */
-	vfree(buf);
-}
-
-static void __init test_prefixed_patching(void)
-{
-	u32 *iptr = (u32 *)ppc_function_entry(test_trampoline);
-	u32 expected[2] = {OP_PREFIX << 26, 0};
-	ppc_inst_t inst = ppc_inst_prefix(OP_PREFIX << 26, 0);
-
-	if (!IS_ENABLED(CONFIG_PPC64))
-		return;
-
-	patch_instruction(iptr, inst);
-
-	check(!memcmp(iptr, expected, sizeof(expected)));
-}
-
-static int __init test_code_patching(void)
-{
-	pr_info("Running code patching self-tests ...\n");
-
-	test_branch_iform();
-	test_branch_bform();
-	test_create_function_call();
-	test_translate_branch();
-	test_prefixed_patching();
-
-	return 0;
-}
-late_initcall(test_code_patching);
-
-#endif /* CONFIG_CODE_PATCHING_SELFTEST */
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/test-code-patching.c
similarity index 56%
copy from arch/powerpc/lib/code-patching.c
copy to arch/powerpc/lib/test-code-patching.c
index e07de5db06c0..e358c9d8a03e 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/test-code-patching.c
@@ -3,361 +3,12 @@
  *  Copyright 2008 Michael Ellerman, IBM Corporation.
  */
 
-#include <linux/kernel.h>
-#include <linux/kprobes.h>
 #include <linux/vmalloc.h>
 #include <linux/init.h>
-#include <linux/mm.h>
-#include <linux/cpuhotplug.h>
-#include <linux/slab.h>
-#include <linux/uaccess.h>
 
-#include <asm/tlbflush.h>
-#include <asm/page.h>
 #include <asm/code-patching.h>
-#include <asm/inst.h>
 
-static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 *patch_addr)
-{
-	if (!ppc_inst_prefixed(instr)) {
-		u32 val = ppc_inst_val(instr);
-
-		__put_kernel_nofault(patch_addr, &val, u32, failed);
-	} else {
-		u64 val = ppc_inst_as_ulong(instr);
-
-		__put_kernel_nofault(patch_addr, &val, u64, failed);
-	}
-
-	asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr),
-							    "r" (exec_addr));
-
-	return 0;
-
-failed:
-	return -EFAULT;
-}
-
-int raw_patch_instruction(u32 *addr, ppc_inst_t instr)
-{
-	return __patch_instruction(addr, instr, addr);
-}
-
-#ifdef CONFIG_STRICT_KERNEL_RWX
-static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
-
-static int text_area_cpu_up(unsigned int cpu)
-{
-	struct vm_struct *area;
-
-	area = get_vm_area(PAGE_SIZE, VM_ALLOC);
-	if (!area) {
-		WARN_ONCE(1, "Failed to create text area for cpu %d\n",
-			cpu);
-		return -1;
-	}
-	this_cpu_write(text_poke_area, area);
-
-	return 0;
-}
-
-static int text_area_cpu_down(unsigned int cpu)
-{
-	free_vm_area(this_cpu_read(text_poke_area));
-	return 0;
-}
-
-/*
- * Although BUG_ON() is rude, in this case it should only happen if ENOMEM, and
- * we judge it as being preferable to a kernel that will crash later when
- * someone tries to use patch_instruction().
- */
-void __init poking_init(void)
-{
-	BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
-		"powerpc/text_poke:online", text_area_cpu_up,
-		text_area_cpu_down));
-}
-
-/*
- * This can be called for kernel text or a module.
- */
-static int map_patch_area(void *addr, unsigned long text_poke_addr)
-{
-	unsigned long pfn;
-
-	if (is_vmalloc_or_module_addr(addr))
-		pfn = vmalloc_to_pfn(addr);
-	else
-		pfn = __pa_symbol(addr) >> PAGE_SHIFT;
-
-	return map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE_KERNEL);
-}
-
-static void unmap_patch_area(unsigned long addr)
-{
-	pte_t *ptep;
-	pmd_t *pmdp;
-	pud_t *pudp;
-	p4d_t *p4dp;
-	pgd_t *pgdp;
-
-	pgdp = pgd_offset_k(addr);
-	if (WARN_ON(pgd_none(*pgdp)))
-		return;
-
-	p4dp = p4d_offset(pgdp, addr);
-	if (WARN_ON(p4d_none(*p4dp)))
-		return;
-
-	pudp = pud_offset(p4dp, addr);
-	if (WARN_ON(pud_none(*pudp)))
-		return;
-
-	pmdp = pmd_offset(pudp, addr);
-	if (WARN_ON(pmd_none(*pmdp)))
-		return;
-
-	ptep = pte_offset_kernel(pmdp, addr);
-	if (WARN_ON(pte_none(*ptep)))
-		return;
-
-	/*
-	 * In hash, pte_clear flushes the tlb, in radix, we have to
-	 */
-	pte_clear(&init_mm, addr, ptep);
-	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
-}
-
-static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
-{
-	int err;
-	u32 *patch_addr;
-	unsigned long text_poke_addr;
-
-	text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr;
-	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
-
-	err = map_patch_area(addr, text_poke_addr);
-	if (err)
-		return err;
-
-	err = __patch_instruction(addr, instr, patch_addr);
-
-	unmap_patch_area(text_poke_addr);
-
-	return err;
-}
-
-static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
-{
-	int err;
-	unsigned long flags;
-
-	/*
-	 * During early early boot patch_instruction is called
-	 * when text_poke_area is not ready, but we still need
-	 * to allow patching. We just do the plain old patching
-	 */
-	if (!this_cpu_read(text_poke_area))
-		return raw_patch_instruction(addr, instr);
-
-	local_irq_save(flags);
-	err = __do_patch_instruction(addr, instr);
-	local_irq_restore(flags);
-
-	return err;
-}
-#else /* !CONFIG_STRICT_KERNEL_RWX */
-
-static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
-{
-	return raw_patch_instruction(addr, instr);
-}
-
-#endif /* CONFIG_STRICT_KERNEL_RWX */
-
-int patch_instruction(u32 *addr, ppc_inst_t instr)
-{
-	/* Make sure we aren't patching a freed init section */
-	if (system_state >= SYSTEM_FREEING_INITMEM && init_section_contains(addr, 4))
-		return 0;
-
-	return do_patch_instruction(addr, instr);
-}
-NOKPROBE_SYMBOL(patch_instruction);
-
-int patch_branch(u32 *addr, unsigned long target, int flags)
-{
-	ppc_inst_t instr;
-
-	if (create_branch(&instr, addr, target, flags))
-		return -ERANGE;
-
-	return patch_instruction(addr, instr);
-}
-
-bool is_offset_in_branch_range(long offset)
-{
-	/*
-	 * Powerpc branch instruction is :
-	 *
-	 *  0         6                 30   31
-	 *  +---------+----------------+---+---+
-	 *  | opcode  |     LI         |AA |LK |
-	 *  +---------+----------------+---+---+
-	 *  Where AA = 0 and LK = 0
-	 *
-	 * LI is a signed 24 bits integer. The real branch offset is computed
-	 * by: imm32 = SignExtend(LI:'0b00', 32);
-	 *
-	 * So the maximum forward branch should be:
-	 *   (0x007fffff << 2) = 0x01fffffc =  0x1fffffc
-	 * The maximum backward branch should be:
-	 *   (0xff800000 << 2) = 0xfe000000 = -0x2000000
-	 */
-	return (offset >= -0x2000000 && offset <= 0x1fffffc && !(offset & 0x3));
-}
-
-bool is_offset_in_cond_branch_range(long offset)
-{
-	return offset >= -0x8000 && offset <= 0x7fff && !(offset & 0x3);
-}
-
-/*
- * Helper to check if a given instruction is a conditional branch
- * Derived from the conditional checks in analyse_instr()
- */
-bool is_conditional_branch(ppc_inst_t instr)
-{
-	unsigned int opcode = ppc_inst_primary_opcode(instr);
-
-	if (opcode == 16)       /* bc, bca, bcl, bcla */
-		return true;
-	if (opcode == 19) {
-		switch ((ppc_inst_val(instr) >> 1) & 0x3ff) {
-		case 16:        /* bclr, bclrl */
-		case 528:       /* bcctr, bcctrl */
-		case 560:       /* bctar, bctarl */
-			return true;
-		}
-	}
-	return false;
-}
-NOKPROBE_SYMBOL(is_conditional_branch);
-
-int create_branch(ppc_inst_t *instr, const u32 *addr,
-		  unsigned long target, int flags)
-{
-	long offset;
-
-	*instr = ppc_inst(0);
-	offset = target;
-	if (! (flags & BRANCH_ABSOLUTE))
-		offset = offset - (unsigned long)addr;
-
-	/* Check we can represent the target in the instruction format */
-	if (!is_offset_in_branch_range(offset))
-		return 1;
-
-	/* Mask out the flags and target, so they don't step on each other. */
-	*instr = ppc_inst(0x48000000 | (flags & 0x3) | (offset & 0x03FFFFFC));
-
-	return 0;
-}
-
-int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
-		       unsigned long target, int flags)
-{
-	long offset;
-
-	offset = target;
-	if (! (flags & BRANCH_ABSOLUTE))
-		offset = offset - (unsigned long)addr;
-
-	/* Check we can represent the target in the instruction format */
-	if (!is_offset_in_cond_branch_range(offset))
-		return 1;
-
-	/* Mask out the flags and target, so they don't step on each other. */
-	*instr = ppc_inst(0x40000000 | (flags & 0x3FF0003) | (offset & 0xFFFC));
-
-	return 0;
-}
-
-int instr_is_relative_branch(ppc_inst_t instr)
-{
-	if (ppc_inst_val(instr) & BRANCH_ABSOLUTE)
-		return 0;
-
-	return instr_is_branch_iform(instr) || instr_is_branch_bform(instr);
-}
-
-int instr_is_relative_link_branch(ppc_inst_t instr)
-{
-	return instr_is_relative_branch(instr) && (ppc_inst_val(instr) & BRANCH_SET_LINK);
-}
-
-static unsigned long branch_iform_target(const u32 *instr)
-{
-	signed long imm;
-
-	imm = ppc_inst_val(ppc_inst_read(instr)) & 0x3FFFFFC;
-
-	/* If the top bit of the immediate value is set this is negative */
-	if (imm & 0x2000000)
-		imm -= 0x4000000;
-
-	if ((ppc_inst_val(ppc_inst_read(instr)) & BRANCH_ABSOLUTE) == 0)
-		imm += (unsigned long)instr;
-
-	return (unsigned long)imm;
-}
-
-static unsigned long branch_bform_target(const u32 *instr)
-{
-	signed long imm;
-
-	imm = ppc_inst_val(ppc_inst_read(instr)) & 0xFFFC;
-
-	/* If the top bit of the immediate value is set this is negative */
-	if (imm & 0x8000)
-		imm -= 0x10000;
-
-	if ((ppc_inst_val(ppc_inst_read(instr)) & BRANCH_ABSOLUTE) == 0)
-		imm += (unsigned long)instr;
-
-	return (unsigned long)imm;
-}
-
-unsigned long branch_target(const u32 *instr)
-{
-	if (instr_is_branch_iform(ppc_inst_read(instr)))
-		return branch_iform_target(instr);
-	else if (instr_is_branch_bform(ppc_inst_read(instr)))
-		return branch_bform_target(instr);
-
-	return 0;
-}
-
-int translate_branch(ppc_inst_t *instr, const u32 *dest, const u32 *src)
-{
-	unsigned long target;
-	target = branch_target(src);
-
-	if (instr_is_branch_iform(ppc_inst_read(src)))
-		return create_branch(instr, dest, target,
-				     ppc_inst_val(ppc_inst_read(src)));
-	else if (instr_is_branch_bform(ppc_inst_read(src)))
-		return create_cond_branch(instr, dest, target,
-					  ppc_inst_val(ppc_inst_read(src)));
-
-	return 1;
-}
-
-#ifdef CONFIG_CODE_PATCHING_SELFTEST
-
-static int instr_is_branch_to_addr(const u32 *instr, unsigned long addr)
+static int __init instr_is_branch_to_addr(const u32 *instr, unsigned long addr)
 {
 	if (instr_is_branch_iform(ppc_inst_read(instr)) ||
 	    instr_is_branch_bform(ppc_inst_read(instr)))
@@ -704,5 +355,3 @@ static int __init test_code_patching(void)
 	return 0;
 }
 late_initcall(test_code_patching);
-
-#endif /* CONFIG_CODE_PATCHING_SELFTEST */
-- 
2.33.1

