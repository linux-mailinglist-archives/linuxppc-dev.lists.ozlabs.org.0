Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E06E93891C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 16:46:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlbKF5tYxz3d8L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 00:46:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlbGv6btDz3bw6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 00:44:07 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FlbGJ1Fntz9sWd;
 Wed, 19 May 2021 16:43:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n3RrMlL0Ju17; Wed, 19 May 2021 16:43:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FlbGH623Lz9sWc;
 Wed, 19 May 2021 16:43:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A56D58B7F5;
 Wed, 19 May 2021 16:43:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rFW_DNv440R9; Wed, 19 May 2021 16:43:35 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 47DD88B7E0;
 Wed, 19 May 2021 16:43:35 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id ADBA564C3A; Wed, 19 May 2021 14:43:34 +0000 (UTC)
Message-Id: <b9696fca8b47e64a44e4a68e3b0e8f789ff390ae.1621435024.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1621435024.git.christophe.leroy@csgroup.eu>
References: <cover.1621435024.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 07/12] powerpc/lib/code-patching: Don't use struct
 'ppc_inst' for runnable code in tests.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Date: Wed, 19 May 2021 14:43:34 +0000 (UTC)
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

'struct ppc_inst' is meant to represent an instruction internally, it
is not meant to dereference code in memory.

For testing code patching, use patch_instruction() to properly
write into memory the code to be tested.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/code-patching.c | 95 ++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 42 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 82f2c1edb498..508e9511ca96 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -422,9 +422,9 @@ static void __init test_branch_iform(void)
 {
 	int err;
 	struct ppc_inst instr;
-	unsigned long addr;
-
-	addr = (unsigned long)&instr;
+	unsigned int tmp[2];
+	struct ppc_inst *iptr = (struct ppc_inst *)tmp;
+	unsigned long addr = (unsigned long)tmp;
 
 	/* The simplest case, branch to self, no flags */
 	check(instr_is_branch_iform(ppc_inst(0x48000000)));
@@ -445,52 +445,57 @@ static void __init test_branch_iform(void)
 	check(!instr_is_branch_iform(ppc_inst(0x7bfffffd)));
 
 	/* Absolute branch to 0x100 */
-	instr = ppc_inst(0x48000103);
-	check(instr_is_branch_to_addr(&instr, 0x100));
+	patch_instruction(iptr, ppc_inst(0x48000103));
+	check(instr_is_branch_to_addr(iptr, 0x100));
 	/* Absolute branch to 0x420fc */
-	instr = ppc_inst(0x480420ff);
-	check(instr_is_branch_to_addr(&instr, 0x420fc));
+	patch_instruction(iptr, ppc_inst(0x480420ff));
+	check(instr_is_branch_to_addr(iptr, 0x420fc));
 	/* Maximum positive relative branch, + 20MB - 4B */
-	instr = ppc_inst(0x49fffffc);
-	check(instr_is_branch_to_addr(&instr, addr + 0x1FFFFFC));
+	patch_instruction(iptr, ppc_inst(0x49fffffc));
+	check(instr_is_branch_to_addr(iptr, addr + 0x1FFFFFC));
 	/* Smallest negative relative branch, - 4B */
-	instr = ppc_inst(0x4bfffffc);
-	check(instr_is_branch_to_addr(&instr, addr - 4));
+	patch_instruction(iptr, ppc_inst(0x4bfffffc));
+	check(instr_is_branch_to_addr(iptr, addr - 4));
 	/* Largest negative relative branch, - 32 MB */
-	instr = ppc_inst(0x4a000000);
-	check(instr_is_branch_to_addr(&instr, addr - 0x2000000));
+	patch_instruction(iptr, ppc_inst(0x4a000000));
+	check(instr_is_branch_to_addr(iptr, addr - 0x2000000));
 
 	/* Branch to self, with link */
-	err = create_branch(&instr, &instr, addr, BRANCH_SET_LINK);
-	check(instr_is_branch_to_addr(&instr, addr));
+	err = create_branch(&instr, iptr, addr, BRANCH_SET_LINK);
+	patch_instruction(iptr, instr);
+	check(instr_is_branch_to_addr(iptr, addr));
 
 	/* Branch to self - 0x100, with link */
-	err = create_branch(&instr, &instr, addr - 0x100, BRANCH_SET_LINK);
-	check(instr_is_branch_to_addr(&instr, addr - 0x100));
+	err = create_branch(&instr, iptr, addr - 0x100, BRANCH_SET_LINK);
+	patch_instruction(iptr, instr);
+	check(instr_is_branch_to_addr(iptr, addr - 0x100));
 
 	/* Branch to self + 0x100, no link */
-	err = create_branch(&instr, &instr, addr + 0x100, 0);
-	check(instr_is_branch_to_addr(&instr, addr + 0x100));
+	err = create_branch(&instr, iptr, addr + 0x100, 0);
+	patch_instruction(iptr, instr);
+	check(instr_is_branch_to_addr(iptr, addr + 0x100));
 
 	/* Maximum relative negative offset, - 32 MB */
-	err = create_branch(&instr, &instr, addr - 0x2000000, BRANCH_SET_LINK);
-	check(instr_is_branch_to_addr(&instr, addr - 0x2000000));
+	err = create_branch(&instr, iptr, addr - 0x2000000, BRANCH_SET_LINK);
+	patch_instruction(iptr, instr);
+	check(instr_is_branch_to_addr(iptr, addr - 0x2000000));
 
 	/* Out of range relative negative offset, - 32 MB + 4*/
-	err = create_branch(&instr, &instr, addr - 0x2000004, BRANCH_SET_LINK);
+	err = create_branch(&instr, iptr, addr - 0x2000004, BRANCH_SET_LINK);
 	check(err);
 
 	/* Out of range relative positive offset, + 32 MB */
-	err = create_branch(&instr, &instr, addr + 0x2000000, BRANCH_SET_LINK);
+	err = create_branch(&instr, iptr, addr + 0x2000000, BRANCH_SET_LINK);
 	check(err);
 
 	/* Unaligned target */
-	err = create_branch(&instr, &instr, addr + 3, BRANCH_SET_LINK);
+	err = create_branch(&instr, iptr, addr + 3, BRANCH_SET_LINK);
 	check(err);
 
 	/* Check flags are masked correctly */
-	err = create_branch(&instr, &instr, addr, 0xFFFFFFFC);
-	check(instr_is_branch_to_addr(&instr, addr));
+	err = create_branch(&instr, iptr, addr, 0xFFFFFFFC);
+	patch_instruction(iptr, instr);
+	check(instr_is_branch_to_addr(iptr, addr));
 	check(ppc_inst_equal(instr, ppc_inst(0x48000000)));
 }
 
