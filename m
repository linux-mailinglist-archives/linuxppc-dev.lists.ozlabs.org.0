Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF4974F4AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:16:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0mGQ1gsMz3hKy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:16:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0m6f2bblz3c9s
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 02:10:01 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4R0m5V4hWyz9sFP;
	Tue, 11 Jul 2023 18:09:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s0xjpf3Cf8Xk; Tue, 11 Jul 2023 18:09:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4R0m5C609Hz9sFR;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C9C828B763;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id giaowgQi7Vvt; Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.184])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D7F0E8B77D;
	Tue, 11 Jul 2023 18:08:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 36BG8j0U3696832
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 18:08:45 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 36BG8jRf3696831;
	Tue, 11 Jul 2023 18:08:45 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v4 08/15] objtool: Track general purpose register used for switch table base
Date: Tue, 11 Jul 2023 18:08:34 +0200
Message-ID: <09a51f61dca0eb7d2a448b88d9b4ef2853df229f.1689091394.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1689091394.git.christophe.leroy@csgroup.eu>
References: <cover.1689091394.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689091705; l=5330; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=jSX08wGhmyYeQdnc4/mndFd0/Va8aTjRzvV2Pq5SbcY=; b=AWO4XAaGal72ZQpHsbX4CCq0Ln4LfTwpvD423uaUqC21QY3Q0pyAgpAFCGQuunhYiv/39Tezp oiyNon86hCtBtku6zFPKoW41QJ/kXT+nzFJUSedSC5tHgN6Q7ZW/h8l
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

A function can contain nested switch tables using different registers
as base address.

In order to avoid failure in tracking those switch tables, the register
containing the base address needs to be taken into account.

To do so, add a 5 bits field in struct instruction that will hold the
ID of the register containing the base address of the switch table and
take that register into account during the backward search in order to
not stop the walk when encountering a jump related to another switch
table.

On architectures not handling it, the ID stays nul and has no impact
on the search.

To enable that, also provide to arch_find_switch_table() the dynamic
instruction related to a table search.

Also allow prev_insn_same_sec() to be used outside check.c so that
architectures can backward walk through instruction to find out which
register is used as base address for a switch table.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/arch/powerpc/special.c    | 3 ++-
 tools/objtool/arch/x86/special.c        | 3 ++-
 tools/objtool/check.c                   | 9 +++++----
 tools/objtool/include/objtool/check.h   | 6 ++++--
 tools/objtool/include/objtool/special.h | 3 ++-
 5 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/tools/objtool/arch/powerpc/special.c b/tools/objtool/arch/powerpc/special.c
index d33868147196..a7dd2559b536 100644
--- a/tools/objtool/arch/powerpc/special.c
+++ b/tools/objtool/arch/powerpc/special.c
@@ -13,7 +13,8 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 }
 
 struct reloc *arch_find_switch_table(struct objtool_file *file,
-				    struct instruction *insn)
+				     struct instruction *insn,
+				     struct instruction *orig_insn)
 {
 	exit(-1);
 }
diff --git a/tools/objtool/arch/x86/special.c b/tools/objtool/arch/x86/special.c
index 8e8302fe909f..8cf17d94c69b 100644
--- a/tools/objtool/arch/x86/special.c
+++ b/tools/objtool/arch/x86/special.c
@@ -86,7 +86,8 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
  *    NOTE: RETPOLINE made it harder still to decode dynamic jumps.
  */
 struct reloc *arch_find_switch_table(struct objtool_file *file,
-				    struct instruction *insn)
+				     struct instruction *insn,
+				     struct instruction *orig_insn)
 {
 	struct reloc  *text_reloc, *rodata_reloc;
 	struct section *table_sec;
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index d51f47c4a3bd..be413c578588 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -80,8 +80,8 @@ static struct instruction *next_insn_same_func(struct objtool_file *file,
 	return find_insn(file, func->cfunc->sec, func->cfunc->offset);
 }
 
-static struct instruction *prev_insn_same_sec(struct objtool_file *file,
-					      struct instruction *insn)
+struct instruction *prev_insn_same_sec(struct objtool_file *file,
+				       struct instruction *insn)
 {
 	if (insn->idx == 0) {
 		if (insn->prev_len)
@@ -2064,7 +2064,8 @@ static struct reloc *find_jump_table(struct objtool_file *file,
 	     insn && insn_func(insn) && insn_func(insn)->pfunc == func;
 	     insn = insn->first_jump_src ?: prev_insn_same_sym(file, insn)) {
 
-		if (insn != orig_insn && insn->type == INSN_JUMP_DYNAMIC)
+		if (insn != orig_insn && insn->type == INSN_JUMP_DYNAMIC &&
+		    insn->gpr == orig_insn->gpr)
 			break;
 
 		/* allow small jumps within the range */
@@ -2074,7 +2075,7 @@ static struct reloc *find_jump_table(struct objtool_file *file,
 		     insn->jump_dest->offset > orig_insn->offset))
 		    break;
 
-		table_reloc = arch_find_switch_table(file, insn);
+		table_reloc = arch_find_switch_table(file, insn, orig_insn);
 		if (!table_reloc)
 			continue;
 
diff --git a/tools/objtool/include/objtool/check.h b/tools/objtool/include/objtool/check.h
index daa46f1f0965..660ea9d0393e 100644
--- a/tools/objtool/include/objtool/check.h
+++ b/tools/objtool/include/objtool/check.h
@@ -63,8 +63,9 @@ struct instruction {
 	    noendbr		: 1,
 	    unret		: 1,
 	    visited		: 4,
-	    no_reloc		: 1;
-		/* 10 bit hole */
+	    no_reloc		: 1,
+	    gpr			: 5;
+		/* 5 bit hole */
 
 	struct alt_group *alt_group;
 	struct instruction *jump_dest;
@@ -115,6 +116,7 @@ struct instruction *find_insn(struct objtool_file *file,
 			      struct section *sec, unsigned long offset);
 
 struct instruction *next_insn_same_sec(struct objtool_file *file, struct instruction *insn);
+struct instruction *prev_insn_same_sec(struct objtool_file *file, struct instruction *insn);
 
 #define sec_for_each_insn(file, _sec, insn)				\
 	for (insn = find_insn(file, _sec, 0);				\
diff --git a/tools/objtool/include/objtool/special.h b/tools/objtool/include/objtool/special.h
index 86d4af9c5aa9..4128a479d76e 100644
--- a/tools/objtool/include/objtool/special.h
+++ b/tools/objtool/include/objtool/special.h
@@ -38,5 +38,6 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 				 struct instruction *insn,
 				 struct reloc *reloc);
 struct reloc *arch_find_switch_table(struct objtool_file *file,
-				    struct instruction *insn);
+				     struct instruction *insn,
+				     struct instruction *orig_insn);
 #endif /* _SPECIAL_H */
-- 
2.41.0

