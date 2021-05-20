Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2430038A65A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 12:25:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm5Tq0t8vz3cMy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 20:25:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm5Rh5LW4z3bwk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 20:23:28 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fm5RH3PZcz9sW0;
 Thu, 20 May 2021 12:23:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8cvxuwLBOrQR; Thu, 20 May 2021 12:23:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fm5RH2B6gz9sVn;
 Thu, 20 May 2021 12:23:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 184618B811;
 Thu, 20 May 2021 12:23:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gBIaUxxCNBtm; Thu, 20 May 2021 12:23:06 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 78ACE8B80D;
 Thu, 20 May 2021 12:23:06 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 61E3064C44; Thu, 20 May 2021 10:23:06 +0000 (UTC)
Message-Id: <98fd4d717810b7c4032a1edf62dd6fe638e64329.1621506159.git.christophe.leroy@csgroup.eu>
In-Reply-To: <5d146b31b943e7ad674894421db4feef54804b9b.1621506159.git.christophe.leroy@csgroup.eu>
References: <5d146b31b943e7ad674894421db4feef54804b9b.1621506159.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 07/12] powerpc/ftrace: Use PPC_RAW_MFLR() and PPC_RAW_NOP()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Date: Thu, 20 May 2021 10:23:06 +0000 (UTC)
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

Use PPC_RAW_MFLR() instead of open coding with PPC_INST_MFLR.

Same for PPC_INST_NOP.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 937220310f99..a787a414ea6b 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -162,7 +162,7 @@ __ftrace_make_nop(struct module *mod,
 
 #ifdef CONFIG_MPROFILE_KERNEL
 	/* When using -mkernel_profile there is no load to jump over */
-	pop = ppc_inst(PPC_INST_NOP);
+	pop = ppc_inst(PPC_RAW_NOP());
 
 	if (copy_inst_from_kernel_nofault(&op, (void *)(ip - 4))) {
 		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
@@ -170,7 +170,7 @@ __ftrace_make_nop(struct module *mod,
 	}
 
 	/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
-	if (!ppc_inst_equal(op, ppc_inst(PPC_INST_MFLR)) &&
+	if (!ppc_inst_equal(op, ppc_inst(PPC_RAW_MFLR(_R0))) &&
 	    !ppc_inst_equal(op, ppc_inst(PPC_INST_STD_LR))) {
 		pr_err("Unexpected instruction %s around bl _mcount\n",
 		       ppc_inst_as_str(op));
@@ -278,7 +278,7 @@ __ftrace_make_nop(struct module *mod,
 		return -EINVAL;
 	}
 
-	op = ppc_inst(PPC_INST_NOP);
+	op = ppc_inst(PPC_RAW_NOP());
 
 	if (patch_instruction((struct ppc_inst *)ip, op))
 		return -EPERM;
@@ -424,7 +424,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		}
 	}
 
-	if (patch_instruction((struct ppc_inst *)ip, ppc_inst(PPC_INST_NOP))) {
+	if (patch_instruction((struct ppc_inst *)ip, ppc_inst(PPC_RAW_NOP()))) {
 		pr_err("Patching NOP failed.\n");
 		return -EPERM;
 	}
@@ -446,7 +446,7 @@ int ftrace_make_nop(struct module *mod,
 	if (test_24bit_addr(ip, addr)) {
 		/* within range */
 		old = ftrace_call_replace(ip, addr, 1);
-		new = ppc_inst(PPC_INST_NOP);
+		new = ppc_inst(PPC_RAW_NOP());
 		return ftrace_modify_code(ip, old, new);
 	} else if (core_kernel_text(ip))
 		return __ftrace_make_nop_kernel(rec, addr);
@@ -510,7 +510,7 @@ static int
 expected_nop_sequence(void *ip, struct ppc_inst op0, struct ppc_inst op1)
 {
 	/* look for patched "NOP" on ppc64 with -mprofile-kernel */
-	if (!ppc_inst_equal(op0, ppc_inst(PPC_INST_NOP)))
+	if (!ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP())))
 		return 0;
 	return 1;
 }
@@ -596,7 +596,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 		return -EFAULT;
 
 	/* It should be pointing to a nop */
-	if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_NOP))) {
+	if (!ppc_inst_equal(op,  ppc_inst(PPC_RAW_NOP()))) {
 		pr_err("Expected NOP but have %s\n", ppc_inst_as_str(op));
 		return -EINVAL;
 	}
@@ -653,7 +653,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		return -EFAULT;
 	}
 
-	if (!ppc_inst_equal(op, ppc_inst(PPC_INST_NOP))) {
+	if (!ppc_inst_equal(op, ppc_inst(PPC_RAW_NOP()))) {
 		pr_err("Unexpected call sequence at %p: %s\n", ip, ppc_inst_as_str(op));
 		return -EINVAL;
 	}
@@ -684,7 +684,7 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	 */
 	if (test_24bit_addr(ip, addr)) {
 		/* within range */
-		old = ppc_inst(PPC_INST_NOP);
+		old = ppc_inst(PPC_RAW_NOP());
 		new = ftrace_call_replace(ip, addr, 1);
 		return ftrace_modify_code(ip, old, new);
 	} else if (core_kernel_text(ip))
-- 
2.25.0