@@ -513,9 +518,10 @@ static void __init test_branch_bform(void)
 	int err;
 	unsigned long addr;
 	struct ppc_inst *iptr, instr;
+	unsigned int tmp[2];
 	unsigned int flags;
 
-	iptr = &instr;
+	iptr = (struct ppc_inst *)tmp;
 	addr = (unsigned long)iptr;
 
 	/* The simplest case, branch to self, no flags */
@@ -528,39 +534,43 @@ static void __init test_branch_bform(void)
 	check(!instr_is_branch_bform(ppc_inst(0x7bffffff)));
 
 	/* Absolute conditional branch to 0x100 */
-	instr = ppc_inst(0x43ff0103);
-	check(instr_is_branch_to_addr(&instr, 0x100));
+	patch_instruction(iptr, ppc_inst(0x43ff0103));
+	check(instr_is_branch_to_addr(iptr, 0x100));
 	/* Absolute conditional branch to 0x20fc */
-	instr = ppc_inst(0x43ff20ff);
-	check(instr_is_branch_to_addr(&instr, 0x20fc));
+	patch_instruction(iptr, ppc_inst(0x43ff20ff));
+	check(instr_is_branch_to_addr(iptr, 0x20fc));
 	/* Maximum positive relative conditional branch, + 32 KB - 4B */
-	instr = ppc_inst(0x43ff7ffc);
-	check(instr_is_branch_to_addr(&instr, addr + 0x7FFC));
+	patch_instruction(iptr, ppc_inst(0x43ff7ffc));
+	check(instr_is_branch_to_addr(iptr, addr + 0x7FFC));
 	/* Smallest negative relative conditional branch, - 4B */
-	instr = ppc_inst(0x43fffffc);
-	check(instr_is_branch_to_addr(&instr, addr - 4));
+	patch_instruction(iptr, ppc_inst(0x43fffffc));
+	check(instr_is_branch_to_addr(iptr, addr - 4));
 	/* Largest negative relative conditional branch, - 32 KB */
-	instr = ppc_inst(0x43ff8000);
-	check(instr_is_branch_to_addr(&instr, addr - 0x8000));
+	patch_instruction(iptr, ppc_inst(0x43ff8000));
+	check(instr_is_branch_to_addr(iptr, addr - 0x8000));
 
 	/* All condition code bits set & link */
 	flags = 0x3ff000 | BRANCH_SET_LINK;
 
 	/* Branch to self */
 	err = create_cond_branch(&instr, iptr, addr, flags);
-	check(instr_is_branch_to_addr(&instr, addr));
+	patch_instruction(iptr, instr);
+	check(instr_is_branch_to_addr(iptr, addr));
 
 	/* Branch to self - 0x100 */
 	err = create_cond_branch(&instr, iptr, addr - 0x100, flags);
-	check(instr_is_branch_to_addr(&instr, addr - 0x100));
+	patch_instruction(iptr, instr);
+	check(instr_is_branch_to_addr(iptr, addr - 0x100));
 
 	/* Branch to self + 0x100 */
 	err = create_cond_branch(&instr, iptr, addr + 0x100, flags);
-	check(instr_is_branch_to_addr(&instr, addr + 0x100));
+	patch_instruction(iptr, instr);
+	check(instr_is_branch_to_addr(iptr, addr + 0x100));
 
 	/* Maximum relative negative offset, - 32 KB */
 	err = create_cond_branch(&instr, iptr, addr - 0x8000, flags);
-	check(instr_is_branch_to_addr(&instr, addr - 0x8000));
+	patch_instruction(iptr, instr);
+	check(instr_is_branch_to_addr(iptr, addr - 0x8000));
 
 	/* Out of range relative negative offset, - 32 KB + 4*/
 	err = create_cond_branch(&instr, iptr, addr - 0x8004, flags);
@@ -576,7 +586,8 @@ static void __init test_branch_bform(void)
 
 	/* Check flags are masked correctly */
 	err = create_cond_branch(&instr, iptr, addr, 0xFFFFFFFC);
-	check(instr_is_branch_to_addr(&instr, addr));
+	patch_instruction(iptr, instr);
+	check(instr_is_branch_to_addr(iptr, addr));
 	check(ppc_inst_equal(instr, ppc_inst(0x43FF0000)));
 }
 
-- 
2.25.0

