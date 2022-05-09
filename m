Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E806951F3FF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 07:43:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxVSt6Vf8z3fjT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 15:43:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxVLd6KzPz3cjQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 15:37:45 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KxVKZ1snjz9sW1;
 Mon,  9 May 2022 07:36:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7KM8SCAmtaN8; Mon,  9 May 2022 07:36:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF61W9z9sW5;
 Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C5DC38B76D;
 Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KUMmZ8YwXu2A; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 700BE8B77E;
 Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aSip1591215
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 9 May 2022 07:36:28 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aSXm1591214;
 Mon, 9 May 2022 07:36:28 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH v3 02/25] powerpc/ftrace: Remove redundant create_branch()
 calls
Date: Mon,  9 May 2022 07:36:00 +0200
Message-Id: <aa45fbad0b4b7493080835d8276c0cb4ce146503.1652074503.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1652074581; l=2368; s=20211009;
 h=from:subject:message-id; bh=92KxuX0pLpQCITr7vgjlWnrEBj5V6cm1CJL4gIXJC9A=;
 b=P/AWRwH7skYub8t+ORIyGISWSRXUZdLajW1CEaI3+PeSm1R/TwnZ/Q+9vApeitoRcpcaqYOGH/tq
 wbUnYj5dAYKNXm0WKBGoJs4YoOfrvbQMr9PqYAyZVFNc2ughK44y
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

Since commit d5937db114e4 ("powerpc/code-patching: Fix patch_branch()
return on out-of-range failure") patch_branch() fails with -ERANGE
when trying to branch out of range.

No need to perform the test twice. Remove redundant create_branch()
calls.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 7a266fd469b7..3ce3697e8a7c 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -301,7 +301,6 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 	int i;
 	ppc_inst_t op;
 	unsigned long ptr;
-	ppc_inst_t instr;
 	static unsigned long ftrace_plt_tramps[NUM_FTRACE_TRAMPS];
 
 	/* Is this a known long jump tramp? */
@@ -344,12 +343,6 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 #else
 	ptr = ppc_global_function_entry((void *)ftrace_caller);
 #endif
-	if (create_branch(&instr, (void *)tramp, ptr, 0)) {
-		pr_debug("%ps is not reachable from existing mcount tramp\n",
-				(void *)ptr);
-		return -1;
-	}
-
 	if (patch_branch((u32 *)tramp, ptr, 0)) {
 		pr_debug("REL24 out of range!\n");
 		return -1;
@@ -490,7 +483,6 @@ static int
 __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
 	ppc_inst_t op[2];
-	ppc_inst_t instr;
 	void *ip = (void *)rec->ip;
 	unsigned long entry, ptr, tramp;
 	struct module *mod = rec->arch.mod;
@@ -539,12 +531,6 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 		return -EINVAL;
 	}
 
-	/* Ensure branch is within 24 bits */
-	if (create_branch(&instr, ip, tramp, BRANCH_SET_LINK)) {
-		pr_err("Branch out of range\n");
-		return -EINVAL;
-	}
-
 	if (patch_branch(ip, tramp, BRANCH_SET_LINK)) {
 		pr_err("REL24 out of range!\n");
 		return -EINVAL;
@@ -770,12 +756,6 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 		return -EINVAL;
 	}
 
-	/* Ensure branch is within 24 bits */
-	if (create_branch(&op, (u32 *)ip, tramp, BRANCH_SET_LINK)) {
-		pr_err("Branch out of range\n");
-		return -EINVAL;
-	}
-
 	if (patch_branch((u32 *)ip, tramp, BRANCH_SET_LINK)) {
 		pr_err("REL24 out of range!\n");
 		return -EINVAL;
-- 
2.35.1

