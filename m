Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F4D33B1F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 13:00:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzZkF1kKxz3022
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 23:00:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzZjt6P0wz2y8C
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 23:00:12 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DzZjc4bRnz9tyRV;
 Mon, 15 Mar 2021 13:00:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0HpYqaHq1lcH; Mon, 15 Mar 2021 13:00:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DzZjc3cHZz9tyRR;
 Mon, 15 Mar 2021 13:00:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B1F9A8B773;
 Mon, 15 Mar 2021 13:00:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id dpPoxwu5oRI6; Mon, 15 Mar 2021 13:00:09 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 83EA68B75B;
 Mon, 15 Mar 2021 13:00:09 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 74A49675DF; Mon, 15 Mar 2021 12:00:09 +0000 (UTC)
Message-Id: <e4d1aae7604d89c98a52dfd8ce8443462e595670.1615809591.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/math: Fix missing __user qualifier for get_user() and
 other sparse warnings
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 15 Mar 2021 12:00:09 +0000 (UTC)
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

Sparse reports the following problems:

arch/powerpc/math-emu/math.c:228:21: warning: Using plain integer as NULL pointer
arch/powerpc/math-emu/math.c:228:31: warning: Using plain integer as NULL pointer
arch/powerpc/math-emu/math.c:228:41: warning: Using plain integer as NULL pointer
arch/powerpc/math-emu/math.c:228:51: warning: Using plain integer as NULL pointer
arch/powerpc/math-emu/math.c:237:13: warning: incorrect type in initializer (different address spaces)
arch/powerpc/math-emu/math.c:237:13:    expected unsigned int [noderef] __user *_gu_addr
arch/powerpc/math-emu/math.c:237:13:    got unsigned int [usertype] *
arch/powerpc/math-emu/math.c:226:1: warning: symbol 'do_mathemu' was not declared. Should it be static?

Add missing __user qualifier when casting pointer used in get_user()

Use NULL instead of 0 to initialise opX local variables.

Add a prototype for do_mathemu() (Added in processor.h like sparc)

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/processor.h | 2 ++
 arch/powerpc/kernel/traps.c          | 1 -
 arch/powerpc/math-emu/math.c         | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 8acc3590c971..f21834a1d32e 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -417,6 +417,8 @@ extern int fix_alignment(struct pt_regs *);
 #define NET_IP_ALIGN	0
 #endif
 
+int do_mathemu(struct pt_regs *regs);
+
 #endif /* __KERNEL__ */
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_PROCESSOR_H */
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index d615cd7ebfae..3cafbde7a51c 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1406,7 +1406,6 @@ int is_valid_bugaddr(unsigned long addr)
 static int emulate_math(struct pt_regs *regs)
 {
 	int ret;
-	extern int do_mathemu(struct pt_regs *regs);
 
 	ret = do_mathemu(regs);
 	if (ret >= 0)
diff --git a/arch/powerpc/math-emu/math.c b/arch/powerpc/math-emu/math.c
index 30b4b69c6941..327165f26ca6 100644
--- a/arch/powerpc/math-emu/math.c
+++ b/arch/powerpc/math-emu/math.c
@@ -225,7 +225,7 @@ record_exception(struct pt_regs *regs, int eflag)
 int
 do_mathemu(struct pt_regs *regs)
 {
-	void *op0 = 0, *op1 = 0, *op2 = 0, *op3 = 0;
+	void *op0 = NULL, *op1 = NULL, *op2 = NULL, *op3 = NULL;
 	unsigned long pc = regs->nip;
 	signed short sdisp;
 	u32 insn = 0;
@@ -234,7 +234,7 @@ do_mathemu(struct pt_regs *regs)
 	int type = 0;
 	int eflag, trap;
 
-	if (get_user(insn, (u32 *)pc))
+	if (get_user(insn, (u32 __user *)pc))
 		return -EFAULT;
 
 	switch (insn >> 26) {
-- 
2.25.0

