Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D5774F485
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:10:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0m7R2Zwqz3dks
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:10:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0m5Y3Q17z3clL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 02:09:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4R0m5D0nkTz9sFT;
	Tue, 11 Jul 2023 18:08:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9wCSTBZkkZoi; Tue, 11 Jul 2023 18:08:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4R0m5C2NQTz9sFD;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4DAF58B77A;
	Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id u9tlFbpuG58J; Tue, 11 Jul 2023 18:08:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.184])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C99388B763;
	Tue, 11 Jul 2023 18:08:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 36BG8jU73696836
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 18:08:45 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 36BG8jnx3696835;
	Tue, 11 Jul 2023 18:08:45 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v4 09/15] objtool: Find end of switch table directly
Date: Tue, 11 Jul 2023 18:08:35 +0200
Message-ID: <0465b564b9ac13b801fcd00b8395214050dc0d83.1689091394.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1689091394.git.christophe.leroy@csgroup.eu>
References: <cover.1689091394.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689091706; l=3695; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=XTf90OFsPllQCIzbIedSyHe0CqF3MMBuqTFyPQCeHPM=; b=+b6uGgE+bj1HDE28CR5o2blLXJm7eAOWbdzQOfKHLBsbneDL3YVxpbv5H7EqG7iFgDiCanATi KhbORFM7AG6BbrkfkcF3++jcBjno+dBirbu5w7L9WX+WDBU6EpGzkez
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

At the time being, the end of a switch table can only be known
once the start of the following switch table has ben located.

This is a problem when switch tables are nested because until the first
switch table is properly added, the second one cannot be located as a
the backward walk will abut on the dynamic switch of the previous one.

So perform a first forward walk in the code in order to locate all
possible relocations to switch tables and build a local table with
those relocations. Later on once one switch table is found, go through
this local table to know where next switch table starts.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/objtool/check.c | 62 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index be413c578588..361c832aefc8 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2094,14 +2094,30 @@ static struct reloc *find_jump_table(struct objtool_file *file,
 	return NULL;
 }
 
+static struct reloc *find_next_table(struct instruction *insn,
+				     struct reloc **table, unsigned int size)
+{
+	unsigned long offset = reloc_offset(insn_jump_table(insn));
+	int i;
+	struct reloc *reloc = NULL;
+
+	for (i = 0; i < size; i++) {
+		if (reloc_offset(table[i]) > offset &&
+		    (!reloc || reloc_offset(table[i]) < reloc_offset(reloc)))
+			reloc = table[i];
+	}
+	return reloc;
+}
+
 /*
  * First pass: Mark the head of each jump table so that in the next pass,
  * we know when a given jump table ends and the next one starts.
  */
 static int mark_add_func_jump_tables(struct objtool_file *file,
-				     struct symbol *func)
+				     struct symbol *func,
+				     struct reloc **table, unsigned int size)
 {
-	struct instruction *insn, *last = NULL, *insn_t1 = NULL, *insn_t2;
+	struct instruction *insn, *last = NULL;
 	struct reloc *reloc;
 	int ret = 0;
 
@@ -2132,23 +2148,11 @@ static int mark_add_func_jump_tables(struct objtool_file *file,
 		else
 			continue;
 
-		if (!insn_t1) {
-			insn_t1 = insn;
-			continue;
-		}
-
-		insn_t2 = insn;
-
-		ret = add_jump_table(file, insn_t1, insn_jump_table(insn_t2));
+		ret = add_jump_table(file, insn, find_next_table(insn, table, size));
 		if (ret)
 			return ret;
-
-		insn_t1 = insn_t2;
 	}
 
-	if (insn_t1)
-		ret = add_jump_table(file, insn_t1, NULL);
-
 	return ret;
 }
 
@@ -2161,15 +2165,41 @@ static int add_jump_table_alts(struct objtool_file *file)
 {
 	struct symbol *func;
 	int ret;
+	struct instruction *insn;
+	unsigned int size = 0, i = 0;
+	struct reloc **table = NULL;
 
 	if (!file->rodata)
 		return 0;
 
+	for_each_insn(file, insn) {
+		struct instruction *dest_insn;
+		struct reloc *reloc;
+
+		func = insn_func(insn) ? insn_func(insn)->pfunc : NULL;
+		reloc = arch_find_switch_table(file, insn, NULL);
+		/*
+		 * Each table entry has a rela associated with it.  The rela
+		 * should reference text in the same function as the original
+		 * instruction.
+		 */
+		if (!reloc)
+			continue;
+		dest_insn = find_insn(file, reloc->sym->sec, reloc_addend(reloc));
+		if (!dest_insn || !insn_func(dest_insn) || insn_func(dest_insn)->pfunc != func)
+			continue;
+		if (i == size) {
+			size += 1024;
+			table = realloc(table, size * sizeof(*table));
+		}
+		table[i++] = reloc;
+	}
+
 	for_each_sym(file, func) {
 		if (func->type != STT_FUNC)
 			continue;
 
-		ret = mark_add_func_jump_tables(file, func);
+		ret = mark_add_func_jump_tables(file, func, table, i);
 		if (ret)
 			return ret;
 	}
-- 
2.41.0

