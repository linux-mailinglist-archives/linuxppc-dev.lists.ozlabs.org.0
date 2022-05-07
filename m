Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E8651E4BC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 08:48:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwJ132Wv4z3byZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 16:48:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwHzc6vJWz3cFM
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 16:47:08 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KwHzH28CFz9sVh;
 Sat,  7 May 2022 08:46:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aOlhLCv8E4YZ; Sat,  7 May 2022 08:46:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KwHzD56Tzz9sVl;
 Sat,  7 May 2022 08:46:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 969B18B76D;
 Sat,  7 May 2022 08:46:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fv9n39f4n6Wv; Sat,  7 May 2022 08:46:48 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EED308B773;
 Sat,  7 May 2022 08:46:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2476kcoY1320477
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 7 May 2022 08:46:39 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2476kc8Z1320476;
 Sat, 7 May 2022 08:46:38 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH v2 02/25] powerpc/ftrace: Remove redundant create_branch()
 calls
Date: Sat,  7 May 2022 08:46:04 +0200
Message-Id: <aa45fbad0b4b7493080835d8276c0cb4ce146503.1651905939.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651905939.git.christophe.leroy@csgroup.eu>
References: <cover.1651905939.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1651905980; l=2368; s=20211009;
 h=from:subject:message-id; bh=92KxuX0pLpQCITr7vgjlWnrEBj5V6cm1CJL4gIXJC9A=;
 b=v5wrxFdpmHiXp0z0lDWOo/edEDJQssoY/KzbQqwAmckAE5TQKa0T0XdbBH4VFxx7Nl7vX0yBbfwH
 b7TLjoFKBhShgZisPhAfPmst4BBaSV5zNKlqkfgER0P2bL8/MFaf
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

