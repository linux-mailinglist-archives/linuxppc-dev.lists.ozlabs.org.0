Return-Path: <linuxppc-dev+bounces-5321-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9874A12EB0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 23:51:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLnl3ybCz3dD2;
	Thu, 16 Jan 2025 09:51:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736981467;
	cv=none; b=LEiixP9f3zrslKYFom0tGcg/1LEk9NsBrZ9SJAHW4oEleLgQDuONUPN0njsGBiP8WGRC2w98IYdXGP2Svjf8j3LnHdFxpuG6y/lZtJLVxyo+5IHkrWKi8qKfBghTUXQDr9zbQtVGT7+uF4HBtmf7M3/K2T06QR+2CFnZDCDXf9I1rLWGDuQ8KtkI32PyuIyLzU3z8uWmN3yKYN7KnGqgzx9dcp5MW9tDoN8GsvoiKXkVv3BEz0qT83iE9agj21wJAvbeoibOFqvZnXwUsimG+j1DBq6XcfabFsY/LHrLmXbcXSu+qe/R2VW7EHGTOj7XW8p7pL/SRYRQxlFwGFClJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736981467; c=relaxed/relaxed;
	bh=8Lnw81hgpYIp26h5OTmgSGjywxNBUpyvDG6kBlic1co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNC1R25+941sdojvoN4mmUDyyR3GkCb3/1L2+Zjm1rQPhJbUHt5pvhPF1FnMzfX8dwnb35HP6xUxIpwG+7v/+4YIfqvnT6ebnOkXDT1bfLDrcCz9+YAm4qkwBRk2G2fMo+ZfBEF8nw0xHCa5Hi1to4PU3RDs7JAXSwwGe1PgktY8jDxmQ5J81IB5V5OI/vWcOo/SpMuPiDRVUqTpbJQSpEGYSFdqe+AzVfK08nFJgWRBmA9Ga1m5XhrHg6Fg6UogIIrgdt7EdqR5cyFsGtyI44G3yow+J2LlmVuUXEdnfsXcZ+846p1S2Pr9gKxC3SP0ROz2fbf1FdbFYRHpj8LISQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLnk6FrVz3cgM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 09:51:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcZ6D8Cz9sSW;
	Wed, 15 Jan 2025 23:43:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IXAcOl9CibBJ; Wed, 15 Jan 2025 23:43:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcZ5DQSz9sSV;
	Wed, 15 Jan 2025 23:43:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F8058B77A;
	Wed, 15 Jan 2025 23:43:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id aK_2SN5iBKqh; Wed, 15 Jan 2025 23:43:10 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 461A68B774;
	Wed, 15 Jan 2025 23:43:08 +0100 (CET)
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
Subject: [PATCH v5 08/15] objtool: Track general purpose register used for switch table base
Date: Wed, 15 Jan 2025 23:42:48 +0100
Message-ID: <36ab728d242109aeb3fe5464123a2da672f406d6.1736955567.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980963; l=5395; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=U81L49Nw0AgeWOM9sdxxGuzlO2Zt+79EWQdKerlwdC8=; b=/3AoT0IbBunpN8fIeZAmfBT1tDugFsaMy4vciiR2Ev7oz0U4eNfGYGo6t94PhVVi+ekkjoRdX oZPEEnQZ95iBlA6yAatcKE7QMTV7e2XcrslIHcfUSzy7jcqVJbmAahm
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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
index 51610689abf7..0b3a766c4842 100644
--- a/tools/objtool/arch/powerpc/special.c
+++ b/tools/objtool/arch/powerpc/special.c
@@ -14,7 +14,8 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 
 struct reloc *arch_find_switch_table(struct objtool_file *file,
 				     struct instruction *insn,
-				     unsigned long *table_size)
+				     unsigned long *table_size,
+				     struct instruction *orig_insn)
 {
 	exit(-1);
 }
diff --git a/tools/objtool/arch/x86/special.c b/tools/objtool/arch/x86/special.c
index 76c7933bcb19..b0147923a70c 100644
--- a/tools/objtool/arch/x86/special.c
+++ b/tools/objtool/arch/x86/special.c
@@ -110,7 +110,8 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
  */
 struct reloc *arch_find_switch_table(struct objtool_file *file,
 				     struct instruction *insn,
-				     unsigned long *table_size)
+				     unsigned long *table_size,
+				     struct instruction *orig_insn)
 {
 	struct reloc  *text_reloc, *rodata_reloc;
 	struct section *table_sec;
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 613d169eb6b8..72b977f81dd6 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -81,8 +81,8 @@ static struct instruction *next_insn_same_func(struct objtool_file *file,
 	return find_insn(file, func->cfunc->sec, func->cfunc->offset);
 }
 
-static struct instruction *prev_insn_same_sec(struct objtool_file *file,
-					      struct instruction *insn)
+struct instruction *prev_insn_same_sec(struct objtool_file *file,
+				       struct instruction *insn)
 {
 	if (insn->idx == 0) {
 		if (insn->prev_len)
@@ -2028,7 +2028,8 @@ static void find_jump_table(struct objtool_file *file, struct symbol *func,
 	     insn && insn_func(insn) && insn_func(insn)->pfunc == func;
 	     insn = insn->first_jump_src ?: prev_insn_same_sym(file, insn)) {
 
-		if (insn != orig_insn && insn->type == INSN_JUMP_DYNAMIC)
+		if (insn != orig_insn && insn->type == INSN_JUMP_DYNAMIC &&
+		    insn->gpr == orig_insn->gpr)
 			break;
 
 		/* allow small jumps within the range */
@@ -2038,7 +2039,7 @@ static void find_jump_table(struct objtool_file *file, struct symbol *func,
 		     insn->jump_dest->offset > orig_insn->offset))
 		    break;
 
-		table_reloc = arch_find_switch_table(file, insn, &table_size);
+		table_reloc = arch_find_switch_table(file, insn, &table_size, orig_insn);
 		if (!table_reloc)
 			continue;
 
diff --git a/tools/objtool/include/objtool/check.h b/tools/objtool/include/objtool/check.h
index e1cd13cd28a3..8b68f840dddb 100644
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
@@ -118,6 +119,7 @@ struct instruction *find_insn(struct objtool_file *file,
 			      struct section *sec, unsigned long offset);
 
 struct instruction *next_insn_same_sec(struct objtool_file *file, struct instruction *insn);
+struct instruction *prev_insn_same_sec(struct objtool_file *file, struct instruction *insn);
 
 #define sec_for_each_insn(file, _sec, insn)				\
 	for (insn = find_insn(file, _sec, 0);				\
diff --git a/tools/objtool/include/objtool/special.h b/tools/objtool/include/objtool/special.h
index e7ee7ffccefd..aca1f7762f5d 100644
--- a/tools/objtool/include/objtool/special.h
+++ b/tools/objtool/include/objtool/special.h
@@ -39,5 +39,6 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 				 struct reloc *reloc);
 struct reloc *arch_find_switch_table(struct objtool_file *file,
 				     struct instruction *insn,
-				     unsigned long *table_size);
+				     unsigned long *table_size,
+				     struct instruction *orig_insn);
 #endif /* _SPECIAL_H */
-- 
2.47.0


